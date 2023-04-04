import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/normal_message_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/image_item_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/text_message_widget.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

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
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets("should process a normal message and show it's contents",
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

    testWidgets('should show process a media message',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(imageEventMock),
          wasSentByUser: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pump(const Duration(seconds: 30));
      expect(find.byType(NormalMessageWidget), findsOneWidget);
      expect(find.byType(ImageItemWidget), findsOneWidget);
    });

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

      expect(find.byKey(reportMessageKey), findsOneWidget);
      expect(find.byKey(deleteMessageKey), findsOneWidget);
    });
  });
}
