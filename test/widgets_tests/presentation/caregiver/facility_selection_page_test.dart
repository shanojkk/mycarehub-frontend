import 'dart:convert';

import 'package:http/http.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/caregiver/pages/facility_selection_page.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/general_workstation_widget.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/summary_badge_widget.dart';
import 'package:pro_health_360/presentation/home/pages/home_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('Facility Selection Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    final StoreTester<AppState> storeTester =
        StoreTester<AppState>(initialState: AppState.initial());

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        client: MockGraphQlClient(),
        widget: const FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GeneralWorkstationWidget), findsNWidgets(2));

      expect(find.byType(SummaryBadgeWidget), findsNWidgets(4));
      await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('renders loader correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(WaitAction<AppState>.add(setDefaultFacilityFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const FacilitySelectionPage(),
      );
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets(' navigates to home page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      final Finder primaryButton = find.byType(MyAfyaHubPrimaryButton).last;

      await tester.ensureVisible(primaryButton);
      await tester.tap(primaryButton);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('navigates to home page correctly when there is one facility',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getClientFacilities': <String, dynamic>{
                  'facilities': <dynamic>[
                    <String, dynamic>{
                      'id': 'some-id',
                      'name': 'Test Facility',
                      'code': 1234,
                      'description': '',
                      'phone': '',
                      'active': true,
                      'county': 'Test',
                      'fhirOrganisationID': '',
                      'workStationDetails': <String, dynamic>{
                        'notifications': 1,
                        'messages': 1,
                        'serviceRequests': 1
                      }
                    }
                  ]
                },
                'setStaffDefaultFacility': true,
              }
            }),
            201,
          ),
        ),
        widget: const FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
