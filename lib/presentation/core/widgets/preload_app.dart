import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pro_health_360/application/redux/actions/update_misc_state_action.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/value_objects/global_keys.dart';
import 'package:rxdart/src/streams/merge.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

import 'package:pro_health_360/application/communities/stream_token_provider.dart';
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/core/services/localization.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/check_token_action.dart';
import 'package:pro_health_360/application/redux/actions/set_push_token_action.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/onboarding/initial_route_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/app_name_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/infrastructure/connectivity/connectivity_interface.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/router_generator.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class PreLoadApp extends StatefulWidget {
  const PreLoadApp({
    super.key,
    required this.thisAppContexts,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
    required this.entryPointContext,
    required this.appStore,
    required this.client,
    this.fcmToken,
  });

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final stream.StreamChatClient client;
  final BuildContext entryPointContext;
  final String? fcmToken;
  final List<AppContext> thisAppContexts;

  @override
  _PreLoadAppState createState() => _PreLoadAppState();
}

class _PreLoadAppState extends State<PreLoadApp> with WidgetsBindingObserver {
  final ConnectivityChecker connectivityChecker = ConnectivityChecker.initial();
  StreamSubscription<bool>? connectivityCheckerSubscription;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final AppState? appState = StoreProvider.state<AppState>(context);
    final bool resumeWithPin = appState?.miscState?.resumeWithPin ?? false;
    if (state == AppLifecycleState.inactive && resumeWithPin) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateMiscStateAction(inactiveTime: DateTime.now().toString()),
      );
    }

    if (state == AppLifecycleState.resumed && shouldResumeWithPIN(appState)) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateMiscStateAction(resumeWithPin: true),
      );
      Navigator.pushReplacementNamed(
        appGlobalNavigatorKey.currentContext!,
        AppRoutes.resumeWithPin,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    StoreProvider.dispatch(
      context,
      CheckTokenAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
        refreshTokenEndpoint:
            AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivityCheckerSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch(
        context,
        CheckTokenAction(
          httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          refreshTokenEndpoint:
              AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
        ),
      );

      final ClientState? clientState =
          StoreProvider.state<AppState>(context)?.clientState;
      final User? user = clientState?.user;

      if (clientState?.clientProfile?.id != null &&
          clientState!.clientProfile!.id!.isNotEmpty &&
          clientState.clientProfile!.id! != UNKNOWN) {
        StoreProvider.dispatch(
          context,
          ConnectGetStreamUserAction(
            client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
            streamClient: widget.client,
            streamTokenProvider: StreamTokenProvider(
              client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
              endpoint: AppWrapperBase.of(context)!
                  .customContext!
                  .refreshStreamTokenEndpoint,
              saveToken: (String newToken) async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setString('streamToken', newToken);
                StoreProvider.dispatch(
                  context,
                  UpdateUserAction(user: user?.copyWith(streamToken: newToken)),
                );
              },
            ),
          ),
        );
      }

      StoreProvider.dispatch(
        context,
        SetPushToken(
          token: widget.fcmToken ?? '',
          client: AppWrapperBase.of(context)!.graphQLClient,
          streamClient: widget.client,
        ),
      );

      FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {
        StoreProvider.dispatch(
          context,
          SetPushToken(
            client: AppWrapperBase.of(context)!.graphQLClient,
            token: newToken,
            streamClient: widget.client,
          ),
        );
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        handleNotification(
          message,
          widget.client,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      builder: (BuildContext context, InitialRouteViewModel vm) {
        final String initialRoute = vm.initialRoute ?? AppRoutes.phoneLogin;

        if (initialRoute == UNKNOWN) {
          return OverlaySupport(
            child: MaterialApp(
              theme: AppTheme.getAppTheme(),
              home: const Scaffold(
                body: Center(child: PlatformLoader()),
              ),
              localizationsDelegates: localizationDelegates,
              supportedLocales: locales,
            ),
          );
        }

        return OverlaySupport(
          child: MaterialApp(
            theme: AppTheme.getAppTheme(),
            debugShowCheckedModeBanner: widget.appName == testAppName,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: initialRoute,
            navigatorKey: widget.appNavigatorKey,
            navigatorObservers: widget.appNavigatorObservers,
            localizationsDelegates: localizationDelegates,
            supportedLocales: locales,
            builder: (BuildContext context, Widget? childWidget) {
              connectivityCheckerSubscription = connectivityChecker
                  .checkConnection()
                  .asStream()
                  .mergeWith(
                    <Stream<bool>>[connectivityChecker.onConnectivityChanged],
                  )
                  .distinct()
                  .listen((bool hasConnection) {
                    final bool hasConn = StoreProvider.state<AppState>(context)
                            ?.connectivityState
                            ?.isConnected ??
                        false;

                    if (!hasConnection && hasConn) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(connectionLostText)),
                      );
                    }
                    StoreProvider.dispatch(
                      context,
                      UpdateConnectivityAction(hasConnection: hasConnection),
                    );
                  });
              return UserExceptionDialog<AppState>(
                child: stream.StreamChat(
                  client: widget.client,
                  child: childWidget,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
