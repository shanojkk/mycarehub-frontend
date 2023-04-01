import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/send_message_input.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SendMessageInput', () {
    TestWidgetsFlutterBinding.ensureInitialized();

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

    testWidgets('should render correctly and send a message',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget:
            const SendMessageInput(roomID: '!testRoom:chat.savannahghi.org'),
      );

      await tester.pumpAndSettle();
      expect(find.text(sendMessageString), findsOneWidget);

      final Finder msgInput = find.byKey(messageInputKey);
      expect(msgInput, findsOneWidget);

      await tester.tap(msgInput);
      await tester.enterText(msgInput, 'we mzee');
      await tester.pumpAndSettle();

      expect(find.text('we mzee'), findsOneWidget);

      // Send a message while tapping the enter key
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text('we mzee'), findsNothing);
    });
  });
}
