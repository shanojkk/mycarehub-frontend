import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/invite_users_page.dart';
import 'package:pro_health_360/presentation/communities/widgets/user_list_item.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('InviteUsersPage', () {
    late Store<AppState> store;

    setUp(() async {
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
        widget: InviteUsersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pumpAndSettle();
      expect(find.text('Invite Members'), findsOneWidget);
      expect(find.text('No members'), findsOneWidget);
    });

    testWidgets('should search for and group members',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: InviteUsersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pumpAndSettle();
      expect(find.text('Invite Members'), findsOneWidget);
      expect(find.text('No members'), findsOneWidget);

      final Finder searchInput = find.byKey(searchMembersInputKey);
      expect(searchInput, findsOneWidget);
      await tester.tap(searchInput);
      await tester.pumpAndSettle();

      await tester.enterText(searchInput, 'abiud');
      await tester.pumpAndSettle();

      /// Verify search results
      expect(find.byType(UserListItem), findsOneWidget);
      expect(find.text('Abiud Orina'), findsOneWidget);
    });

    testWidgets('should invite someone to a group',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: InviteUsersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pumpAndSettle();
      expect(find.text('Invite Members'), findsOneWidget);
      expect(find.text('No members'), findsOneWidget);

      final Finder searchInput = find.byKey(searchMembersInputKey);
      expect(searchInput, findsOneWidget);
      await tester.tap(searchInput);
      await tester.pumpAndSettle();

      await tester.enterText(searchInput, 'abiud');
      await tester.pumpAndSettle();

      /// Verify search results
      expect(find.byType(UserListItem), findsOneWidget);
      expect(find.text('Abiud Orina'), findsOneWidget);

      // Invite them to the group
      await tester.tap(find.byKey(const Key('@abiudrn:chat.savannahghi.org')));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
