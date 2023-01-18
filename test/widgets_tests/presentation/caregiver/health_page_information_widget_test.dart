import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/health_page_information_widget.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('HealthPageInformationWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: HealthPageInformationWidget(
          user: store.state.clientState?.clientProfile?.user,
          firstName: 'firstName',
          lastName: 'lastName',
          userPhoneNumber: 'userPhoneNumber',
          hospitalName: 'hospitalName',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      await tester.pumpAndSettle();
      //TODO(Byron): Add more expectations when logic is hooked up:
    });
  });
}
