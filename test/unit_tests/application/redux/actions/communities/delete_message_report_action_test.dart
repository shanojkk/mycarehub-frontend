import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_report_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('DeleteMessageReportAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should successfully delete an event', () async {
      bool error = false;
      bool success = false;

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        DeleteMessageReportAction(
          roomID: 'roomID',
          onError: () => error = true,
          onSuccess: () => success = true,
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(flaggedMessagesMock),
              200,
            ),
          ),
        ),
      );

      await storeTester.waitUntil(DeleteMessageReportAction);
      expect(storeTester.lastInfo.dispatchCount, 6);
      expect(error, false);
      expect(success, true);
    });

    test('should fail to delete an event', () async {
      bool error = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        DeleteMessageReportAction(
          roomID: 'roomID',
          onError: () {
            error = true;
          },
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{}),
              403,
            ),
          ),
        ),
      );

      await storeTester.waitUntil(DeleteMessageReportAction);
      expect(error, true);
    });
  });
}
