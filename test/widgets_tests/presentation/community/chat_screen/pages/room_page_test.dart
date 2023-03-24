import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/group_info_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/message_item_widget.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/review_invite_widget.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/text_message_widget.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('RoomPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should load correctly and show some messages',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: RoomPage(
          room: Room.fromJson(roomMock),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);
      expect(find.byType(MessageItemWidget), findsNWidgets(2));

      expect(find.byKey(messageInputKey), findsOneWidget);
    });

    testWidgets('should open group info page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: RoomPage(
          room: Room.fromJson(roomMock),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);
      expect(find.byType(MessageItemWidget), findsNWidgets(2));

      expect(find.byKey(navigateToGroupInfoPageKey), findsOneWidget);

      await tester.tap(find.byKey(navigateToGroupInfoPageKey));
      await tester.pumpAndSettle();

      expect(find.byType(RoomInfoPage), findsOneWidget);
    });

    testWidgets('should show ReviewInviteWidget if a room has a pending invite',
        (WidgetTester tester) async {
      roomMock.addAll(<String, dynamic>{'invite': true});

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: RoomPage(
          room: Room.fromJson(roomMock),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ReviewInviteWidget), findsOneWidget);
      expect(find.byKey(acceptInviteKey), findsOneWidget);

      roomMock.addAll(<String, dynamic>{'invite': false});
    });

    testWidgets('should send a message', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: RoomPage(
          room: Room.fromJson(roomMock),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);
      expect(find.byType(MessageItemWidget), findsNWidgets(2));

      final Finder msgInput = find.byKey(messageInputKey);
      await tester.tap(msgInput);
      await tester.enterText(msgInput, 'we mzee');
      await tester.pumpAndSettle();

      expect(find.text('we mzee'), findsOneWidget);

      await tester.tap(find.byKey(sendMessageIconKey));
      await tester.pumpAndSettle();

      expect(find.text('we mzee'), findsNothing);
    });
  });
}
