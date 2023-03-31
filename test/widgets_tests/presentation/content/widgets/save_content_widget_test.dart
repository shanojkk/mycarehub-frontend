import 'dart:convert';
import 'dart:io';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/widgets/save_content_widget.dart';

import '../../../../mock_data.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SaveContentWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserBookmarkedContent': true,
            }
          }),
          201,
        ),
      );
      store.dispatch(
        UpdateContentStateAction(
          contentItems: <Content>[mockContent.copyWith(hasLiked: true)],
        ),
      );
      await tester.runAsync(() async {
        TestWidgetsFlutterBinding.ensureInitialized();
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SaveContentWidget(
            contentID: mockContent.contentID!,
            contentDisplayedType: ContentDisplayedType.FEED,
          ),
        );
        await tester.pumpAndSettle();

        final Finder saveButton = find.byKey(saveButtonKey);
        expect(saveButton, findsOneWidget);

        await tester.ensureVisible(saveButton);
        await tester.pumpAndSettle();
        await tester.tap(saveButton);
        await tester.pumpAndSettle();

        expect(find.text('Save'), findsNothing);
      });
    });
  });
}
