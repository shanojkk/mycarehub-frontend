import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/phone_login_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/onboarding_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart';
import 'package:pro_health_360/presentation/onboarding/forgot_pin/pages/pending_pin_request_page.dart';
import 'package:pro_health_360/presentation/onboarding/login/widgets/login_counter_page.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

import '../../../../mocks.dart';
import 'phone_login_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('PhoneLoginAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          onboardingState: OnboardingState.initial().copyWith.call(
                userName: 'username',
                pin: '0000',
              ),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    final Map<String, dynamic> pinChangeRequiredMock = <String, dynamic>{
      'code': 0,
      'message': 'success',
      'response': <String, dynamic>{
        'credentials': <String, dynamic>{
          'expiresIn': '3600',
          'idToken': 'some id token',
          'refreshToken': 'some-refresh-token'
        },
        'userProfile': <String, dynamic>{
          'id': 'some-id',
          'name': 'John Doe',
          'username': 'j_doe',
          'active': true,
          'pinChangeRequired': true,
          'hasSetPin': false,
          'hasSetSecurityQuestions': false,
          'isPhoneVerified': false,
          'termsAccepted': false,
          'suspended': false,
          'pinUpdateRequired': false,
          'hasSetNickname': false
        },
        'getStreamToken': 'some-test-token',
      }
    };

    test('show handle error if pin is too short', () async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          onboardingState:
              OnboardingState(phoneNumber: '+254798000000', pin: 'UNKNOWN'),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      String failureReason = '';

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockGraphQlClient(),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (String reason) => failureReason = reason,
        ),
      );

      await storeTester.waitUntil(PhoneLoginAction);

      expect(failureReason, fourDigitPin);
    });

    test('show handle api error', () async {
      String failureReason = '';

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 10}),
              400,
            ),
          ),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (String reason) => failureReason = reason,
        ),
      );

      await storeTester.waitUntil(PhoneLoginAction);

      expect(
        failureReason,
        'Sorry, we could not find a user with those details. Please confirm that '
        'the credentials you provided are correct',
      );
    });

    test('show handle wrong credentials', () async {
      String failureReason = '';

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 8}),
              400,
            ),
          ),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (String reason) => failureReason = reason,
        ),
      );

      await storeTester.waitUntil(PhoneLoginAction);

      expect(failureReason, 'Your phone number or PIN do not match.');
    });

    test('should update state correctly if response is ok', () async {
      await storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockGraphQlClient(),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(PhoneLoginAction);

      expect(info.state.clientState?.clientProfile?.user?.name, 'John Doe');
    });

    test('navigates to next page successfully', () async {
      storeTester.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockGraphQlClient(),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.verifySignUpOTP);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<VerifyPhonePage>(
            builder: (BuildContext context) => const VerifyPhonePage(),
          ),
        ),
        false,
      );
    });

    test('should handle uncaught exception', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.callRESTAPI(
          endpoint: kTestLoginByPhoneEndpoint,
          method: httpPOST,
          variables: anyNamed('variables'),
        ),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: client,
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntilErrorGetLast(
        error: MyAfyaException,
      );

      expect(info.error, isInstanceOf<MyAfyaException>());
    });

    test('should change to new user workflow when pin change is required',
        () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(pinChangeRequiredMock),
              200,
            ),
          ),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      storeTester.dispatch(UpdateUserProfileAction(pinChangeRequired: true));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.verifySignUpOTP);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<VerifyPhonePage>(
            builder: (BuildContext context) => const VerifyPhonePage(),
          ),
        ),
        false,
      );
    });

    test('should change to new user workflow when pin update is required',
        () async {
      // ignore: avoid_dynamic_calls
      pinChangeRequiredMock['response']['userProfile']['pinUpdateRequired'] =
          true;
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(pinChangeRequiredMock),
              200,
            ),
          ),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.verifySignUpOTP);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<VerifyPhonePage>(
            builder: (BuildContext context) => const VerifyPhonePage(),
          ),
        ),
        false,
      );
    });

    test('navigate to pin reset requests page', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 72}),
              400,
            ),
          ),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.pendingPINRequestPage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<PendingPINRequestPage>(
            builder: (BuildContext context) => const PendingPINRequestPage(),
          ),
        ),
        false,
      );
    });

    test('navigate to pin login counter page', () async {
      storeTester.dispatch(
        PhoneLoginAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(<String, dynamic>{'code': 73, 'retryTime': 10.0}),
              400,
            ),
          ),
          endpoint: kTestLoginByPhoneEndpoint,
          errorCallback: (_) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamedAndRemoveUntil? navDetails =
          actionDispatched?.details
              as NavigatorDetails_PushNamedAndRemoveUntil?;

      expect(navDetails?.newRouteName, AppRoutes.loginCounterPage);
      expect(
        navDetails?.predicate.call(
          MaterialPageRoute<LoginCounterPage>(
            builder: (BuildContext context) => const LoginCounterPage(
              retryTime: 10,
            ),
          ),
        ),
        false,
      );
    });
  });
}
