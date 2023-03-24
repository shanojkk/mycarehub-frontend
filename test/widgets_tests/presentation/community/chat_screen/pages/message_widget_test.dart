import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/message_item_widget.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/text_message_widget.dart';
import 'package:sghi_core/communities/models/message.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MessageWidget', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should return a deleted message widget for a redaction event',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: MessageItemWidget(
          message: Message.fromJson(redactionEventMock),
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('This message was deleted'), findsOneWidget);
    });

    testWidgets('should return a joined message widget for a join event',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: MessageItemWidget(
          message: Message.fromJson(memberEventMock),
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('abiudrn joined'), findsOneWidget);
    });

    testWidgets('should return a topic message widget for a topic event',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: MessageItemWidget(
          message: Message.fromJson(topicEventMock),
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(
        find.text('The topic was set to All about gaming'),
        findsOneWidget,
      );
    });

    testWidgets('should return a creation message widget for a create event',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: MessageItemWidget(
          message: Message.fromJson(createEventMock),
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
    });

    testWidgets('should return a message widget for a message event',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: MessageItemWidget(
          message: Message.fromJson(messageEventMock),
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);
    });
  });
}
