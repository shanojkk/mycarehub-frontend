// Package imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/update_client_profile_action.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/identifier.dart';
import 'package:sghi_core/afya_moja_core/src/enums.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/health_page_information_widget.dart';
import 'package:pro_health_360/presentation/health_diary/pages/my_health_diary_page.dart';
import 'package:pro_health_360/presentation/my_health/pages/appointments_page.dart';
import 'package:pro_health_360/presentation/my_health/pages/my_health_page.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/my_health_timeline.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/my_health_timeline_container.dart';
import 'package:pro_health_360/presentation/profile/medical_data/pages/medical_data_page.dart';
import 'package:pro_health_360/presentation/profile/pages/user_profile_page.dart';

import '../../../mock_data.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('MyHealthPage', () {
    late Store<AppState> store;
    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 900);
      tester.binding.window.devicePixelRatioTestValue = 1;

      final MockGraphQlClient client = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: const MyHealthPage(),
      );
      expect(find.byType(MyHealthPage), findsOneWidget);
      expect(find.text(myHealthPageHealthDiary), findsOneWidget);
      await tester.tap(find.text(myHealthPageHealthDiary));
      await tester.pumpAndSettle();
      expect(find.byType(MyHealthDiaryPage), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('navigates to UserProfilePage ', (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(firstName: 'Test', lastName: 'Name'),
      );
      store.dispatch(
        UpdateClientProfileAction(
          identifiers: <Identifier>[
            Identifier(
              id: 'some-id',
              type: IdentifierType.CCC,
              value: '712345678',
            ),
          ],
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const MyHealthPage(),
      );

      await tester.tap(find.byType(HealthPageInformationWidget));
      await tester.pumpAndSettle();
      expect(find.byType(UserProfilePage), findsOneWidget);
    });

    testWidgets('navigates to Appointments Page ', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const MyHealthPage(),
      );
      final Finder myHealthPageAppointmentsFinder =
          find.text(myHealthPageAppointments);
      expect(myHealthPageAppointmentsFinder, findsOneWidget);
      await tester.ensureVisible(myHealthPageAppointmentsFinder);
      await tester.tap(myHealthPageAppointmentsFinder);
      await tester.pumpAndSettle();
      expect(find.byType(AppointmentsPage), findsOneWidget);
    });

    testWidgets('navigates to MedicalData Page ', (WidgetTester tester) async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRObservation': mockViralLoadData,
              'nextRefill': ''
            }
          }),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: MyHealthPage(
          graphQlClient: client,
        ),
      );
      await tester.pumpAndSettle();

      final Finder medicalDataFinder = find.text(medicalDataTitle);
      expect(medicalDataFinder, findsOneWidget);
      await tester.ensureVisible(medicalDataFinder);
      await tester.tap(medicalDataFinder);
      await tester.pumpAndSettle();
      expect(find.byType(MedicalDataPage), findsOneWidget);
    });

    testWidgets('renders next refill data ', (WidgetTester tester) async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRObservation': mockViralLoadData,
              'nextRefill': '2023-12-12'
            }
          }),
          200,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: MyHealthPage(
          graphQlClient: client,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(myHealthNextRefill), findsOneWidget);
    });

    testWidgets('navigates to health timeline page ',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: MyHealthPage(graphQlClient: MockGraphQlClient()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyHealthTimeline), findsOneWidget);

      final Finder viewMore = find.text(viewMoreText);
      expect(find.text(viewMoreText), findsOneWidget);
      await tester.ensureVisible(viewMore);
      await tester.tap(viewMore);
      await tester.pumpAndSettle();
      expect(find.byType(MyHealthTimelineContainer), findsOneWidget);
    });
  });
}
