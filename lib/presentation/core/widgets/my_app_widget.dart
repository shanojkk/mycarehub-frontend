// Flutter imports:
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/core/widgets/app_entry_point.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({
    super.key,
    required this.navigatorObserver,
    required this.store,
    required this.navigatorKey,
    required this.appSetupData,
    required this.analyticsObserver,
    required this.appName,
    this.fcmToken,
  });

  final NavigatorObserver navigatorObserver;
  final FirebaseAnalyticsObserver analyticsObserver;
  final Store<AppState> store;
  final GlobalKey<NavigatorState> navigatorKey;
  final AppSetupData appSetupData;
  final String? fcmToken;
  final String appName;

  @override
  Widget build(BuildContext context) {
    return AppEntryPoint(
      appSetupData: appSetupData,
      appStore: store,
      appName: appName,
      appNavigatorKey: navigatorKey,
      fcmToken: fcmToken,
      appNavigatorObservers: <NavigatorObserver>[
        navigatorObserver,
        SentryNavigatorObserver(),
        analyticsObserver,
      ],
    );
  }
}
