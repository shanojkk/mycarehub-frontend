// Package imports:
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/redux/states/my_afya_user_profile.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

part 'client_profile_state.freezed.dart';
part 'client_profile_state.g.dart';

@freezed
class ClientProfileState with _$ClientProfileState {
  factory ClientProfileState({
    MyAfyaUserProfile? myAfyaUserProfile,
    CommunicationSettings? communicationSettings,
    AuthCredentialResponse? auth,
    bool? isSignedIn,
    String? inActivitySetInTime,
    String? signedInTime,
    bool? isFirstLaunch,
    List<SecurityQuestion>? securityQuestions,
    Map<String, SecurityQuestionResponse>? securityQuestionsResponses,
    bool? active,
  }) = _ClientProfileState;

  factory ClientProfileState.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileStateFromJson(json);

  factory ClientProfileState.initial() => ClientProfileState(
        isSignedIn: false,
        inActivitySetInTime: UNKNOWN,
        signedInTime: UNKNOWN,
        myAfyaUserProfile: MyAfyaUserProfile(
          id: UNKNOWN,
          username: Name.withValue(UNKNOWN),
          primaryPhoneNumber: PhoneNumber.withValue(UNKNOWN),
          primaryEmailAddress: EmailAddress.withValue(UNKNOWNEMAIL),
          termsAccepted: false,
          userBioData: BioData(
            firstName: Name.withValue(UNKNOWN),
            lastName: Name.withValue(UNKNOWN),
            dateOfBirth: UNKNOWN,
            gender: Gender.unknown,
          ),
        ),
        auth: AuthCredentialResponse(
          customToken: UNKNOWN,
          idToken: UNKNOWN,
          expiresIn: UNKNOWN,
          refreshToken: UNKNOWN,
          uid: UNKNOWN,
          isAdmin: false,
          isAnonymous: true,
          canExperiment: false,
        ),
        communicationSettings: CommunicationSettings(
          profileID: UNKNOWN,
          allowEmail: false,
          allowPush: false,
          allowText: false,
          allowWhatsApp: false,
        ),
        isFirstLaunch: true,
        securityQuestions: <SecurityQuestion>[],
        securityQuestionsResponses: <String, SecurityQuestionResponse>{},
      );
}
