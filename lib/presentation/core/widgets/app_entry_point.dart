// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/widgets/preload_app.dart';
import 'package:sghi_core/app_wrapper/app_wrapper.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({
    super.key,
    required this.appStore,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
    required this.appSetupData,
    this.fcmToken,
  });

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final AppSetupData appSetupData;
  final String? fcmToken;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreKey,
      store: appStore,
      child: StoreConnector<AppState, AppEntryPointViewModel>(
        vm: () => AppEntryPointViewModelFactory(),
        builder: (BuildContext context, AppEntryPointViewModel vm) {
          final String idToken = vm.idToken ?? '';
          final String graphqlEndpoint =
              appSetupData.customContext!.graphqlEndpoint;
          final String refreshTokenEndpoint =
              appSetupData.customContext?.refreshTokenEndpoint ?? '';
          final String userID = vm.userId ?? '';

          final String communitiesAccessToken = vm.communitiesAccessToken ?? '';

          return AppWrapper(
            appName: appName,
            appContexts: appSetupData.appContexts,
            graphQLClient: CustomClient(
              idToken,
              graphqlEndpoint,
              context: context,
              refreshTokenEndpoint: refreshTokenEndpoint,
              userID: userID,
            ),
            communitiesClient: CustomClient(
              communitiesAccessToken,
              graphqlEndpoint,
              context: context,
              refreshTokenEndpoint: refreshTokenEndpoint,
              userID: userID,
            ),
            baseContext: appSetupData.customContext,
            child: PreLoadApp(
              thisAppContexts: appSetupData.appContexts,
              appName: appName,
              appNavigatorKey: appNavigatorKey,
              appNavigatorObservers: appNavigatorObservers,
              entryPointContext: context,
              appStore: appStore,
              fcmToken: fcmToken,
            ),
          );
        },
      ),
    );
  }
}

class AppEntryPointViewModelFactory extends VmFactory<AppState, AppEntryPoint> {
  @override
  AppEntryPointViewModel fromStore() {
    return AppEntryPointViewModel(
      idToken: state.credentials?.idToken,
      userId: state.clientState?.clientProfile?.user?.userId,
      communitiesAccessToken: state.chatState?.userProfile?.accessToken,
    );
  }
}

class AppEntryPointViewModel extends Vm {
  AppEntryPointViewModel({
    required this.idToken,
    required this.userId,
    required this.communitiesAccessToken,
  }) : super(equals: <Object?>[idToken, userId, communitiesAccessToken]);

  final String? idToken;
  final String? userId;
  final String? communitiesAccessToken;
}
