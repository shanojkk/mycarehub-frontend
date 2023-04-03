import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/un_ban_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('UnBanUserAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should unban a user successfully', () async {
      bool error = false;
      bool success = false;

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        UnBanUserAction(
          roomID: 'roomID',
          userID: '@abiudrn:chat.savannahghi.org',
          reason: 'Inappropriate',
          onError: () {
            error = true;
          },
          onSuccess: () => success = true,
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(bannedUserResponseMock), 200),
          ),
        ),
      );

      await storeTester.waitUntil(UnBanUserAction);
      expect(error, false);
      expect(success, true);
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
        UnBanUserAction(
          roomID: 'roomID',
          userID: '@abiudrn:chat.savannahghi.org',
          reason: 'Inappropriate',
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

      await storeTester.waitUntil(UnBanUserAction);
      expect(error, true);
    });
  });
}
