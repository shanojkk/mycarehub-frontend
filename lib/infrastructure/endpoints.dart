/* 
TEST ENDPOINTS 

We are using staging endpoints here so as to match what the backend does.

The environment that these endpoints call is STRICTLY for internal DEVs only
*/
const String kTestGraphqlEndpoint =
    'https://mycarehub-staging.savannahghi.org/graphql';
const String kTestLoginByPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_by_phone';
const String kTestVerifyPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_phone';
const String kTestRequestPinResetEndpoint =
    'https://mycarehub-staging.savannahghi.org/request_pin_reset';
const String kTestUpdateUserPinEndpoint =
    'https://mycarehub-staging.savannahghi.org/reset_pin';
const String kTestVerifyContactOTPEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_otp';
const String kTestCreateUserByPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/create_user_by_phone';
const String kTestRetryResendOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_retry_otp';
const String kTestRefreshTokenEndpoint =
    'https://mycarehub-staging.savannahghi.org/refresh_token';
const String kTestRefreshStreamTokenEndpoint =
    'https://mycarehub-staging.savannahghi.org/refresh_getstream_token';
const String kTestAnonymousLoginEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_anonymous';
const String kTestUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-staging.savannahghi.org/user_recovery_phonenumbers';
const String kTestSendRecoverAccountOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_otp';
const String kTestSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-staging.savannahghi.org/set_primary_phonenumber';
const String kTestUploadFileEndPoint =
    'https://engagement-staging.savannahghi.org/upload';
const String kTestGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-staging.savannahghi.org/get_user_responded_security_questions';
const String kTestVerifySecurityQuestionsEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_security_questions';
const String kTestPINResetServiceRequestEndpoint =
    'https://mycarehub-staging.savannahghi.org/service-requests';
const String kTestClinicalEndpoint =
    'https://clinical-staging.savannahghi.org/graphql';

/* 
DEMO ENDPOINTS 

The endpoints here have the -test suffix because this is what will be used by
the SIT and UAT team
*/
const String kDemoGraphqlEndpoint =
    'https://mycarehub-testing.savannahghi.org/graphql';
const String kDemoLoginByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_by_phone';
const String kDemoVerifyPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_phone';
const String kDemoRequestPinResetEndpoint =
    'https://mycarehub-testing.savannahghi.org/request_pin_reset';
const String kDemoUpdateUserPinEndpoint =
    'https://mycarehub-testing.savannahghi.org/reset_pin';
const String kDemoVerifyContactOTPEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_otp';
const String kDemoCreateUserByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/create_user_by_phone';
const String kDemoRetryResendOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_retry_otp';
const String kDemoRefreshTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_token';
const String kDemoRefreshStreamTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_getstream_token';
const String kDemoAnonymousLoginEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_anonymous';
const String kDemoUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-testing.savannahghi.org/user_recovery_phonenumbers';
const String kDemoSendRecoverAccountOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_otp';
const String kDemoSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-testing.savannahghi.org/set_primary_phonenumber';
const String kDemoUploadFileEndPoint =
    'https://engagement-testing.savannahghi.org/upload';
const String kDemoGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-testing.savannahghi.org/get_user_responded_security_questions';
const String kDemoVerifySecurityQuestionsEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_security_questions';
const String kDemoPINResetServiceRequestEndpoint =
    'https://mycarehub-testing.savannahghi.org/service-requests';
const String kDemoClinicalEndpoint =
    'https://clinical-testing.savannahghi.org/graphql';

/* 
PROD ENDPOINTS 

These are the endpoints for the production environment

The environment that the clients use
*/
const String kProdGraphqlEndpoint =
    'https://mycarehub-prod.savannahghi.org/graphql';
const String kProdLoginByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_by_phone';
const String kProdRequestPinResetEndpoint =
    'https://mycarehub-prod.savannahghi.org/request_pin_reset';
const String kProdUpdateUserPinEndpoint =
    'https://mycarehub-prod.savannahghi.org/reset_pin';
const String kProdVerifyPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_phone';
const String kProdVerifyContactOTPEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_otp';
const String kProdCreateUserByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/create_user_by_phone';
const String kProdRetryResendOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_retry_otp';
const String kProdRefreshTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_token';
const String kProdRefreshStreamTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_getstream_token';
const String kProdAnonymousLoginEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_anonymous';
const String kProdUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-prod.savannahghi.org/user_recovery_phonenumbers';
const String kProdSendRecoverAccountOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_otp';
const String kProdSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-prod.savannahghi.org/set_primary_phonenumber';
const String kProdUploadFileEndPoint =
    'https://engagement-prod.savannahghi.org/upload';
const String kProdGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-prod.savannahghi.org/get_user_responded_security_questions';
const String kProdVerifySecurityQuestionsEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_security_questions';
const String kProdPINResetServiceRequestEndpoint =
    'https://mycarehub-prod.savannahghi.org/service-requests';
const String kProdClinicalEndpoint =
    'https://clinical-prod.savannahghi.org/graphql';

/* EXTERNAL DEMO ENDPOINTS */
const String kExternalGraphqlEndpoint =
    'https://mycarehub-demo.savannahghi.org/graphql';
const String kExternalLoginByPhoneEndpoint =
    'https://mycarehub-demo.savannahghi.org/login_by_phone';
const String kExternalRequestPinResetEndpoint =
    'https://mycarehub-demo.savannahghi.org/request_pin_reset';
const String kExternalUpdateUserPinEndpoint =
    'https://mycarehub-demo.savannahghi.org/reset_pin';
const String kExternalVerifyPhoneEndpoint =
    'https://mycarehub-demo.savannahghi.org/verify_phone';
const String kExternalVerifyContactOTPEndpoint =
    'https://mycarehub-demo.savannahghi.org/verify_otp';
const String kExternalCreateUserByPhoneEndpoint =
    'https://mycarehub-demo.savannahghi.org/create_user_by_phone';
const String kExternalRetryResendOtpEndpoint =
    'https://mycarehub-demo.savannahghi.org/send_retry_otp';
const String kExternalRefreshTokenEndpoint =
    'https://mycarehub-demo.savannahghi.org/refresh_token';
const String kExternalRefreshStreamTokenEndpoint =
    'https://mycarehub-demo.savannahghi.org/refresh_getstream_token';
const String kExternalAnonymousLoginEndpoint =
    'https://mycarehub-demo.savannahghi.org/login_anonymous';
const String kExternalUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-demo.savannahghi.org/user_recovery_phonenumbers';
const String kExternalSendRecoverAccountOtpEndpoint =
    'https://mycarehub-demo.savannahghi.org/send_otp';
const String kExternalSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-demo.savannahghi.org/set_primary_phonenumber';
const String kExternalUploadFileEndPoint =
    'https://engagement-demo.savannahghi.org/upload';
const String kExternalGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-demo.savannahghi.org/get_user_responded_security_questions';
const String kExternalVerifySecurityQuestionsEndpoint =
    'https://mycarehub-demo.savannahghi.org/verify_security_questions';
const String kExternalPINResetServiceRequestEndpoint =
    'https://mycarehub-demo.savannahghi.org/service-requests';
const String kExternalClinicalEndpoint =
    'https://clinical-demo.savannahghi.org/graphql';
