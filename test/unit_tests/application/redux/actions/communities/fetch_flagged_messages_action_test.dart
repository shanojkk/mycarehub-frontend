import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_flagged_messages_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('FetchFlaggedMessagesAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should fetch flagged messages successfully and update state',
        () async {
      bool error = false;

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        FetchFlaggedMessagesAction(
          roomID: 'roomID',
          onError: () {
            error = true;
          },
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(flaggedMessagesMock), 200),
          ),
        ),
      );

      await storeTester.waitUntil(FetchFlaggedMessagesAction);
      expect(error, false);

      expect(storeTester.state.chatState?.flaggedMessageEvents, isNotEmpty);
      expect(storeTester.state.chatState?.flaggedMessageEvents?.length, 2);
    });

    test('should fail to fetch flagged messages', () async {
      bool error = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        FetchFlaggedMessagesAction(
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

      await storeTester.waitUntil(FetchFlaggedMessagesAction);
      expect(error, true);
    });
  });
}
