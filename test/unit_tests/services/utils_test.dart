import 'dart:convert';

import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pro_health_360/application/core/services/input_validators.dart';
import 'package:pro_health_360/domain/core/entities/core/client_profile.dart';
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/identifier.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Utils', () {
    test('should return an unprotected route', () async {
      expect(unProtectedRoutes[0], AppRoutes.phoneLogin);
    });

    test('should return correct CCC number', () async {
      final ClientProfile clientProfile = ClientProfile(
        identifiers: <Identifier>[
          Identifier(
            id: 'some-id',
            type: IdentifierType.CCC,
            value: '+254712345678',
          )
        ],
      );
      final String phoneNumber = getClientCCCNumber(clientProfile);
      expect(phoneNumber, '+254712345678');
    });

    test('formatSecurityQuestionDate should return birth date in en_GB format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb 1990';

      final String r1 = formatSecurityQuestionDate(enFormat);
      final String r2 = formatSecurityQuestionDate(looseFormat);

      expect(r1, equals(r2));
    });

    test(
        'formatSecurityQuestionDate should return birth date from britain format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb, 1990';

      final String r2 =
          formatSecurityQuestionDate(looseFormat, format: 'yyyy-MM-dd');

      expect(enFormat, equals(r2));
    });

    group('getAppSetupData', () {
      FlutterConfig.loadValueForTesting(<String, String>{
        'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
        'DEMO_SENTRY_DNS': 'test_demo_sentry_dns',
        'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
        'DEV_STREAM_API_KEY': 'dev_stream_api_key',
        'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
        'PROD_STREAM_API_KEY': 'prod_stream_api_key',
      });

      test('should return the correct instance of AppSetupData', () async {
        expect(getAppSetupData(testAppContexts.last), devAppSetupData);

        expect(getAppSetupData(demoAppContexts.last), demoAppSetupData);

        expect(getAppSetupData(prodAppContexts.last), prodAppSetupData);

        expect(getAppSetupData(AppContext.BewellCONSUMER), devAppSetupData);
      });
    });

    test('getMoodColor should return the various mood colors', () {
      expect(getMoodData('Happy').color, AppColors.greenHappyColor);
      expect(getMoodData('Very Happy').color, AppColors.greenHappyColor);
      expect(getMoodData('Meh').color, AppColors.mehMoodColor);
      expect(getMoodData('Sad').color, AppColors.warningColor);
      expect(getMoodData('Very Sad').color, AppColors.verySadColor);
      expect(getMoodData('Other').color, AppColors.secondaryColor);
      expect(getMoodData(null).color, AppColors.secondaryColor);
    });

    test('getFeedBackValidationMessage should return the various messages', () {
      expect(
        validateFeedback(
          feedBackType: FeedBackType.SERVICES_OFFERED,
          feedBackText: '',
          selectedRating: 0,
        ),
        'Please select a rating',
      );
      expect(
        validateFeedback(
          feedBackType: FeedBackType.SERVICES_OFFERED,
          feedBackText: '',
          selectedRating: 1,
        ),
        'Please enter the name of service',
      );
      expect(
        validateFeedback(
          feedBackType: FeedBackType.GENERAL_FEEDBACK,
          feedBackText: '',
          selectedRating: 1,
        ),
        'Please share your thoughts',
      );
    });
  });

  test('calculate age calculates age correctly', () {
    final String fiveYearAgo =
        DateTime.now().subtract(const Duration(days: 365 * 5)).toString();
    final String age = calculateAge(fiveYearAgo);
    expect(age, '5 yrs');
  });

  test('appointmentDateValidator works correctly', () {
    expect(appointmentDateValidator(null), dateRequiredString);
    expect(appointmentDateValidator(''), dateRequiredString);
    expect(
      appointmentDateValidator(
        '17 Jun, 2021',
      ),
      inValidDateString,
    );
  });

  test('capitalize works correctly', () {
    expect(capitalize('test'), 'Test');
  });

  test('shouldResumeWithPIN works correctly', () {
    expect(
      shouldResumeWithPIN(
        AppState(
          credentials: AuthCredentials(isSignedIn: true),
          clientState: ClientState(
            clientProfile: ClientProfile(
              user: User(
                hasSetNickname: true,
                hasSetPin: true,
                hasSetSecurityQuestions: true,
                isPhoneVerified: true,
                pinChangeRequired: false,
                pinUpdateRequired: false,
                termsAccepted: true,
              ),
            ),
          ),
        ),
      ),
      true,
    );
    expect(
      shouldResumeWithPIN(
        null,
      ),
      false,
    );
  });

  group('reportErrorToSentry', () {
    test('sends to sentry', () {
      final AppState? state =
          AppState.initial().copyWith.clientState?.call(isSignedIn: true);

      reportErrorToSentry(
        hint: 'error',
        state: state,
        response: Response(
          json.encode(<String, dynamic>{'message': '4: error'}),
          401,
        ),
      );
    });
  });
}
