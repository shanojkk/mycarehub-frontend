// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/app_wrapper/app_wrapper.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/localization.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/app_name_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/global_keys.dart';
import 'package:pro_health_360/presentation/router/router_generator.dart';

Future<void> buildTestWidget({
  required WidgetTester tester,
  required Store<AppState> store,
  required IGraphQlClient client,
  required Widget widget,
  List<NavigatorObserver>? navigatorObservers,
  Duration? duration,
}) async {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'DEMO_SENTRY_DNS': 'test_demo_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
    'DEV_STREAM_API_KEY': 'dev_stream_api_key',
    'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
    'PROD_STREAM_API_KEY': 'prod_stream_api_key',
  });

  NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

  return tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: AppWrapper(
        appName: appName,
        appContexts: testAppContexts,
        graphQLClient: client,
        baseContext: devAppSetupData.customContext,
        communitiesClient: client,
        child: MaterialApp(
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
          navigatorKey: appGlobalNavigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
          home: Scaffold(
            body: Center(
              child: widget,
            ),
          ),
        ),
      ),
    ),
    duration,
  );
}

Future<void> advanceAndPump({
  required Widget widget,
  required WidgetTester tester,
  required void Function(Duration) updateTime,
  required Store<AppState> store,
  required IGraphQlClient client,
  List<NavigatorObserver>? navigatorObservers,
  Duration duration = Duration.zero,
}) async {
  updateTime(duration);

  await buildTestWidget(
    tester: tester,
    widget: widget,
    duration: duration,
    store: store,
    client: client,
    navigatorObservers: navigatorObservers,
  );

  await tester.pumpAndSettle();
}
