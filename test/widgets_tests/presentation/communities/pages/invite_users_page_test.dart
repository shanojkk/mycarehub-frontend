import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/invite_users_page.dart';
import 'package:pro_health_360/presentation/communities/widgets/invite_user_widget.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

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
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('should build correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: InviteUsersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pumpAndSettle();
      expect(find.text(inviteMembersText), findsOneWidget);
      expect(find.text(noMembers), findsOneWidget);
    });

    testWidgets('should search for and group members',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: InviteUsersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pumpAndSettle();

      expect(find.text(inviteMembersText), findsOneWidget);
      expect(find.text(searchMembersDescription), findsOneWidget);
      expect(find.text('No members'), findsOneWidget);

      final Finder searchInput = find.byKey(searchMembersInputKey);
      expect(searchInput, findsOneWidget);
      await tester.tap(searchInput);
      await tester.pumpAndSettle();

      await tester.enterText(searchInput, 'abiud');
      await tester.pumpAndSettle();

      /// Verify search results
      expect(find.byType(InviteUserWidget), findsOneWidget);
      expect(find.text('Abiud Orina'), findsOneWidget);
    });
  });
}
