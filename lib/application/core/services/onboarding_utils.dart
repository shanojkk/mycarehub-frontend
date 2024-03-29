// Package imports:
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/src/constants.dart';

void clearAllFlags(BuildContext context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    StoreProvider.dispatch(context, WaitAction<AppState>.clear());
  });
}

// NavigationPathConfig
OnboardingPathInfo onboardingPath({required AppState? appState}) {
  /// Check whether the current onboarding stage
  final CurrentOnboardingStage? currentOnboardingStage =
      appState!.onboardingState!.currentOnboardingStage;

  final bool isPhoneVerified =
      appState.onboardingState?.isPhoneVerified ?? false;
  final bool termsAccepted =
      appState.clientState?.clientProfile?.user?.termsAccepted ?? false;
  final bool hasSetSecurityQuestions =
      appState.onboardingState?.hasSetSecurityQuestions ?? false;
  final bool hasVerifiedSecurityQuestions =
      appState.onboardingState?.hasVerifiedSecurityQuestions ?? false;

  final bool hasSetPIN = appState.onboardingState?.hasSetPin ?? false;
  final bool isClient = appState.onboardingState?.isClient ?? false;
  final bool isCaregiver = appState.onboardingState?.isCaregiver ?? false;

  final String programId =
      appState.onboardingState?.programState?.currentProgram?.id ?? UNKNOWN;

  /// The sign in onboarding state
  if (currentOnboardingStage == CurrentOnboardingStage.Login) {
    final bool isSignedIn = appState.credentials?.isSignedIn ?? false;

    if (!isSignedIn) {
      return OnboardingPathInfo(
        previousRoute: '',
        nextRoute: AppRoutes.phoneLogin,
      );
    }

    /// The sign up onboarding state
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.phoneLogin,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    } else if (!termsAccepted) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.termsAndConditions,
      );
    } else if (!hasSetSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    } else if (!hasSetPIN) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.securityQuestionsPage,
        nextRoute: AppRoutes.createPin,
      );
    } else if (isCaregiver && isClient) {
      return OnboardingPathInfo(
        nextRoute: AppRoutes.clientCaregiverSelectionPageRoute,
        previousRoute: '',
      );
    } else if (isCaregiver) {
      return OnboardingPathInfo(
        nextRoute: AppRoutes.clientSelectionPageRoute,
        previousRoute: '',
      );
    }

    return OnboardingPathInfo(
      nextRoute: programId == UNKNOWN
          ? AppRoutes.programSelectionPageRoute
          : AppRoutes.home,
      previousRoute: '',
    );

    /// The PIN expiry workflow
  } else if (currentOnboardingStage == CurrentOnboardingStage.PINExpired ||
      currentOnboardingStage == CurrentOnboardingStage.PINUpdate) {
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.pinExpiredPage,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    }

    // check whether the PIN has been changed
    else if (!hasSetPIN) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.createPin,
      );
    }

    if (currentOnboardingStage == CurrentOnboardingStage.PINUpdate &&
        !hasSetSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    }

    // Reset the state and navigate to the login page
    return OnboardingPathInfo(
      nextRoute: AppRoutes.phoneLogin,
      previousRoute: '',
    );

    // This means it is the [CurrentOnboardingStage.ResetPIN] that is in play
  } else {
    // verify the phone
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.pinExpiredPage,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    }

    // (optional) set new security questions
    if (!hasVerifiedSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    }

    // change the PIN
    // check whether the PIN has been changed
    else if (!hasSetPIN) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.createPin,
      );
    }

    // Navigate user to the login page is they have successfully changed their PIN
    return OnboardingPathInfo(
      nextRoute: AppRoutes.phoneLogin,
      previousRoute: '',
    );
  }
}
