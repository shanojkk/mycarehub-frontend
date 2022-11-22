import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/caregiver/pages/caregiver_consent_action_page.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/remove_caregiver_dialog.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CaregiverConsentActionsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: CaregiverConsentActionsPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(doNotAcceptButtonKey), findsOneWidget);
      expect(find.byKey(acceptButtonKey), findsOneWidget);
    });

    testWidgets('dialog works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: CaregiverConsentActionsPage(),
      );

      final Finder acceptButton = find.byKey(acceptButtonKey);
      final Finder removeCaregiverButton = find.byKey(removeCaregiverButtonKey);
      final Finder cancelButton = find.byKey(cancelButtonKey);
      await tester.pumpAndSettle();
      expect(acceptButton, findsOneWidget);

      await tester.tap(acceptButton);
      await tester.pumpAndSettle();
      expect(removeCaregiverButton, findsOneWidget);

      await tester.tap(removeCaregiverButton);
      await tester.pumpAndSettle();
      expect(find.byType(RemoveCaregiverDialog), findsOneWidget);
      expect(cancelButton, findsOneWidget);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(find.byType(RemoveCaregiverDialog), findsNothing);
    });
    testWidgets('dialog remove caregiver button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: CaregiverConsentActionsPage(),
      );

      final Finder acceptButton = find.byKey(acceptButtonKey);
      final Finder removeCaregiverButton = find.byKey(removeCaregiverButtonKey);
      final Finder textFormField = find.byType(TextFormField);
      await tester.pumpAndSettle();
      expect(acceptButton, findsOneWidget);

      await tester.tap(acceptButton);
      await tester.pumpAndSettle();
      expect(removeCaregiverButton, findsOneWidget);

      await tester.tap(removeCaregiverButton);
      await tester.pumpAndSettle();
      expect(find.byType(RemoveCaregiverDialog), findsOneWidget);

      await tester.tap(textFormField);
      await tester.enterText(textFormField, removeString);
      await tester.pumpAndSettle();
      await tester.tap(removeCaregiverButton.last);
      await tester.pumpAndSettle();
      expect(find.byType(RemoveCaregiverDialog), findsNothing);
    });
  });
}
