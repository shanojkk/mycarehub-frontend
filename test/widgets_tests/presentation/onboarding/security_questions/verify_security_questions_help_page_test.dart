import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/onboarding/forgot_pin/pages/verify_security_questions_help_page.dart';
import 'package:pro_health_360/presentation/onboarding/login/pages/login_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('VerifySecurityQuestionsHelpPage', () {
    late Store<AppState> store;

    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();

      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(UpdateOnboardingStateAction(phoneNumber: '0712345678'));
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: VerifySecurityQuestionsHelpPage(),
      );
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));
    });

    testWidgets('CCC number input validates correctly',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'status': true}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );

      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      final Finder cccInput = find.byKey(cccInputKey);
      expect(tryAgainButton, findsOneWidget);
      expect(askForHelpButton, findsOneWidget);
      expect(cccInput, findsOneWidget);

      await tester.tap(askForHelpButton);
      await tester.pumpAndSettle();
      expect(find.text('Your CCC number is required'), findsOneWidget);

      await tester.showKeyboard(cccInput);
      await tester.enterText(cccInput, '0123456789');
      await tester.pumpAndSettle();

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(successfulPINResetRequestString), findsOneWidget);
    });

    testWidgets('try again button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockShortGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );

      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      expect(tryAgainButton, findsOneWidget);

      await tester.tap(tryAgainButton);
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('should show snackbar with error message when an error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error occurred'}),
          400,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      final Finder tryAgainButton = find.byKey(tryAgainButtonKey);
      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      final Finder cccInput = find.byKey(cccInputKey);
      expect(tryAgainButton, findsOneWidget);
      expect(askForHelpButton, findsOneWidget);
      expect(cccInput, findsOneWidget);

      await tester.tap(askForHelpButton);
      await tester.pumpAndSettle();
      expect(find.text('Your CCC number is required'), findsOneWidget);

      await tester.showKeyboard(cccInput);
      await tester.enterText(cccInput, '0123456789');
      await tester.pumpAndSettle();

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(getErrorMessage(sendingPINResetRequestSting)),
        findsOneWidget,
      );
    });

    testWidgets(
        'should show snackbar with error message when status is not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'status': null}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: VerifySecurityQuestionsHelpPage(),
            );
          },
        ),
      );

      final Finder askForHelpButton = find.byKey(askForHelpButtonKey);
      final Finder cccInput = find.byKey(cccInputKey);
      expect(askForHelpButton, findsOneWidget);
      expect(cccInput, findsOneWidget);

      await tester.showKeyboard(cccInput);
      await tester.enterText(cccInput, '0123456789');
      await tester.pumpAndSettle();

      await tester.tap(askForHelpButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text(getErrorMessage(sendingPINResetRequestSting)),
        findsOneWidget,
      );
    });

    testWidgets('should show a loading indicator when sending service request',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(WaitAction<AppState>.add(pinResetServiceRequestFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: VerifySecurityQuestionsHelpPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
