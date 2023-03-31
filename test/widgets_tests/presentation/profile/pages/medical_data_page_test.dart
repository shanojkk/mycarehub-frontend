// Package imports:
import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/profile/medical_data/pages/medical_data_page.dart';
import 'package:pro_health_360/presentation/profile/medical_data/widgets/medical_data_item.dart';
import 'package:pro_health_360/presentation/profile/medical_data/widgets/medical_data_item_title.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('MedicalDataPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: MedicalDataPage(
          graphQlClient: client,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MedicalDataItemTitle), findsWidgets);
      expect(find.byType(MedicalDataItem), findsWidgets);
    });

    testWidgets('should refresh medical items correctly',
        (WidgetTester tester) async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: MedicalDataPage(
          graphQlClient: client,
        ),
      );
      await tester.pumpAndSettle();

      await tester.fling(
        find.byType(MedicalDataItemTitle).first,
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();

      expect(find.byType(MedicalDataItemTitle), findsWidgets);
      expect(find.byType(MedicalDataItem), findsWidgets);
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: MedicalDataPage(
          graphQlClient: client,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MedicalDataItemTitle), findsWidgets);
      expect(find.byType(MedicalDataItem), findsWidgets);
    });

    testWidgets(
      'should show GenericErrorWidget when medical data responses are empty',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'getMedicalData': mockEmptyMedicalData}
            }),
            201,
          ),
        );

        await buildTestWidget(
          store: store,
          tester: tester,
          client: mockShortGraphQlClient,
          widget: const MedicalDataPage(),
        );
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
        await tester.tap(genericNoDataButton);
        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets(
      'should show GenericErrorWidget when there is no data',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'getMedicalData': null}
            }),
            201,
          ),
        );

        await buildTestWidget(
          store: store,
          tester: tester,
          client: mockShortGraphQlClient,
          widget: const MedicalDataPage(),
        );
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
        await tester.tap(genericNoDataButton);
        expect(genericNoDataButton, findsOneWidget);
      },
    );

    testWidgets('Shows loading indicator when fetching members',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchMedicalDataFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const MedicalDataPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
