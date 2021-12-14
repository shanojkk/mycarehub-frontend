// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/infrastructure/connecitivity/connectivity_interface.dart';
import 'package:myafyahub/presentation/core/widgets/app_entry_point.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({
    Key? key,
    required this.navigatorObserver,
    required this.store,
    required this.connectivityStatus,
    required this.navigatorKey,
    required this.appSetupData,
  }) : super(key: key);

  final NavigatorObserver navigatorObserver;
  final Store<AppState> store;
  final ConnectivityStatus connectivityStatus;
  final GlobalKey<NavigatorState> navigatorKey;
  final AppSetupData appSetupData;

  @override
  Widget build(BuildContext context) {
    return AppEntryPoint(
      appSetupData: appSetupData,
      appStore: store,
      appName: testAppName,
      appNavigatorKey: navigatorKey,
      connectivityStatus: connectivityStatus,
      appNavigatorObservers: <NavigatorObserver>[
        navigatorObserver,
        SentryNavigatorObserver(),
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
    );
  }
}