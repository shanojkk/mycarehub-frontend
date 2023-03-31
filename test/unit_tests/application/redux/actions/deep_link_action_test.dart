// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/deep_link_action.dart';
import 'package:pro_health_360/application/redux/actions/update_credentials_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/core/user_profile.dart';
import 'package:pro_health_360/domain/core/entities/login/phone_login_response.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

import '../../../../mock_data.dart';

void main() {
  group('DeepLinkAction', () {
    test('should navigate to terms page if the user has not accepted terms',
        () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

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

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

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

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetNickName: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, AppRoutes.termsAndConditions);
    });

    test('should navigate to phone login if user is null', () async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(clientState: null),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, AppRoutes.phoneLogin);
    });

    test('should navigate to phone login if expiresAt is unknown', () async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(credentials: null),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, AppRoutes.phoneLogin);
    });

    test('should navigate to phone login if token has expired', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

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
        termsAccepted: userProfile?.termsAccepted,
        suspended: userProfile?.suspended,
        active: userProfile?.active,
      );

      store.dispatch(UpdateUserAction(user: user));

      final String tokenExpiryDate =
          DateTime.now().add(const Duration(minutes: 1)).toString();

      store.dispatch(
        UpdateCredentialsAction(
          expiresIn: '3600',
          tokenExpiryTimestamp: tokenExpiryDate,
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, AppRoutes.phoneLogin);
    });
  });
}
