import 'dart:convert';

import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/core/user_profile.dart';
import 'package:pro_health_360/domain/core/entities/login/phone_login_response.dart';
import 'package:pro_health_360/presentation/onboarding/program_selection/program_selection_page.dart';
import 'package:pro_health_360/presentation/onboarding/program_selection/widgets/program_card_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/caregiver/pages/facility_selection_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('Program Selection Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    final StoreTester<AppState> storeTester =
        StoreTester<AppState>(initialState: AppState.initial());

    final MockCustomGraphQlClient mockCustomGraphQlClient =
        MockCustomGraphQlClient.withResponse(
      '',
      '',
      Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              'listUserPrograms': <String, dynamic>{
                'count': 1,
                'programs': <dynamic>[
                  <String, dynamic>{
                    'id': 'some-id',
                    'name': 'Mycarehub',
                    'active': true,
                    'organisation': <String, dynamic>{
                      'id': 'some-id',
                      'description': ''
                    }
                  }
                ]
              },
              'getClientFacilities': <String, dynamic>{
                'Facilities': <dynamic>[
                  <String, dynamic>{
                    'ID': 'some-id',
                    'name': 'Some Facility',
                    'phone': '+254712345678',
                    'active': true,
                    'county': 'Nairobi',
                    'description':
                        'Opens from Monday to Friday from 8:00 to 17:00',
                    'fhirOrganisationID': '',
                    'workStationDetails': <String, dynamic>{
                      'Notifications': 0,
                      'Surveys': 0,
                      'Articles': 0,
                      'Messages': 0,
                      'ServiceRequests': 0
                    }
                  },
                  <String, dynamic>{
                    'ID': 'some-id-2',
                    'name': 'Some Facility B',
                    'phone': '+254712345678',
                    'active': true,
                    'county': 'Nairobi',
                    'description':
                        'Opens from Monday to Friday from 8:00 to 17:00',
                    'fhirOrganisationID': '',
                    'workStationDetails': <String, dynamic>{
                      'Notifications': 0,
                      'Surveys': 0,
                      'Articles': 0,
                      'Messages': 0,
                      'ServiceRequests': 0
                    }
                  }
                ],
                'Pagination': <String, dynamic>{
                  'Limit': 20,
                  'CurrentPage': 1,
                  'Count': 2,
                  'TotalPages': 1,
                  'NextPage': null,
                  'PreviousPage': null
                }
              },
              'setClientProgram': <String, dynamic>{
                'clientProfile': <String, dynamic>{
                  'ID': 'some-id',
                  'User': <String, dynamic>{
                    'ID': 'some-id',
                    'Username': 'jr_jr',
                    'Name': 'JR jr JR',
                    'Gender': 'MALE',
                    'Active': true,
                    'Contacts': <String, dynamic>{
                      'id': '',
                      'contactType': '',
                      'contactValue': '',
                      'active': false,
                      'optedIn': false
                    }
                  },
                  'Active': true,
                  'ClientTypes': <dynamic>['PMTCT', 'OVC', 'OTZ'],
                  'TreatmentEnrollmentDate': '2000-02-20T00:00:00Z',
                  'FHIRPatientID': null,
                  'HealthRecordID': null,
                  'TreatmentBuddy': '',
                  'ClientCounselled': true,
                  'DefaultFacility': <String, dynamic>{
                    'ID': 'some-id',
                    'name': 'Kerugoya CRH',
                    'phone': '+254712345678',
                    'active': true,
                    'county': 'County',
                    'description':
                        'Opens from Monday to Friday from 8:00 to 17:00',
                    'fhirOrganisationID': ''
                  },
                  'CHVUserID': null,
                  'CHVUserName': '',
                  'CaregiverID': null,
                  'CCCNumber': ''
                },
                'roles': <dynamic>[],
                'permissions': <dynamic>[],
                'communityToken': 'token'
              }
            }
          },
        ),
        201,
      ),
    );

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        client: mockCustomGraphQlClient,
        widget: ProgramSelectionPage(graphQlClient: mockCustomGraphQlClient),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ProgramCardWidget), findsOneWidget);
    });

    testWidgets('renders loader correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(WaitAction<AppState>.add(setCurrentProgramFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockCustomGraphQlClient,
        widget: ProgramSelectionPage(graphQlClient: mockCustomGraphQlClient),
      );
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets(' navigates to facility selection page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockCustomGraphQlClient,
        widget: ProgramSelectionPage(graphQlClient: mockCustomGraphQlClient),
      );

      await tester.pumpAndSettle();

      final Finder primaryButton = find.byType(MyAfyaHubPrimaryButton).last;

      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockLoginResponse);

      final UserProfile? userProfile =
          phoneLoginResponse.userResponse?.userProfile;

      final User user = User(
        pinChangeRequired: userProfile?.pinChangeRequired,
        name: userProfile?.name,
        username: userProfile?.userName,
        hasSetPin: userProfile?.hasSetPin,
        isPhoneVerified: userProfile?.isPhoneVerified,
        hasSetSecurityQuestions: userProfile?.hasSetSecurityQuestions,
        pinUpdateRequired: userProfile?.pinUpdateRequired,
        termsAccepted: false,
        suspended: userProfile?.suspended,
        active: userProfile?.active,
      );

      store.dispatch(UpdateUserAction(user: user));

      await tester.ensureVisible(primaryButton);
      await tester.tap(primaryButton);
      await tester.pumpAndSettle();
      expect(find.byType(FacilitySelectionPage), findsOneWidget);
    });
  });
}
