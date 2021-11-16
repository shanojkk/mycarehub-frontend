// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientProfileState _$_$_ClientProfileStateFromJson(
    Map<String, dynamic> json) {
  return _$_ClientProfileState(
    myAfyaUserProfile: json['myAfyaUserProfile'] == null
        ? null
        : MyAfyaUserProfile.fromJson(
            json['myAfyaUserProfile'] as Map<String, dynamic>),
    communicationSettings: json['communicationSettings'] == null
        ? null
        : CommunicationSettings.fromJson(
            json['communicationSettings'] as Map<String, dynamic>),
    auth: json['auth'] == null
        ? null
        : AuthCredentialResponse.fromJson(json['auth'] as Map<String, dynamic>),
    isSignedIn: json['isSignedIn'] as bool?,
    inActivitySetInTime: json['inActivitySetInTime'] as String?,
    signedInTime: json['signedInTime'] as String?,
    isFirstLaunch: json['isFirstLaunch'] as bool?,
    securityQuestions: (json['securityQuestions'] as List<dynamic>?)
        ?.map((e) => SecurityQuestion.fromJson(e as Map<String, dynamic>))
        .toList(),
    securityQuestionsResponses:
        (json['securityQuestionsResponses'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, SecurityQuestionResponse.fromJson(e as Map<String, dynamic>)),
    ),
    active: json['active'] as bool?,
  );
}

Map<String, dynamic> _$_$_ClientProfileStateToJson(
        _$_ClientProfileState instance) =>
    <String, dynamic>{
      'myAfyaUserProfile': instance.myAfyaUserProfile,
      'communicationSettings': instance.communicationSettings,
      'auth': instance.auth,
      'isSignedIn': instance.isSignedIn,
      'inActivitySetInTime': instance.inActivitySetInTime,
      'signedInTime': instance.signedInTime,
      'isFirstLaunch': instance.isFirstLaunch,
      'securityQuestions': instance.securityQuestions,
      'securityQuestionsResponses': instance.securityQuestionsResponses,
      'active': instance.active,
    };
