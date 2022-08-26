import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_recent_content_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../mocks.dart';

void main() {
  group('FetchRecentContentAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        FetchRecentContentAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchRecentContentAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching recent content'),
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        FetchRecentContentAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'timeout'}),
              400,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchRecentContentAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching recent content'),
      );
    });
  });
}
