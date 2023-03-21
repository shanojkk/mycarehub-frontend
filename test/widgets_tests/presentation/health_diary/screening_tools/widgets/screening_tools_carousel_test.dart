import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/assessment/pages/alcohol_substance_use_page.dart';
import 'package:pro_health_360/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:pro_health_360/presentation/assessment/pages/tuberculosis_assessment_page.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tools_carousel.dart';
import 'package:pro_health_360/presentation/violence_assessment/pages/violence_assessment_page.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('ScreeningToolsCarousel', () {
    late Store<AppState> store;
    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
      'should navigate to violence assessment page and back',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const ScreeningToolsCarousel(),
        );
        await tester.pumpAndSettle();

        expect(
          find.byType(HomePageCarouselItem, skipOffstage: false),
          findsOneWidget,
        );
        expect(find.byKey(violenceKey), findsOneWidget);

        // tap the violence menu item and go back
        await tester.tap(find.byKey(violenceKey));
        await tester.pumpAndSettle();
        expect(find.byType(ViolenceAssessmentPage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(HomePageCarouselItem), findsOneWidget);
      },
    );

    testWidgets(
      'should navigate to contraceptive assessment page and back',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(contraceptivesMock), 200),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const ScreeningToolsCarousel(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(HomePageCarouselItem), findsOneWidget);
        expect(find.byKey(contraceptiveKey), findsOneWidget);

        // tap the contraceptive menu item and go back
        await tester.scrollUntilVisible(find.byKey(contraceptiveKey), 800);
        await tester.tap(find.byKey(contraceptiveKey));
        await tester.pumpAndSettle();
        expect(find.byType(ContraceptiveAssessmentPage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(HomePageCarouselItem), findsOneWidget);
      },
    );

    testWidgets(
      'should navigate to tuberculosis assessment page and back',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(tbMock), 200),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const ScreeningToolsCarousel(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(HomePageCarouselItem), findsOneWidget);
        expect(find.byKey(tuberculosisKey), findsOneWidget);

        // tap the violence menu item and go back
        await tester.scrollUntilVisible(find.byKey(tuberculosisKey), 800);
        await tester.tap(find.byKey(tuberculosisKey));
        await tester.pumpAndSettle();
        expect(find.byType(TuberculosisAssessmentPage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(HomePageCarouselItem), findsOneWidget);
      },
    );

    testWidgets(
      'should navigate to alcohol assessment page and back',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(alcoholMock), 200),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const ScreeningToolsCarousel(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(HomePageCarouselItem), findsOneWidget);
        expect(find.byKey(alcoholUseKey, skipOffstage: false), findsOneWidget);

        // tap the violence menu item and go back
        await tester.scrollUntilVisible(find.byKey(alcoholUseKey), 800);
        await tester.tap(find.byKey(alcoholUseKey));
        await tester.pumpAndSettle();
        expect(find.byType(AlcoholSubstanceUsePage), findsOneWidget);
        await tester.tap(find.byKey(appBarBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(HomePageCarouselItem), findsOneWidget);
      },
    );
  });
}
