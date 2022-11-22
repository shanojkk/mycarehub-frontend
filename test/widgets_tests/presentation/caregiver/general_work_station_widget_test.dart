import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/general_workstation_widget.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('GeneralWorkstationWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      String testValue = '';
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: GeneralWorkstationWidget(
          title: 'testTitle',
          subtitle: 'testSubtitle',
          onButtonCallback: () => testValue = 'btnTapped',
          buttonText: 'test',
          bodyWidget: const SizedBox(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
      expect(find.text('testSubtitle'), findsOneWidget);
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));

      await tester.pumpAndSettle();
      expect(testValue, 'btnTapped');
    });
  });
}
