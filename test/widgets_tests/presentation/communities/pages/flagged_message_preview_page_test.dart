import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:pro_health_360/presentation/communities/pages/flagged_message_preview_page.dart';
import 'package:pro_health_360/presentation/communities/pages/message_item_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/banned_user_list_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FlaggedMessagePreviewPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .chatState!
            .call(userProfile: User.fromJson(loginResponseMock)),
      );
    });

    testWidgets('should show a flagged message members',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: FlaggedMessagePreviewPage(
          event: EventReport.fromJson(eventReportMock),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FlaggedMessagePreviewPage), findsOneWidget);
      expect(find.byType(MessageItemWidget), findsOneWidget);
    });

    testWidgets(
        'should show a zero state if the flagged messages details are '
        'not available', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(jsonEncode(<String, dynamic>{}), 200),
        ),
        widget: FlaggedMessagePreviewPage(
          event: EventReport.fromJson(eventReportMock),
        ),
      );

      await tester.pump();

      expect(find.byType(FlaggedMessagePreviewPage), findsOneWidget);
      expect(find.byType(BannedUserListItem), findsNothing);

      await tester.pump(const Duration(seconds: 5));

      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });
  });
}
