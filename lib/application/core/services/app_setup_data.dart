// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart' show AppContext, BaseContext;
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/app_name_constants.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart';
import 'package:quiver/core.dart';

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
  environment: 'DEV',
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
  environment: 'DEMO',
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
  environment: 'PROD',
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
