// Flutter imports:
// Package imports:
// import 'package:sghi_core/app_wrapper/app_wrapper_base.dart' show AppContext, BaseContext;
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';
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

  AppSetupData({
    required this.appContexts,
    required this.sentryDsn,
    required this.streamAPIKey,
    required this.clinicalEndpoint,
    required this.environment,
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
  customContext: const BaseContext(
    anonymousLoginEndpoint: kTestAnonymousLoginEndpoint,
    graphqlEndpoint: kTestGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kTestSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kTestRefreshTokenEndpoint,
    retryResendOtpEndpoint: kTestRetryResendOtpEndpoint,
    requestPinResetEndpoint: kTestRequestPinResetEndpoint,
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: kTestUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kTestVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kTestVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kTestSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kTestLoginByPhoneEndpoint,
    updateUserPinEndpoint: kTestUpdateUserPinEndpoint,
    uploadFileEndPoint: kTestUploadFileEndPoint,
    createUserByPhoneEndpoint: kTestCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kTestGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kTestVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kTestRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kTestPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
    listOrganisationsEndpoint: '',
  ),
  clinicalEndpoint: kTestClinicalEndpoint,
);

final AppSetupData demoAppSetupData = AppSetupData(
  appContexts: demoAppContexts,
  environment: AppEnvironment.demo.name,
  sentryDsn: FlutterConfig.get('DEMO_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('DEMO_STREAM_API_KEY') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kDemoAnonymousLoginEndpoint,
    graphqlEndpoint: kDemoGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kDemoSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kDemoRefreshTokenEndpoint,
    retryResendOtpEndpoint: kDemoRetryResendOtpEndpoint,
    requestPinResetEndpoint: kDemoRequestPinResetEndpoint,
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: kDemoUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kDemoVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kDemoVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kDemoSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kDemoLoginByPhoneEndpoint,
    updateUserPinEndpoint: kDemoUpdateUserPinEndpoint,
    uploadFileEndPoint: kDemoUploadFileEndPoint,
    createUserByPhoneEndpoint: kDemoCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kDemoGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kDemoVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kDemoRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kDemoPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
    listOrganisationsEndpoint: '',
  ),
  clinicalEndpoint: kDemoClinicalEndpoint,
);

final AppSetupData prodAppSetupData = AppSetupData(
  appContexts: prodAppContexts,
  environment: AppEnvironment.prod.name,
  sentryDsn: FlutterConfig.get('PROD_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('PROD_STREAM_API_KEY') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kProdAnonymousLoginEndpoint,
    graphqlEndpoint: kProdGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kProdSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kProdRefreshTokenEndpoint,
    retryResendOtpEndpoint: kProdRetryResendOtpEndpoint,
    requestPinResetEndpoint: kProdRequestPinResetEndpoint,
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: kProdUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kProdVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kProdVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kProdSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kProdLoginByPhoneEndpoint,
    updateUserPinEndpoint: kProdUpdateUserPinEndpoint,
    uploadFileEndPoint: kProdUploadFileEndPoint,
    createUserByPhoneEndpoint: kProdCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kProdGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kProdVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kProdRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kProdPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
    listOrganisationsEndpoint: '',
  ),
  clinicalEndpoint: kProdClinicalEndpoint,
);
