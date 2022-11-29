// Flutter imports:
// Package imports:
// import 'package:app_wrapper/app_wrapper.dart' show AppContext, BaseContext;
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/app_name_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart';
import 'package:quiver/core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sghi_core/app_wrapper/base_context.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

/// Holds an environment specific app configuration
///
/// Items included in this config:
/// - [appContexts] holds the environment in which the app is running on
/// - [sentryDsn] is the [Sentry] DSN key
/// - [streamAPIKey] is the GetStream API key for the environment
/// - [customContext] contains extra configs for the GraphQL client
/// - [clinicalEndpoint] is used to fetch the client's medical information
/// - The [environment] is a string description of the environment the app is
/// running on. It is extracted from the [AppEnvironment] object
///
/// This is used to compose the [devAppSetupData], [demoAppSetupData] and
/// [prodAppSetupData] below
class AppSetupData {
  final List<AppContext> appContexts;
  final String sentryDsn;
  final String streamAPIKey;
  final BaseContext? customContext;
  final String clinicalEndpoint;
  final String environment;
  final String appName;

  AppSetupData({
    required this.appContexts,
    required this.sentryDsn,
    required this.streamAPIKey,
    required this.clinicalEndpoint,
    required this.environment,
    required this.appName,
    this.customContext,
  });

  @override
  bool operator ==(Object o) =>
      o is AppSetupData &&
      listEquals(appContexts, o.appContexts) &&
      o.sentryDsn == this.sentryDsn;

  @override
  int get hashCode => hash2(hashObjects(appContexts), sentryDsn);
}

final AppSetupData devAppSetupData = AppSetupData(
  appContexts: testAppContexts,
  environment: AppEnvironment.dev.name,
  sentryDsn: FlutterConfig.get('DEV_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('DEV_STREAM_API_KEY') as String,
  appName: '$appName Test',
  customContext: const BaseContext(
    anonymousLoginEndpoint: '',
    graphqlEndpoint: kTestGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: '',
    refreshTokenEndpoint: kTestRefreshTokenEndpoint,
    retryResendOtpEndpoint: '',
    requestPinResetEndpoint: '',
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: '',
    verifyContactOTPEndpoint: kTestVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kTestVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kTestSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kTestLoginByPhoneEndpoint,
    updateUserPinEndpoint: kTestUpdateUserPinEndpoint,
    uploadFileEndPoint: '',
    createUserByPhoneEndpoint: '',
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kTestGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kTestVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kTestRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kTestPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
  ),
  clinicalEndpoint: kTestClinicalEndpoint,
);

final AppSetupData demoAppSetupData = AppSetupData(
  appContexts: demoAppContexts,
  environment: AppEnvironment.demo.name,
  sentryDsn: FlutterConfig.get('DEMO_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('DEMO_STREAM_API_KEY') as String,
  appName: appName,
  customContext: const BaseContext(
    anonymousLoginEndpoint: '',
    graphqlEndpoint: kDemoGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: '',
    refreshTokenEndpoint: kDemoRefreshTokenEndpoint,
    retryResendOtpEndpoint: kDemoRetryResendOtpEndpoint,
    requestPinResetEndpoint: '',
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: '',
    verifyContactOTPEndpoint: kDemoVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kDemoVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kDemoSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kDemoLoginByPhoneEndpoint,
    updateUserPinEndpoint: kDemoUpdateUserPinEndpoint,
    uploadFileEndPoint: '',
    createUserByPhoneEndpoint: '',
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kDemoGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kDemoVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kDemoRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kDemoPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
  ),
  clinicalEndpoint: kDemoClinicalEndpoint,
);

final AppSetupData prodAppSetupData = AppSetupData(
  appContexts: prodAppContexts,
  environment: AppEnvironment.prod.name,
  sentryDsn: FlutterConfig.get('PROD_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('PROD_STREAM_API_KEY') as String,
  appName: appName,
  customContext: const BaseContext(
    anonymousLoginEndpoint: '',
    graphqlEndpoint: kProdGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: '',
    refreshTokenEndpoint: kProdRefreshTokenEndpoint,
    retryResendOtpEndpoint: kProdRetryResendOtpEndpoint,
    requestPinResetEndpoint: '',
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: '',
    verifyContactOTPEndpoint: kProdVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kProdVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kProdSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kProdLoginByPhoneEndpoint,
    updateUserPinEndpoint: kProdUpdateUserPinEndpoint,
    uploadFileEndPoint: '',
    createUserByPhoneEndpoint: '',
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kProdGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kProdVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kProdRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kProdPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
  ),
  clinicalEndpoint: kProdClinicalEndpoint,
);
