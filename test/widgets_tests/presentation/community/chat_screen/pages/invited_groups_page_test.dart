import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/group_invite_item.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('Invited groups Page', () {
    late Store<AppState> store;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'listPendingInvites': <dynamic>[
              <String, dynamic>{
                'id': '12345',
                'name': 'Test',
                'memberCount': 3,
                'gender': <dynamic>[],
                'description': '',
                'createdBy': null
              }
            ]
          }
        }),
        201,
      ),
    );

    setUpAll(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const InvitedGroupsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GroupInviteItem), findsNothing);
    });
  });
}
