import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/phase_2/client_selection_page.dart';
import 'package:pro_health_360/phase_2/facility_selection_page.dart';
import 'package:pro_health_360/phase_2/widgets/general_workstation_widget.dart';
import 'package:pro_health_360/phase_2/client_caregiver_selection_page.dart';

import '../../mocks.dart';
import '../../test_helpers.dart';

void main() {
  group('WorkStation Chooser page', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ClientCaregiverSelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GeneralWorkstationWidget), findsNWidgets(2));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(ClientSelectionPage), findsOneWidget);
    });
    testWidgets('navigates to home page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ClientCaregiverSelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GeneralWorkstationWidget), findsNWidgets(2));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton).last);
      await tester.pumpAndSettle();
      expect(find.byType(FacilitySelectionPage), findsOneWidget);
    });
  });
}
