import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_banned_room_members_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('FetchBannedRoomMembersAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
    });

    test('should fetch banned members and update state', () async {
      bool error = false;

      storeTester.dispatch(
        FetchBannedRoomMembersAction(
          roomID: 'roomID',
          onError: () => error = true,
          client: MockCommunitiesClient(),
        ),
      );

      await storeTester.waitUntil(FetchBannedRoomMembersAction);

      expect(storeTester.state.chatState?.bannedUserIDs, isNotEmpty);
      expect(storeTester.state.chatState?.bannedUserIDs?.length, 1);
      expect(
        storeTester.state.chatState?.bannedUserIDs?.first,
        '@abiudrn:prohealth360.org',
      );

      expect(error, false);
    });

    test(
        'should fetch banned members and update state with empty list '
        'if there are not banned members', () async {
      bool error = false;

      storeTester.dispatch(
        FetchBannedRoomMembersAction(
          roomID: 'roomID',
          onError: () => error = true,
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(<String, dynamic>{'chunk': <dynamic>[]}), 200),
          ),
        ),
      );

      await storeTester.waitUntil(FetchBannedRoomMembersAction);

      expect(storeTester.state.chatState?.bannedUserIDs, isEmpty);

      expect(error, false);
    });

    test('should fail to fetch banned members', () async {
      bool error = false;

      storeTester.dispatch(
        FetchBannedRoomMembersAction(
          roomID: 'roomID',
          onError: () => error = true,
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(<String, dynamic>{}), 403),
          ),
        ),
      );

      await storeTester.waitUntil(FetchBannedRoomMembersAction);
      expect(error, true);
    });
  });
}
