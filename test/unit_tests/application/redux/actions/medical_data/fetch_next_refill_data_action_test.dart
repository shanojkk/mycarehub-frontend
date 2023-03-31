import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/medical_data/fetch_next_refill_data_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/next_refill_data.dart';

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('FetchNextRefillDataAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('update state correctly', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockNextRefillDataResponse}),
          200,
        ),
      );

      storeTester.dispatch(FetchNextRefillDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNextRefillDataAction);

      final NextRefillData? nextRefillData =
          info.state.clientState?.nextRefillData;

      expect(nextRefillData?.nextRefill, '2023-12-12');
    });

    test('throws error if response contains error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          200,
        ),
      );

      storeTester.dispatch(FetchNextRefillDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNextRefillDataAction);

      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws error if http call was not successful', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      storeTester.dispatch(FetchNextRefillDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNextRefillDataAction);

      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws catch unhandled error', () async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'error': 'unauthorized'}
          }),
          400,
        ),
      );

      storeTester
          .dispatch(FetchNextRefillDataAction(httpClient: graphQlClient));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNextRefillDataAction);

      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });
  });
}
