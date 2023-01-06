// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/login/verify_security_questions_state.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    TermsAndConditions? termsAndConditions,
    List<SecurityQuestion>? securityQuestions,
    List<SecurityQuestionResponse>? securityQuestionResponses,
    VerifySecurityQuestionsState? verifySecurityQuestionsState,

    ///------------WORKFLOW RELATED BOOLEANS------------
    /// Have standardized shared values that will be used across all states
    /// regardless of the workflow
    // The current stage of onboarding that the user is in
    CurrentOnboardingStage? currentOnboardingStage,

    // If the user has verified their phone number
    bool? isPhoneVerified,

    // If the user has set their security questions
    bool? hasSetSecurityQuestions,

    // If the user has successfully verified their security questions if pin is expired
    bool? hasVerifiedSecurityQuestions,

    // If the user has set their nickname
    bool? hasSetNickName,

    // Whether the user's PIN has been set
    bool? hasSetPin,

    // Whether the user has accepted terms and conditions
    bool? hasAcceptedTerms,

    ///------------WORKFLOW RELATED VALUES------------
    // The currently active user's phone number
    String? phoneNumber,

    // The PIN
    String? pin,

    // The confirm PIN
    String? confirmPIN,

    // The OTP used when confirming the phone number
    String? otp,

    ///------------LOGIN RELATED VALUES------------
    // The number of failed login attempts that this user has
    int? failedLoginCount,

    // Whether the credentials this user entered are invalid
    bool? invalidCredentials,

    ///------------VERIFY PHONE RELATED VALUES------------
    // If the OTP entered is invalid
    bool? invalidOTP,

    // Whether there was a failure while sending an OTP
    bool? failedToSendOTP,

    //  Whether the user is allowed to resend their PIN
    bool? canResendOTP,
    String? nickName,

    ///------------ONBOARDING STATE BOOLEANS------------
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        termsAndConditions: TermsAndConditions.initial(),
        securityQuestions: <SecurityQuestion>[],
        securityQuestionResponses: <SecurityQuestionResponse>[],
        verifySecurityQuestionsState: VerifySecurityQuestionsState.initial(),
        isPhoneVerified: false,
        hasSetSecurityQuestions: false,
        hasSetNickName: false,
        hasVerifiedSecurityQuestions: false,
        currentOnboardingStage: CurrentOnboardingStage.Login,
        phoneNumber: UNKNOWN,
        invalidOTP: false,
        otp: UNKNOWN,
        failedLoginCount: 0,
        failedToSendOTP: false,
        canResendOTP: false,
        pin: UNKNOWN,
        confirmPIN: UNKNOWN,
        invalidCredentials: false,
        hasSetPin: false,
        hasAcceptedTerms: false,
        nickName: UNKNOWN,
      );
}
