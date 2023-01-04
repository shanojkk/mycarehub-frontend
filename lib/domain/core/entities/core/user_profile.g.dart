// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      active: json['Active'] as bool? ?? false,
      termsAccepted: json['termsAccepted'] as bool? ?? false,
      hasSetPin: json['hasSetPin'] as bool? ?? false,
      hasSetSecurityQuestions:
          json['hasSetSecurityQuestions'] as bool? ?? false,
      hasSetNickname: json['hasSetNickname'] as bool? ?? false,
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
      pinChangeRequired: json['pinChangeRequired'] as bool? ?? false,
      pinUpdateRequired: json['pinUpdateRequired'] as bool? ?? false,
      suspended: json['suspended'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'Active': instance.active,
      'termsAccepted': instance.termsAccepted,
      'hasSetPin': instance.hasSetPin,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasSetNickname': instance.hasSetNickname,
      'isPhoneVerified': instance.isPhoneVerified,
      'pinChangeRequired': instance.pinChangeRequired,
      'pinUpdateRequired': instance.pinUpdateRequired,
      'suspended': instance.suspended,
    };
