import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/communities_logout_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/pages/group_info_page.dart';
import 'package:pro_health_360/presentation/communities/pages/invite_users_page.dart';
import 'package:pro_health_360/presentation/communities/pages/room_list_page.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('GroupInfoPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .chatState!
            .call(userProfile: User.fromJson(loginResponseMock)),
      );
    });

    testWidgets('should build correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: RoomInfoPage(
          room: Room.fromJson(roomMock),
        ),
      );

      expect(find.byType(RoomInfoPage), findsOneWidget);
      expect(find.text('3 members'), findsOneWidget);
    });

    testWidgets('should leave a room', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: RoomInfoPage(
          room: Room.fromJson(roomMock),
        ),
      );

      expect(find.byType(RoomInfoPage), findsOneWidget);
      expect(find.text('3 members'), findsOneWidget);

      expect(find.byKey(leaveRoomKey), findsOneWidget);
      await tester.tap(find.byKey(leaveRoomKey));
      await tester.pumpAndSettle();

      expect(find.byKey(confirmLeaveRoomKey), findsOneWidget);
      await tester.tap(find.byKey(confirmLeaveRoomKey));
      await tester.pumpAndSettle();

      store.dispatch(CommunitiesLogoutAction());

      expect(find.byType(RoomListPage), findsOneWidget);
    });

    testWidgets('should navigate to invite members page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: RoomInfoPage(
          room: Room.fromJson(roomMock),
        ),
      );

      expect(find.byType(RoomInfoPage), findsOneWidget);
      expect(find.text('3 members'), findsOneWidget);
      expect(find.byKey(inviteUsersKey), findsOneWidget);
      expect(find.byKey(leaveRoomKey), findsOneWidget);

      await tester.tap(find.byKey(inviteUsersKey));
      await tester.pumpAndSettle();

      expect(find.byType(InviteUsersPage), findsOneWidget);
      expect(find.text('Search users'), findsNWidgets(2));
    });
  });
}
