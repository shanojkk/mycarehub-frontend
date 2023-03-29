import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/presentation/communities/widgets/invite_user_widget.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('InviteUserWidget', () {
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

    testWidgets('should invite a user to a group', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: InviteUserWidget(
          user: testUser.roomUser!,
          authUserID: 'test-user',
          roomID: 'test-room-id',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Abiud Orina'), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      expect(find.byKey(const Key(testUserID)), findsOneWidget);

      await tester.tap(find.byKey(const Key(testUserID)));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Abiud Orina has been invited successfully'),
        findsOneWidget,
      );
    });
  });
}
