import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/chat_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('DeleteMessageAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
          chatState: ChatState.initial().copyWith.call(
                syncResponse: SyncResponse.fromJson(syncResponseMock),
              ),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should delete a message successfully', () async {
      bool error = false;
      bool success = false;

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        DeleteMessageAction(
          roomID: '!testRoom:chat.savannahghi.org',
          senderID: '@abiudrn:chat.savannahghi.org',
          eventID: 'test:chat.savannahghi.org',
          onError: (String errorMsg) => error = true,
          onSuccess: () => success = true,
          client: MockCommunitiesClient(),
        ),
      );

      await storeTester.waitUntil(DeleteMessageAction);
      expect(error, false);
      expect(success, true);
    });

    test(
        'should fail to delete a message if someone does not have '
        'the right permissions', () async {
      bool error = false;
      String msg = '';
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        DeleteMessageAction(
          roomID: 'roomID',
          senderID: '@abiudrn:chat.savannahghi.org',
          eventID: 'eventID',
          onError: (String errorMsg) {
            error = true;
            msg = errorMsg;
          },
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(powerLevelsResponseMock),
              403,
            ),
          ),
        ),
      );

      await storeTester.waitUntil(DeleteMessageAction);
      expect(error, true);
      expect(msg, 'Sorry, you do not have permissions to delete this message');
    });

    test('should fail to delete a message', () async {
      bool error = false;
      String msg = '';
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        DeleteMessageAction(
          roomID: 'roomID',
          senderID: '@abiudrn:chat.savannahghi.org',
          eventID: 'eventID',
          onError: (String errorMsg) {
            error = true;
            msg = errorMsg;
          },
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(powerLevelsResponseMock),
              400,
            ),
          ),
        ),
      );

      await storeTester.waitUntil(DeleteMessageAction);
      expect(error, true);
      expect(msg, 'Sorry, an error occurred while deleting the message');
    });
  });
}
