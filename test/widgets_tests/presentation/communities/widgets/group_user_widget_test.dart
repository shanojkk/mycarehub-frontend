import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/group_user_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_item_widget.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('GroupUserWidget', () {
    late Store<AppState> store;
    final RoomUser testUser = RoomUser.initial()
        .copyWith
        .call(roomUser: User.fromJson(loginResponseMock), moderator: true);

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should promote a user to a moderator',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: GroupUserWidget(
          user: testUser,
          authUserID: 'test-user',
          roomID: 'test-room-id',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Moderator'), findsOneWidget);

      // Tap the user options dialog
      await tester.tap(find.byKey(openUserListOptionDialogKey));
      await tester.pumpAndSettle();

      expect(find.text('Actions'), findsOneWidget);
      expect(find.byType(MessageOptionItem), findsNWidgets(3));
      expect(find.byKey(promoteToModKey), findsOneWidget);
      expect(find.byKey(removeFromGroupKey), findsOneWidget);
      expect(find.byKey(banUserKey), findsOneWidget);

      await tester.tap(find.byKey(promoteToModKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Abiud Orina is now a moderator'), findsOneWidget);
    });

    testWidgets('should remove a user to from a group',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: GroupUserWidget(
          user: testUser,
          authUserID: 'test-user',
          roomID: 'test-room-id',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Moderator'), findsOneWidget);

      // Tap the user options dialog
      await tester.tap(find.byKey(openUserListOptionDialogKey));
      await tester.pumpAndSettle();

      expect(find.text('Actions'), findsOneWidget);
      expect(find.byType(MessageOptionItem), findsNWidgets(3));
      expect(find.byKey(promoteToModKey), findsOneWidget);
      expect(find.byKey(removeFromGroupKey), findsOneWidget);
      expect(find.byKey(banUserKey), findsOneWidget);

      await tester.tap(find.byKey(removeFromGroupKey));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('User removed from group successfully!'),
        findsOneWidget,
      );
    });

    testWidgets('should ban a user from a group', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: GroupUserWidget(
          user: testUser,
          authUserID: 'test-user',
          roomID: 'test-room-id',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Moderator'), findsOneWidget);

      // Tap the user options dialog
      await tester.tap(find.byKey(openUserListOptionDialogKey));
      await tester.pumpAndSettle();

      expect(find.text('Actions'), findsOneWidget);
      expect(find.byType(MessageOptionItem), findsNWidgets(3));
      expect(find.byKey(promoteToModKey), findsOneWidget);
      expect(find.byKey(removeFromGroupKey), findsOneWidget);
      expect(find.byKey(banUserKey), findsOneWidget);

      await tester.tap(find.byKey(banUserKey));
      await tester.pumpAndSettle();

      // TODO(abiud): Add tests when implementation is done
    });
  });
}
