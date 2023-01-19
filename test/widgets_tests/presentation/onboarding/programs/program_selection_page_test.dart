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
                    'id': 'some-id',
                    'name': 'Some Facility',
                    'phone': '+254712345678',
                    'active': true,
                    'county': 'Nairobi',
                    'description':
                        'Opens from Monday to Friday from 8:00 to 17:00',
                    'fhirOrganisationID': '',
                    'workStationDetails': <String, dynamic>{
                      'notifications': 0,
                      'surveys': 0,
                      'articles': 0,
                      'messages': 0,
                      'serviceRequests': 0
                    }
                  },
                  <String, dynamic>{
                    'id': 'some-id-2',
                    'name': 'Some Facility B',
                    'phone': '+254712345678',
                    'active': true,
                    'county': 'Nairobi',
                    'description':
                        'Opens from Monday to Friday from 8:00 to 17:00',
                    'fhirOrganisationID': '',
                    'workStationDetails': <String, dynamic>{
                      'notifications': 0,
                      'surveys': 0,
                      'articles': 0,
                      'messages': 0,
                      'serviceRequests': 0
                    }
                  }
                ],
                'Pagination': <String, dynamic>{
                  'limit': 20,
                  'currentPage': 1,
                  'count': 2,
                  'totalPages': 1,
                  'nextPage': null,
                  'previousPage': null
                }
              },
              'setClientProgram': <String, dynamic>{
                'clientProfile': <String, dynamic>{
                  'id': 'some-id',
                  'user': <String, dynamic>{
                    'id': 'some-id',
                    'username': 'jr_jr',
                    'name': 'JR jr JR',
                    'gender': 'MALE',
                    'active': true,
                    'contacts': <String, dynamic>{
                      'id': '',
                      'contactType': '',
                      'contactValue': '',
                      'active': false,
                      'optedIn': false
                    }
                  },
                  'active': true,
                  'clientTypes': <dynamic>['PMTCT', 'OVC', 'OTZ'],
                  'treatmentEnrollmentDate': '2000-02-20T00:00:00Z',
                  'fhirPatientID': null,
                  'healthRecordID': null,
                  'treatmentBuddy': '',
                  'clientCounselled': true,
                  'defaultFacility': <String, dynamic>{
                    'id': 'some-id',
                    'name': 'Kerugoya CRH',
                    'phone': '+254712345678',
                    'active': true,
                    'county': 'County',
                    'description':
                        'Opens from Monday to Friday from 8:00 to 17:00',
                    'fhirOrganisationID': ''
                  },
                  'chvUserID': null,
                  'chvUserName': '',
                  'caregiverID': null,
                  'cccNumber': ''
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
