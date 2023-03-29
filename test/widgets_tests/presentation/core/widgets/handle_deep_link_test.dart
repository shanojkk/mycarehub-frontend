// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:pro_health_360/application/redux/actions/update_program_state_action.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/core/user_profile.dart';
import 'package:pro_health_360/domain/core/entities/login/organization.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';
import 'package:pro_health_360/presentation/home/pages/home_page.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_credentials_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/login/phone_login_response.dart';
import 'package:pro_health_360/presentation/core/widgets/handle_deep_link.dart';

import '../../../../mock_data.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('HandleDeepLink', () {
    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });
    testWidgets('should dispatch DeepLinkAction', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(800, 1200);
      tester.binding.window.devicePixelRatioTestValue = 1;

      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockLoginResponse);

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getContent': <String, dynamic>{
                'items': <dynamic>[mockContent, mockContent]
              },
              'listUserPrograms': <String, dynamic>{
                'count': 1,
                'programs': <dynamic>[
                  <String, dynamic>{
                    'id': 'bbe653e3-4159-44a0-8f75-ff1af971521f',
                    'name': 'Mycarehub',
                    'active': true,
                    'organisation': <String, dynamic>{
                      'id': '4181df12-ca96-4f28-b78b-8e8ad88b25df',
                      'description': ''
                    }
                  }
                ]
              },
              'getUserLinkedFacilities': <String, dynamic>{
                'Facilities': <dynamic>[
                  <String, dynamic>{
                    'ID': 'some-id',
                    'name': 'hospital name',
                    'code': 1,
                    'phone': '',
                    'active': true,
                    'county': 'some-county',
                    'description': '',
                    'fhirOrganisationID': '',
                    'workStationDetails': <String, dynamic>{
                      'notifications': 1,
                      'surveys': 1,
                      'articles': 1,
                      'messages': 1
                    }
                  },
                ]
              }
            }
          }),
          201,
        ),
      );

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

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
        termsAccepted: userProfile?.termsAccepted,
        suspended: userProfile?.suspended,
        active: userProfile?.active,
      );
      store.dispatch(UpdateUserAction(user: user));

      final DateTime now = DateTime.now();
      final int expiryTime = int.tryParse(
            phoneLoginResponse.userResponse?.credentials?.expiresIn ?? '3600',
          ) ??
          3600;
      final DateTime mockExpiry = now.add(Duration(seconds: expiryTime));

      store.dispatch(
        UpdateCredentialsAction(
          expiresIn: phoneLoginResponse.userResponse?.credentials?.expiresIn,
          tokenExpiryTimestamp: mockExpiry.toIso8601String(),
          isSignedIn: true,
        ),
      );

      store.dispatch(UpdateUserProfileAction(termsAccepted: true));

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          hasSetNickName: true,
        ),
      );

      store.dispatch(
        UpdateProgramStateAction(
          currentProgram: Program(
            active: true,
            id: 'some-id',
            name: 'name',
            organization:
                Organization(description: 'desc', id: 'id', name: 'some-name'),
          ),
        ),
      );

      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const HandleDeepLink(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
