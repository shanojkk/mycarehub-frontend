import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/communities/pages/accept_group_invites_page.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('AcceptGroupInvitations Page', () {
    late Store<AppState> store;

    setUpAll(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    final MockShortGraphQlClient rejectMockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'rejectInvitation': true,
              'retrieveFacility': <String, dynamic>{
                'ID': 'some-id',
                'name': 'name',
                'code': 1111,
                'county': 'Nairobi',
                'active': true,
                'phone': '+254712345678',
                'description': 'name Hospital'
              }
            }
          },
        ),
        200,
      ),
    );
    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly and accepts invitation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const AcceptGroupInvitesPage(
          groupId: '',
          groupName: '',
          numberOfMembers: 0,
          acceptInviteRoute: AppRoutes.userProfilePage,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(joinGroup));
    });

    testWidgets('renders correctly and rejects an invitation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: rejectMockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.acceptGroupInvitesPage,
                  arguments: <String, dynamic>{
                    'groupId': 'test',
                    'groupName': 'test',
                    'numberOfMembers': 20,
                  },
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(RawMaterialButton));
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
      expect(find.text(joinGroup), findsOneWidget);
      expect(find.text(declineInvite), findsOneWidget);

      await tester.tap(find.text(declineInvite));
    });
  });
}
