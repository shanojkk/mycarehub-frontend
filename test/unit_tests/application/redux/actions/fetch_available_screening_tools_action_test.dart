import 'dart:convert';

import 'package:pro_health_360/application/redux/actions/screening_tools/fetch_available_screening_tools_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../mocks.dart';

void main() {
  group('FetchAvailableScreeningToolsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should dispatch error if response body is null', () async {
      storeTester.dispatch(
        FetchAvailableScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{'error': 'an error occurred'}),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchAvailableScreeningToolsAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching available screening tools'),
      );
    });

    test('should dispatch error if response code is not 200', () async {
      storeTester.dispatch(
        FetchAvailableScreeningToolsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{'error': 'an error occurred'}),
              500,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchAvailableScreeningToolsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });
  });
}
