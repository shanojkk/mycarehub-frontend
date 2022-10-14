import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pro_health_360/application/core/services/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/notifications_utils.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import 'utils_test.mocks.dart';

import '../../mocks.dart';

@GenerateMocks(<Type>[stream.StreamChatClient])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Utils', () {
    test('should sentence case username', () {
      expect(
        sentenceCaseUserName(firstName: 'ule', lastName: 'makmende'),
        'Ule Makmende',
      );
      expect(sentenceCaseUserName(firstName: 'u', lastName: 'm'), 'u m');
      expect(sentenceCaseUserName(firstName: '', lastName: ''), ' ');
    });

    test('should return an unprotected route', () async {
      expect(unProtectedRoutes[0], AppRoutes.phoneLogin);
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

        expect(getAppSetupData(e2eAppContexts.last), devAppSetupData);

        expect(getAppSetupData(AppContext.BewellCONSUMER), devAppSetupData);
      });
    });

    test('getEnvironmentContext should return the correct contexts', () async {
      expect(getEnvironmentContext(<AppContext>[AppContext.AppProd]), 'prod');
      expect(getEnvironmentContext(<AppContext>[AppContext.AppDemo]), 'demo');
      expect(getEnvironmentContext(<AppContext>[AppContext.AppTest]), 'test');
    });

    test('getMoodColor should return the various mood colors', () {
      expect(getMoodColor('Happy').color, AppColors.greenHappyColor);
      expect(getMoodColor('Very Happy').color, AppColors.greenHappyColor);
      expect(getMoodColor('Meh').color, AppColors.mehMoodColor);
      expect(getMoodColor('Sad').color, AppColors.warningColor);
      expect(getMoodColor('Very Sad').color, AppColors.verySadColor);
      expect(getMoodColor('Other').color, AppColors.secondaryColor);
      expect(getMoodColor(null).color, AppColors.secondaryColor);
    });

    test('getFeedBackValidationMessage should return the various messages', () {
      expect(
        getFeedBackValidationMessage(
          feedBackType: FeedBackType.SERVICES_OFFERED,
          feedBackText: '',
          selectedRating: 0,
        ),
        'Please select a rating',
      );
      expect(
        getFeedBackValidationMessage(
          feedBackType: FeedBackType.SERVICES_OFFERED,
          feedBackText: '',
          selectedRating: 1,
        ),
        'Please enter the name of service',
      );
      expect(
        getFeedBackValidationMessage(
          feedBackType: FeedBackType.GENERAL_FEEDBACK,
          feedBackText: '',
          selectedRating: 1,
        ),
        'Please share your thoughts',
      );
    });
  });

  test('userBannedMessage should return the correct message', () {
    expect(userBannedMessage(), 'User banned successfully');
    expect(
      userBannedMessage(userName: 'test', communityName: 'test'),
      'You have banned test from test',
    );
    expect(userBannedMessage(userName: 'test'), 'You have banned test');
    expect(
      userBannedMessage(
        isBanned: true,
      ),
      'User unbanned successfully',
    );
    expect(
      userBannedMessage(
        userName: 'test',
        communityName: 'test',
        isBanned: true,
      ),
      'You have unbanned test from test',
    );
    expect(
      userBannedMessage(
        userName: 'test',
        isBanned: true,
      ),
      'You have unbanned test',
    );
  });

  group('backgroundMessageHandler', () {
    setupFirebaseMessagingMocks();

    testWidgets('works correctly', (WidgetTester tester) async {
      final Map<String, Object> values = <String, Object>{
        'streamToken': 'test-stream-token',
        'clientId': 'test-client-id',
      };
      SharedPreferences.setMockInitialValues(values);

      final MockStreamChatClient mockStreamChatClient = MockStreamChatClient();
      when(
        mockStreamChatClient.connectUser(
          stream.User(id: 'test-client-id'),
          'test-stream-token',
          connectWebSocket: false,
        ),
      ).thenAnswer((_) {
        return Future<stream.OwnUser>.value(
          stream.OwnUser.fromJson(const <String, dynamic>{
            'id': 'test',
            'name': 'test user',
            'avatar': 'test',
            'extraData': <String, dynamic>{}
          }),
        );
      });

      when(mockStreamChatClient.getMessage(any)).thenAnswer(
        (_) => Future<stream.GetMessageResponse>.value(
          stream.GetMessageResponse.fromJson(<String, dynamic>{
            'channel': <String, dynamic>{
              'id': 'channel_id',
              'type': 'messaging',
              'extraData': <String, dynamic>{'Name': 'test group'},
            },
            'message': <String, dynamic>{
              'id': 'test',
              'text': 'test',
              'user': <String, dynamic>{'id': 'test', 'name': 'test user'}
            }
          }),
        ),
      );

      await tester.pumpWidget(
        OverlaySupport(
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: MaterialButton(
                      onPressed: () => backgroundMessageHandler(
                        RemoteMessage.fromMap(<String, dynamic>{
                          'data': <String, dynamic>{
                            'id': 'test',
                            'type': 'message.new'
                          }
                        }),
                        testChatClient: mockStreamChatClient,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder button = find.byType(MaterialButton);
      await tester.tap(button);
      await tester.pump(const Duration(seconds: 4));

      verify(
        mockStreamChatClient.connectUser(
          stream.User(id: 'test-client-id'),
          'test-stream-token',
          connectWebSocket: false,
        ),
      ).called(1);
    });
  });

  test('calculate age calculates age correctly', () {
    final String fiveYearAgo =
        DateTime.now().subtract(const Duration(days: 365 * 5)).toString();
    final String age = calculateAge(fiveYearAgo);
    expect(age, '5');
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
