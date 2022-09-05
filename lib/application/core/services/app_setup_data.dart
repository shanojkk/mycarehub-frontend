// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart' show AppContext, BaseContext;
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart';
import 'package:quiver/core.dart';

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
  environment: 'DEV',
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
  ),
  clinicalEndpoint: kTestClinicalEndpoint,
);

final AppSetupData demoAppSetupData = AppSetupData(
  appContexts: demoAppContexts,
  environment: 'DEMO',
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
  ),
  clinicalEndpoint: kDemoClinicalEndpoint,
);

final AppSetupData prodAppSetupData = AppSetupData(
  appContexts: prodAppContexts,
  environment: 'PROD',
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
  ),
  clinicalEndpoint: kProdClinicalEndpoint,
);

final AppSetupData externalAppSetupData = AppSetupData(
  appContexts: testAppContexts,
  sentryDsn: FlutterConfig.get('DEMO_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('DEMO_STREAM_API_KEY') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kExternalAnonymousLoginEndpoint,
    graphqlEndpoint: kExternalGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kExternalSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kExternalRefreshTokenEndpoint,
    retryResendOtpEndpoint: kExternalRetryResendOtpEndpoint,
    requestPinResetEndpoint: kExternalRequestPinResetEndpoint,
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: kExternalUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kExternalVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kExternalVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kExternalSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kExternalLoginByPhoneEndpoint,
    updateUserPinEndpoint: kExternalUpdateUserPinEndpoint,
    uploadFileEndPoint: kExternalUploadFileEndPoint,
    createUserByPhoneEndpoint: kExternalCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kExternalGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kExternalVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kExternalRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kExternalPINResetServiceRequestEndpoint,
    optInClientEndpoint: '',
  ),
  clinicalEndpoint: kExternalClinicalEndpoint,
);
