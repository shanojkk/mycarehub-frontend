import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/image_preview_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/image_item_widget.dart';
import 'package:sghi_core/communities/models/message.dart';
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

    testWidgets('should render correctly and preview an image',
        (WidgetTester tester) async {
      final Message msg = Message.fromJson(imageEventMock);
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: ImageItemWidget(
          imageURL: msg.content?.url ?? '',
          sender: const Text('testUser'),
          wasSentByUser: true,
          timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );

      await tester.pump();
      expect(find.byType(ImageItemWidget), findsOneWidget);

      await tester.tap(find.byKey(previewImageMessageKey));

      await tester.pump();
      await tester.pump();

      expect(find.byType(ImagePreviewPage), findsOneWidget);
    });
  });
}
