import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/doctors/doctors_page.dart';

import 'package:myafyahub/presentation/router/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myafyahub/presentation/engagement/global_search/widgets/search_content_card.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:unicons/unicons.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SearchPageActionCard', () {
    Store<AppState> store;
    final AppState state = AppState.initial();
    store = Store<AppState>(initialState: state);

    final MockGraphQlClient GraphQlClient = MockGraphQlClient();

    testWidgets('search page card should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: GraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return const SearchPageActionCard(
                actionIcon: Icon(UniconsLine.shield_plus),
                actionName: 'demo Name',
                actionRoute: BWRoutes.searchPage,
              );
            },
          ));
      await tester.pumpAndSettle();
      //expect to find rendered widgets
      expect(find.byType(SearchPageActionCard), findsOneWidget);
      expect(find.byKey(searchActionCardKey), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.text('demo Name'), findsOneWidget);
    });

    testWidgets('search card button works correctly ',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const SearchPageActionCard(
            actionIcon: Icon(UniconsLine.books),
            actionName: 'demo Name',
            actionRoute: BWRoutes.seeDoctor,
          );
        }),
      );
      await tester.pumpAndSettle();
      //expect to find rendered card page
      expect(find.byType(SearchPageActionCard), findsOneWidget);

      // expect to find the tappable card
      expect(find.byKey(searchActionCardKey), findsOneWidget);

      // tap the card and expect it to work correctly
      await tester.tap(find.byKey(searchActionCardKey));
      await tester.pumpAndSettle();

      // verify(mockObserver.didPush(sampleRoute, any));
      expect(find.byType(SeeDoctorLandingPage), findsOneWidget);
    });
  });
}
