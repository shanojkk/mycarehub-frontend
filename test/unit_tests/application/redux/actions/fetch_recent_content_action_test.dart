import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_recent_content_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FetchRecentContentAction', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should throw error if api call is not 200',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, String>{'error': 'error occurred'}),
          500,
        ),
      );
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    FetchRecentContentAction(context: context),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );
      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should throw error if there is an error ',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, String>{'error': 'timeout'}),
          400,
        ),
      );
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    FetchRecentContentAction(context: context),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );
      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });
  });
}
