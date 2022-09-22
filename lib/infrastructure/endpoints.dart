/* 
TEST ENDPOINTS 

We are using staging endpoints here so as to match what the backend does.

The environment that these endpoints call is STRICTLY for internal DEVs only
*/
const String kTestGraphqlEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/graphql';
const String kTestLoginByPhoneEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/login_by_phone';
const String kTestVerifyPhoneEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/verify_phone';
const String kTestUpdateUserPinEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/reset_pin';
const String kTestVerifyContactOTPEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/verify_otp';
const String kTestRetryResendOtpEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/send_retry_otp';
const String kTestRefreshTokenEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/refresh_token';
const String kTestRefreshStreamTokenEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/refresh_getstream_token';
const String kTestSendRecoverAccountOtpEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/send_otp';
const String kTestGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/get_user_responded_security_questions';
const String kTestVerifySecurityQuestionsEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/verify_security_questions';
const String kTestPINResetServiceRequestEndpoint =
    'https://mycarehub-multitenant-staging.savannahghi.org/service-requests';
const String kTestClinicalEndpoint =
    'https://clinical-multitenant-staging.savannahghi.org/graphql';

/* 
DEMO ENDPOINTS 

The endpoints here have the -test suffix because this is what will be used by the 
clients (for now)
*/
const String kDemoGraphqlEndpoint =
    'https://mycarehub-testing.savannahghi.org/graphql';
const String kDemoLoginByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_by_phone';
const String kDemoVerifyPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_phone';
const String kDemoUpdateUserPinEndpoint =
    'https://mycarehub-testing.savannahghi.org/reset_pin';
const String kDemoVerifyContactOTPEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_otp';
const String kDemoRetryResendOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_retry_otp';
const String kDemoRefreshTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_token';
const String kDemoRefreshStreamTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_getstream_token';
const String kDemoSendRecoverAccountOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_otp';
const String kDemoGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-testing.savannahghi.org/get_user_responded_security_questions';
const String kDemoVerifySecurityQuestionsEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_security_questions';
const String kDemoPINResetServiceRequestEndpoint =
    'https://mycarehub-testing.savannahghi.org/service-requests';
const String kDemoClinicalEndpoint =
    'https://clinical-testing.savannahghi.org/graphql';

/* PROD ENDPOINTS */
const String kProdGraphqlEndpoint =
    'https://mycarehub-prod.savannahghi.org/graphql';
const String kProdLoginByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_by_phone';
const String kProdUpdateUserPinEndpoint =
    'https://mycarehub-prod.savannahghi.org/reset_pin';
const String kProdVerifyPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_phone';
const String kProdVerifyContactOTPEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_otp';
const String kProdRetryResendOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_retry_otp';
const String kProdRefreshTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_token';
const String kProdRefreshStreamTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_getstream_token';
const String kProdSendRecoverAccountOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_otp';
const String kProdGetRecordedSecurityQuestionsEndpoint =
    'https://mycarehub-prod.savannahghi.org/get_user_responded_security_questions';
const String kProdVerifySecurityQuestionsEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_security_questions';
const String kProdPINResetServiceRequestEndpoint =
    'https://mycarehub-prod.savannahghi.org/service-requests';
const String kProdClinicalEndpoint =
    'https://clinical-prod.savannahghi.org/graphql';
