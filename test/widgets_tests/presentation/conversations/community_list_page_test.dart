import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/conversations/communities_list_page.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CommunityListPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets(
      'renders correctly',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: const CommunitiesListPage(),
        );

        await tester.pumpAndSettle();
        expect(find.byType(CustomAppBar), findsOneWidget);
      },
    );
  });
}
