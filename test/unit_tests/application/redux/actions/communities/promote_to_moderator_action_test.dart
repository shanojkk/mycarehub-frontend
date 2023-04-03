import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/promote_to_moderator_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('PromoteToModeratorAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should fail to unban a user', () async {
      bool error = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        PromoteToModeratorAction(
          roomID: 'roomID',
          userID: '@abiudrn:chat.savannahghi.org',
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

      await storeTester.waitUntil(PromoteToModeratorAction);
      expect(error, true);
    });
  });
}
