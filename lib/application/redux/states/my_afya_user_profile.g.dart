// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_afya_user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyAfyaUserProfile _$_$_MyAfyaUserProfileFromJson(Map<String, dynamic> json) {
  return _$_MyAfyaUserProfile(
    id: json['id'] as String?,
    username: json['userName'] == null
        ? null
        : Name.fromJson(json['userName'] as String),
    primaryPhoneNumber: json['primaryPhone'] == null
        ? null
        : PhoneNumber.fromJson(json['primaryPhone'] as String),
    primaryEmailAddress: json['primaryEmailAddress'] == null
        ? null
        : EmailAddress.fromJson(json['primaryEmailAddress'] as String),
    termsAccepted: json['termsAccepted'] as bool?,
    userBioData: json['userBioData'] == null
        ? null
        : BioData.fromJson(json['userBioData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MyAfyaUserProfileToJson(
        _$_MyAfyaUserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.username,
      'primaryPhone': instance.primaryPhoneNumber,
      'primaryEmailAddress': instance.primaryEmailAddress,
      'termsAccepted': instance.termsAccepted,
      'userBioData': instance.userBioData,
    };
