import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/verify_pin_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart';

import '../../../../mocks.dart';

void main() {
  group('VerifyPINAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (_) {},
      );
    });

    test('should show error if pin is wrong', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 8, 'error': '8: wrong PIN'},
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.state.miscState?.pinVerified, false);
      expect(info.state.miscState?.pinInputTries, 1);
    });

    test('should handle other http errors', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 11, 'error': 'error'},
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.errors.removeFirst().msg, somethingWentWrongText);
    });

    test('should handle uncaught errors', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(
            <String, dynamic>{'code': 11, 'error': 'error'},
          ),
          400,
        ),
      );

      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: client,
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.errors.removeFirst().msg, somethingWentWrongText);
    });

    test('should handle pin verified is true', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{
                  'data': <String, bool>{'verifyPIN': true}
                },
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.state.miscState?.pinVerified, true);
      expect(info.state.miscState?.pinInputTries, 0);
    });

    test('should handle pin verified is false', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{
                  'data': <String, bool>{'verifyPIN': false}
                },
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.state.miscState?.pinVerified, false);
      expect(info.state.miscState?.pinInputTries, 0);
    });
  });
}
