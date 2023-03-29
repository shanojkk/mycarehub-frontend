import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/preview_upload_image_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/image_attachment_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ImageAttachmentWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());

      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('should select an image attachment',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: ImageAttachmentWidget(
          roomID: 'Test User',
          picker: ImagePickerMock(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ImageAttachmentWidget), findsOneWidget);
      expect(find.byKey(addAttachmentIconKey), findsOneWidget);

      await tester.tap(find.byKey(addAttachmentIconKey));
      await tester.pumpAndSettle();

      expect(find.byType(PreviewUploadImage), findsOneWidget);
      expect(find.text(sendImageString), findsOneWidget);
    });
  });
}
