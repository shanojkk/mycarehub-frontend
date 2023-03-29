import 'dart:convert';

import 'package:http/http.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/assessment/pages/alcohol_substance_use_page.dart';
import 'package:pro_health_360/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:pro_health_360/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';
import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  setupFirebaseAnalyticsMocks();

  group('AlcoholSubstanceUsePage', () {
    late Store<AppState> store;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(json.encode(alcoholMock), 200),
    );

    setUp(() async {
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const AlcoholSubstanceUsePage(),
      );
      await tester.pumpAndSettle();

      final Finder submitButtonFinder = find.byType(MyAfyaHubPrimaryButton);

      expect(find.text(alcoholSubstanceUseTitle), findsOneWidget);
      expect(
        find.byType(ScreeningToolQuestionWidget, skipOffstage: false),
        findsOneWidget,
      );

      await tester.tap(find.byType(CustomChipWidget).first);
      await tester.ensureVisible(submitButtonFinder);
      await tester.tap(submitButtonFinder);

      await tester.pumpAndSettle();
      expect(find.byType(SuccessfulAssessmentSubmissionPage), findsOneWidget);
    });

    testWidgets('handles errors correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getScreeningToolQuestions': <dynamic>[]
              }
            }),
            400,
          ),
        ),
        widget: const AlcoholSubstanceUsePage(),
      );

      await tester.pumpAndSettle();
      final Finder submitButtonFinder = find.byType(MyAfyaHubPrimaryButton);
      expect(submitButtonFinder, findsOneWidget);
      expect(find.byType(ScreeningToolQuestionWidget), findsNothing);
    });

    testWidgets('shows snackbar to prompt user to answer all questions',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const AlcoholSubstanceUsePage(),
      );
      await tester.pumpAndSettle();

      final Finder submitButtonFinder = find.byType(MyAfyaHubPrimaryButton);

      expect(find.text(alcoholSubstanceUseTitle), findsOneWidget);
      expect(
        find.byType(ScreeningToolQuestionWidget, skipOffstage: false),
        findsOneWidget,
      );

      await tester.ensureVisible(submitButtonFinder);
      await tester.tap(submitButtonFinder);

      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
