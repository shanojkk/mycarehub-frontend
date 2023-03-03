import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/create_room_page.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('CreateRoomPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should create a room correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const CreateRoomPage(),
      );

      await tester.pumpAndSettle();
      expect(find.text('Create a room'), findsOneWidget);

      final Finder nameInput = find.byKey(nameInputKey);
      final Finder topicInput = find.byKey(topicInputKey);

      expect(nameInput, findsOneWidget);
      expect(topicInput, findsOneWidget);

      // Enter the name
      await tester.tap(nameInput);
      await tester.enterText(nameInput, 'wale wazee');
      await tester.pumpAndSettle();

      expect(find.text('wale wazee'), findsOneWidget);

      // Enter the name
      await tester.tap(topicInput);
      await tester.enterText(topicInput, 'wakuu');
      await tester.pumpAndSettle();

      expect(find.text('wakuu'), findsOneWidget);

      // Tap the create room button
      await tester.tap(find.byKey(createRoomKey));
      await tester.pumpAndSettle();
    });

    testWidgets('should launch and pop successfully',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const CreateRoomPage(),
      );

      await tester.pumpAndSettle();
      expect(find.text('Create a room'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });
  });
}
