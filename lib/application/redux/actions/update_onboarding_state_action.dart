// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/onboarding_state.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.securityQuestions,
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.otp,
    this.invalidOTP,
    this.failedToSendOTP,
    this.canResendOTP,
    this.hasSetNickName,
    this.hasSetSecurityQuestions,
    this.hasSetPin,
    this.hasVerifiedSecurityQuestions,
    this.currentOnboardingStage,
    this.phoneNumber,
    this.invalidCredentials,
    this.pin,
    this.confirmPIN,
    this.failedLoginCount,
    this.hasAcceptedTerms,
    this.nickName,
    this.isCaregiver,
    this.isClient,
  });

  List<SecurityQuestion>? securityQuestions;
  List<SecurityQuestionResponse>? securityQuestionsResponses;

  ///------------WORKFLOW RELATED BOOLEANS------------
  final CurrentOnboardingStage? currentOnboardingStage;
  bool? isPhoneVerified;
  bool? hasSetSecurityQuestions;
  bool? hasVerifiedSecurityQuestions;
  bool? hasSetNickName;
  bool? hasAcceptedTerms;

  ///------------WORKFLOW RELATED VALUES------------
  final String? phoneNumber;
  final String? pin;
  final String? confirmPIN;
  final String? otp;
  final String? nickName;

  ///------------VERIFY PIN RELATED VALUES------------
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  bool? hasSetPin;

  ///------------LOGIN RELATED VALUES------------
  final int? failedLoginCount;
  final bool? invalidCredentials;
  final bool? isClient;
  final bool? isCaregiver;

  @override
  AppState reduce() {
    final OnboardingState? onboardingStateFromState = state.onboardingState;

    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      securityQuestions:
          securityQuestions ?? onboardingStateFromState?.securityQuestions,
      securityQuestionResponses: securityQuestionsResponses ??
          onboardingStateFromState?.securityQuestionResponses,
      isPhoneVerified:
          isPhoneVerified ?? onboardingStateFromState?.isPhoneVerified,
      hasSetNickName:
          hasSetNickName ?? onboardingStateFromState?.hasSetNickName,
      hasSetSecurityQuestions: hasSetSecurityQuestions ??
          onboardingStateFromState?.hasSetSecurityQuestions,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions ??
          onboardingStateFromState?.hasVerifiedSecurityQuestions,
      currentOnboardingStage: currentOnboardingStage ??
          onboardingStateFromState?.currentOnboardingStage,
      hasSetPin: hasSetPin ?? onboardingStateFromState?.hasSetPin,
      pin: pin ?? onboardingStateFromState?.pin,
      confirmPIN: confirmPIN ?? onboardingStateFromState?.confirmPIN,
      otp: otp ?? onboardingStateFromState?.otp,
      failedLoginCount:
          failedLoginCount ?? onboardingStateFromState?.failedLoginCount,
      invalidCredentials:
          invalidCredentials ?? onboardingStateFromState?.invalidCredentials,
      invalidOTP: invalidOTP ?? onboardingStateFromState?.invalidOTP,
      failedToSendOTP:
          failedToSendOTP ?? onboardingStateFromState?.failedToSendOTP,
      canResendOTP: canResendOTP ?? onboardingStateFromState?.canResendOTP,
      phoneNumber: phoneNumber ?? onboardingStateFromState?.phoneNumber,
      hasAcceptedTerms:
          hasAcceptedTerms ?? onboardingStateFromState?.hasAcceptedTerms,
      nickName: nickName ?? onboardingStateFromState?.nickName,
      isCaregiver: isCaregiver ?? onboardingStateFromState?.isCaregiver,
      isClient: isClient ?? onboardingStateFromState?.isClient,
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
