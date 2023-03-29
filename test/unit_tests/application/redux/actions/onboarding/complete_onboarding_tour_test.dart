import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/complete_onboarding_tour_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks.dart';

void main() {
  group('CompleteOnboardingTourAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call returns error', () async {
      storeTester.dispatch(
        CompleteOnboardingTourAction(
          userID: 'some-user-id',
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CompleteOnboardingTourAction);

      expect(
        (info.error as UserException?)?.msg,
        getErrorMessage(),
      );
    });

    test('should handle none 200 response', () async {
      storeTester.dispatch(
        CompleteOnboardingTourAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'error': 'error'}),
              400,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('should handle false response', () async {
      storeTester.dispatch(
        CompleteOnboardingTourAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{'completeOnboardingTour': false}
              }),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(
        info.errors.removeLast(),
        const UserException(onboardingErrorText),
      );
    });

    test('should catch unhandled error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{'error': 'some error'}
          }),
          400,
        ),
      );

      storeTester.dispatch(CompleteOnboardingTourAction(client: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CompleteOnboardingTourAction);

      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });
  });
}
