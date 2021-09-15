import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/medications/medications_landing_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helpers.dart';

void main() {
  group('BuyMedicineLandingPage test', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('BuyMedicineLandingPage renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: BuyMedicineLandingPage(),
      );
      await tester.pumpAndSettle();

      final Finder listViewWidget = find.byType(ListView);
      expect(listViewWidget, findsOneWidget);
    });
  });
}
