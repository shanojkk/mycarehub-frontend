import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';

import '../../../test_helpers.dart';

void main() {
  group('CongratulationsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should validate the input', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CongratulationsPage(
          duration: '3 years',
        ),
      );
      await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(nameInputValidateString), findsOneWidget);
    });

    testWidgets('continue button is clickable if input is valid',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CongratulationsPage(
          duration: '3 years',
        ),
      );

      await tester.pumpAndSettle();
      await tester.showKeyboard(find.byType(CustomTextField));
      await tester.enterText(find.byType(CustomTextField), 'Name');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      expect(find.text(nameInputValidateString), findsNothing);
    });
  });
}
