import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/text_message_widget.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('TextMessageWidget', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: TextMessageWidget(
          roomID: '!testRoom:chat.savannahghi.org',
          wasSentByUser: true,
          senderWidget: const Text('i sent this'),
          timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
          senderID: 'abiudrn:chat.savannahghi.org',
          eventID: 'test-event-id',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TextMessageWidget), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      expect(find.text('i sent this'), findsOneWidget);
    });

    testWidgets('should show a loading indicator when deleting a message',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(deleteMessageFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: TextMessageWidget(
          roomID: '!testRoom:chat.savannahghi.org',
          wasSentByUser: true,
          senderWidget: const Text('i sent this'),
          timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
          senderID: 'abiudrn:chat.savannahghi.org',
          eventID: 'test-event-id',
        ),
      );

      await tester.longPress(find.byKey(messageOptionsKey));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
