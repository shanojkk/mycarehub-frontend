import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/communities_logout_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_list_item_widget.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_list_page.dart';
import 'package:sghi_core/communities/models/user.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_page.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('RoomListPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should show loading indicator when syncing',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: const RoomListPage(),
      );

      store.dispatch(WaitAction<AppState>.add(syncingEventsFlag));
      await tester.pump();

      expect(find.text(syncingString), findsOneWidget);

      /// Cancel the timer
      store.dispatch(CommunitiesLogoutAction());
    });

    testWidgets('should navigate to the room details page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: const RoomListPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(RoomListItemWidget), findsNWidgets(2));
      expect(
        find.byKey(const Key('!testRoom:chat.savannahghi.org')),
        findsOneWidget,
      );

      await tester.tap(find.byKey(const Key('!testRoom:chat.savannahghi.org')));
      await tester.pumpAndSettle();

      expect(find.byType(RoomPage), findsOneWidget);
      expect(find.text('The Grand Gaming Squad'), findsOneWidget);

      /// Cancel the timer
      store.dispatch(CommunitiesLogoutAction());
    });
  });

  group('Empty RoomListPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should show empty state when there are no rooms and navigate to '
        'group invites page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: const RoomListPage(),
      );

      await tester.tap(find.byKey(emptyChatsNewRoomKey));
      await tester.pumpAndSettle();

      /// Cancel the timer
      store.dispatch(CommunitiesLogoutAction());
    });
  });
}
