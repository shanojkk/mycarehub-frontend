import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/communities/pages/banned_members_page.dart';
import 'package:pro_health_360/presentation/communities/widgets/banned_user_list_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('BannedMembersPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .chatState!
            .call(userProfile: User.fromJson(loginResponseMock)),
      );
    });

    testWidgets('should show banned members', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: BannedMembersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pump();

      expect(find.byType(BannedMembersPage), findsOneWidget);
      expect(find.byType(BannedUserListItem), findsOneWidget);

      await tester.pump();

      expect(find.text('@abiudrn'), findsOneWidget);
    });

    testWidgets('should show a zero state if there are no banned members',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(jsonEncode(<String, dynamic>{'chunk': <dynamic>[]}), 200),
        ),
        widget: BannedMembersPage(room: Room.fromJson(roomMock)),
      );

      await tester.pump();

      expect(find.byType(BannedMembersPage), findsOneWidget);
      expect(find.byType(BannedUserListItem), findsNothing);

      await tester.pump(const Duration(seconds: 5));

      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });
  });
}
