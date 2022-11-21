import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_database_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/global_keys.dart';
import 'package:pro_health_360/infrastructure/repository/database_state_persistor.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/my_app_widget.dart';

Future<void> appBootStrap(List<AppContext> appContexts) async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  final MyAfyaHubStateDatabase stateDB =
      MyAfyaHubStateDatabase(dataBaseName: silDatabaseName);

  /// initialize the database
  await stateDB.init();

  /// retrieve state from the database
  final AppState initialState = await stateDB.readState();

  /// initialize a fresh database if [initialState] is `null`,
  /// and populate the database with the default values for each state
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

  final NavigatorObserver navigatorObserver = NavigatorObserver();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(
      () {
        inDebug = true;
        return true;
      }(),
    );
    // In debug mode, use the normal error widget which shows
    if (inDebug) {
      return ErrorWidget(details.exception);
    }

    // In release builds, show error image
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(errorDisplayImgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          getErrorMessage(),
          style: boldSize16Text(AppColors.whiteColor),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  };

  NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

  final AppSetupData appSetupData = getAppSetupData(appContexts.last);

  final StreamChatClient streamClient = StreamChatClient(
    appSetupData.streamAPIKey,
    logLevel: Level.ALL,
  );
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  await sharedPreferences.setString('streamApiKey', appSetupData.streamAPIKey);

  await Firebase.initializeApp();
  final String? fcmToken = await FirebaseMessaging.instance.getToken();

  // Initialize the flutter local notifications plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the android notification settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  // Configure the iOS notification settings
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

// Initialize the flutter local notifications plugin with both the android and
// iOS settings
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await AnalyticsService().init(
    environment: describeEnum(appSetupData.appContexts.first),
  );

  runZonedGuarded(
    () async {
      await SentryFlutter.init(
        (SentryFlutterOptions options) {
          options
            ..dsn = appSetupData.sentryDsn
            ..environment = appSetupData.environment
            ..diagnosticLevel = SentryLevel.error;
        },
        appRunner: () => runApp(
          MyAppWidget(
            streamClient: streamClient,
            store: store,
            navigatorObserver: navigatorObserver,
            navigatorKey: appGlobalNavigatorKey,
            appSetupData: appSetupData,
            fcmToken: fcmToken,
            analyticsObserver: AnalyticsService().getAnalyticsObserver(),
            appName: appSetupData.appName,
          ),
        ),
      );

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        Sentry.captureException(details.exceptionAsString());
      };
    },
    (Object exception, StackTrace stackTrace) async {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    },
  );
}
