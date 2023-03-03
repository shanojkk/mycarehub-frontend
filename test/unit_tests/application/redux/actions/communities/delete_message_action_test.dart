import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('DeleteMessageAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('onError callback is called', () async {
      bool error = false;
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
    });
  });
}
