// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/my_afya_user_profile.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

/// - [MyAfyaUserProfile]
/// - [profileSetupComplete]
/// - [unmaskedPhoneNumbers]
/// - [maskedPhoneNumber]

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.profile,
    this.communicationSettings,
    this.userBioData,
    //customer profile for transactions
    this.customerProfile,
    // other internal states
    this.onboardingTourComplete,
    this.profileSetupComplete,
    this.unmaskedPhoneNumbers,
    this.maskedPhoneNumbers,
    this.isFirstLaunch,
    this.securityQuestions,
    this.securityQuestionsResponses,
  });

  final MyAfyaUserProfile? profile;
  final CommunicationSettings? communicationSettings;
  final BioData? userBioData;
  final Customer? customerProfile;
  final bool? onboardingTourComplete;
  final bool? profileSetupComplete;
  final List<PhoneNumber>? maskedPhoneNumbers;
  final List<PhoneNumber>? unmaskedPhoneNumbers;
  final bool? isFirstLaunch;
  final List<SecurityQuestion>? securityQuestions;
  final Map<String, SecurityQuestionResponse>? securityQuestionsResponses;

  @override
  AppState reduce() {
    final MyAfyaUserProfile myAfyaUserProfile =
        state.clientProfileState!.myAfyaUserProfile!;

    final BioData? bio =
        state.clientProfileState!.myAfyaUserProfile!.userBioData;

    final CommunicationSettings settings =
        state.clientProfileState!.communicationSettings!;

    final List<SecurityQuestion>? securityQuestions =
        state.clientProfileState?.securityQuestions;

    final Map<String, SecurityQuestionResponse>? questionsResponses =
        state.clientProfileState?.securityQuestionsResponses;

    final AppState newState = state.copyWith.clientProfileState!.call(
      myAfyaUserProfile: MyAfyaUserProfile(
        id: this.profile?.id ?? myAfyaUserProfile.id,
        username: this.profile?.username ?? myAfyaUserProfile.username,
        primaryPhoneNumber: this.profile?.primaryPhoneNumber ??
            myAfyaUserProfile.primaryPhoneNumber,
        primaryEmailAddress: this.profile?.primaryEmailAddress ??
            myAfyaUserProfile.primaryEmailAddress,
        termsAccepted:
            this.profile?.termsAccepted ?? myAfyaUserProfile.termsAccepted,
        userBioData: BioData(
          firstName: this.userBioData?.firstName ?? bio?.firstName,
          lastName: this.userBioData?.lastName ?? bio?.lastName,
          dateOfBirth: this.userBioData?.dateOfBirth ?? bio?.dateOfBirth,
          gender: this.userBioData?.gender ?? bio?.gender,
        ),
      ),
      communicationSettings: CommunicationSettings(
        allowEmail:
            this.communicationSettings?.allowEmail ?? settings.allowEmail,
        allowPush: this.communicationSettings?.allowPush ?? settings.allowPush,
        allowText: this.communicationSettings?.allowText ?? settings.allowText,
        allowWhatsApp:
            this.communicationSettings?.allowWhatsApp ?? settings.allowWhatsApp,
      ),
      isFirstLaunch: this.isFirstLaunch,
      securityQuestions: this.securityQuestions ?? securityQuestions,
      securityQuestionsResponses:
          this.securityQuestionsResponses ?? questionsResponses,
    );

    return newState;
  }
}
