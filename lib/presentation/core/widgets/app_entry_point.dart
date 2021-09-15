import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/presentation/core/widgets/preload_app.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';

import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({
    Key? key,
    required this.appStore,
    required this.thisAppContexts,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
  }) : super(key: key);

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final List<AppContext> thisAppContexts;

  @override
  _AppEntryPointState createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BeWellFacebookEvents().logger.logActivatedApp();
    } else {
      BeWellFacebookEvents().logger.logDeactivatedApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    EndPointsContextSubject().contexts.add(widget.thisAppContexts);

    return StoreProvider<AppState>(
      key: globalStoreKey,
      store: widget.appStore,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) {
          return store.state;
        },
        builder: (BuildContext context, AppState appState) {
          return AppWrapper(
            appName: widget.appName,
            appContexts: widget.thisAppContexts,
            graphQLClient: GraphQlClient(
                appState.userProfileState!.auth!.idToken!,
                EndpointContext.getGraphQLEndpoint(widget.thisAppContexts)),
            child: Builder(
              builder: (BuildContext ctx) {
                return PreLoadApp(
                  appState: appState,
                  thisAppContexts: widget.thisAppContexts,
                  appName: widget.appName,
                  appNavigatorKey: widget.appNavigatorKey,
                  appNavigatorObservers: widget.appNavigatorObservers,
                  entryPointContext: ctx,
                  appStore: widget.appStore,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
