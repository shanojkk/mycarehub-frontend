import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/kick_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('KickUserAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should kick a user from a room successfully', () async {
      bool isSuccess = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        KickUserAction(
          client: MockGraphQlClient(),
          onSuccess: () {
            isSuccess = true;
          },
          roomID: 'roomID',
          userID: 'userID',
        ),
      );

      await storeTester.waitUntil(KickUserAction);
      expect(isSuccess, true);
    });

    test('should fail to kick a user from a room', () async {
      bool error = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        KickUserAction(
          roomID: 'roomID',
          onError: () {
            error = true;
          },
          userID: 'userID',
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(<String, dynamic>{}), 403),
          ),
        ),
      );

      await storeTester.waitUntil(KickUserAction);
      expect(error, true);
    });
  });
}
