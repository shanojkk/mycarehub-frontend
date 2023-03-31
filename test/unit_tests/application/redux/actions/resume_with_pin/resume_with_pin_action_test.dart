import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/resume_with_pin_action/resume_with_pin_action.dart';
import 'package:pro_health_360/application/redux/actions/update_misc_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

import '../../../../../mocks.dart';

void main() {
  group('ResumeWithPinAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should handle multiple wrong pin', () async {
      storeTester.dispatch(UpdateMiscStateAction(resumeWithPINRetries: 5));
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 8, 'error': '8: wrong PIN'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.state.miscState!.resumeWithPINRetries, 0);
    });
    test('should handle wrong pin', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 8, 'error': '8: wrong PIN'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, wrongPINText);
    });

    test('should handle unexpected error', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'error'},
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });

    test('should handle correct pin', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{
                  'data': <String, bool>{'verifyPIN': true}
                },
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushReplacementNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushReplacementNamed?;

      expect(navDetails?.routeName, AppRoutes.phoneLogin);
    });

    test('should handle other error response', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'error'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });

    test('should handle uncaught errors', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      storeTester.dispatch(
        ResumeWithPinAction(
          pin: '',
          httpClient: client,
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
