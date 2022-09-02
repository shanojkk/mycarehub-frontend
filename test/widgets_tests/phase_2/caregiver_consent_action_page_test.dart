import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/phase_2/caregiver_consent_action_page.dart';

import '../../mocks.dart';
import '../../test_helpers.dart';

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
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(2));

      expect(
        find.text(getConsentActionDescription('Jane Doe')),
        findsOneWidget,
      );
    });
  });
}
