import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/normal_message_item.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/text_message_widget.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('NormalMessageWidget', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets("should process a message and show it's contents",
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(messageEventMock),
          wasSentByUser: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);
    });

    // testWidgets('should show an image contained in a message',
    //     (WidgetTester tester) async {
    //   await buildTestWidget(
    //     tester: tester,
    //     store: store,
    //     client: MockGraphQlClient(),
    //     widget: NormalMessageWidget(
    //       message: Message.fromJson(imageEventMock),
    //       wasSentByUser: true,
    //       roomID: '!testRoom:chat.savannahghi.org',
    //     ),
    //   );

    //   await tester.pumpAndSettle(const Duration(seconds: 40));
    //   // expect(find.byType(NormalMessageItem), findsOneWidget);
    //   // expect(find.byType(MediaItem), findsOneWidget);
    // });

    testWidgets('should open the message options dialog',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(messageEventMock),
          wasSentByUser: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);

      await tester.tap(find.byKey(messageOptionsKey));
      await tester.pumpAndSettle();

      await tester.longPress(find.byKey(messageOptionsKey));
      await tester.pumpAndSettle();

      expect(find.byKey(replyMessageKey), findsOneWidget);
      expect(find.byKey(deleteMessageKey), findsOneWidget);
    });

    testWidgets('should open the message options dialog and delete a message',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(messageEventMock),
          wasSentByUser: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);

      await tester.longPress(find.byKey(messageOptionsKey));
      await tester.pumpAndSettle();

      expect(find.byKey(replyMessageKey), findsOneWidget);
      expect(find.byKey(deleteMessageKey), findsOneWidget);

      await tester.tap(find.byKey(replyMessageKey));
      await tester.pumpAndSettle();

      // TODO(abiud): Add assertions after implementation is done

      await tester.tap(find.byKey(deleteMessageKey));
      await tester.pumpAndSettle();

      // We can't assert this because it pops after completion
    });
  });
}
