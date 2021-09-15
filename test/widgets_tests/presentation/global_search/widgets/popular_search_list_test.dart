import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/popular_search_list.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_content_card.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_image_httpclient.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  final MockGraphQlClient client = MockGraphQlClient();
  setUpAll(() {
    HttpOverrides.global = BWTestHttpOverrides();
  });
  group('PopularSearchList', () {
    testWidgets(
      'should render list of popular searchers',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: Store<AppState>(initialState: AppState.initial()),
          client: client,
          widget: const MaterialApp(
            home: PopularSearchList(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text(searchPageSubtitle), findsOneWidget);
        expect(find.byType(SearchPageActionCard), findsNWidgets(1));
      },
    );

    testWidgets(
      'should find search page action card',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: Store<AppState>(initialState: AppState.initial()),
          client: client,
          widget: const MaterialApp(
            home: PopularSearchList(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text(searchPageSubtitle), findsOneWidget);
        expect(find.byType(SearchPageActionCard), findsNWidgets(1));
      },
    );

    testWidgets(
      'should navigate to library page when library is tapped',
      (WidgetTester tester) async {
        final MockNavigatorObserver mockNavigatorObserver =
            MockNavigatorObserver();
        await buildTestWidget(
          tester: tester,
          store: Store<AppState>(initialState: AppState.initial()),
          client: client,
          widget: MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
            home: const PopularSearchList(),
          ),
        );
        await tester.pumpAndSettle();

        final Finder libraryCard = find.text(viewLibrary);
        expect(libraryCard, findsOneWidget);

        await tester.tap(libraryCard);
        await tester.pumpAndSettle();

        expect(libraryCard, findsNothing);
      },
    );
  });
}
