import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/communities_logout_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/review_invite_widget.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_list_page.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('Invite review widget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should build correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ReviewInviteWidget(room: Room.fromJson(roomMock)),
      );

      expect(find.text('Join Group'), findsOneWidget);
      expect(find.byKey(declineInviteKey), findsOneWidget);

      /// Simulate a loading indicator
      store.dispatch(WaitAction<AppState>.add(joinRoomFlag));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should accept an invite and join a group',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ReviewInviteWidget(
          room: Room.fromJson(roomMock)
              .copyWith
              .call(roomID: '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org'),
        ),
      );

      expect(find.byKey(acceptInviteKey), findsOneWidget);
      expect(find.byKey(declineInviteKey), findsOneWidget);

      await tester.tap(find.byKey(acceptInviteKey));
      await tester.pumpAndSettle();
      store.dispatch(CommunitiesLogoutAction());

      expect(find.byType(RoomListPage), findsOneWidget);

      /// Cancel the sync observer
      store.dispatch(CommunitiesLogoutAction());
    });

    testWidgets('should decline an invite', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ReviewInviteWidget(room: Room.fromJson(roomMock)),
      );

      expect(find.byKey(acceptInviteKey), findsOneWidget);
      expect(find.byKey(declineInviteKey), findsOneWidget);

      await tester.tap(find.byKey(declineInviteKey));
      await tester.pumpAndSettle();

      expect(find.byType(RoomListPage), findsOneWidget);

      /// Cancel the timer
      store.dispatch(CommunitiesLogoutAction());
    });
  });
}
