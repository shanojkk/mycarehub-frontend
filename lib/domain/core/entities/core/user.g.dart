// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      userId: json['id'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      active: json['active'] as bool? ?? false,
      primaryContact: json['primaryContact'] == null
          ? null
          : Contact.fromJson(json['primaryContact'] as Map<String, dynamic>),
      secondaryContacts: (json['secondaryContacts'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      termsAccepted: json['termsAccepted'] as bool? ?? false,
      hasSetPin: json['hasSetPin'] as bool? ?? false,
      hasSetSecurityQuestions:
          json['hasSetSecurityQuestions'] as bool? ?? false,
      hasSetNickname: json['hasSetNickname'] as bool? ?? false,
      isPhoneVerified: json['IsPhoneVerified'] as bool? ?? false,
      currentOrganizationID: json['currentOrganizationID'] as String?,
      currentProgramID: json['currentProgramID'] as String?,
      pinChangeRequired: json['pinChangeRequired'] as bool? ?? false,
      pinUpdateRequired: json['pinUpdateRequired'] as bool? ?? false,
      suspended: json['suspended'] as bool? ?? false,
      streamToken: json['streamToken'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.userId,
      'username': instance.username,
      'avatar': instance.avatar,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': genderToJson(instance.gender),
      'active': instance.active,
      'primaryContact': instance.primaryContact,
      'secondaryContacts': instance.secondaryContacts,
      'languages': instance.languages,
      'termsAccepted': instance.termsAccepted,
      'hasSetPin': instance.hasSetPin,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasSetNickname': instance.hasSetNickname,
      'IsPhoneVerified': instance.isPhoneVerified,
      'currentOrganizationID': instance.currentOrganizationID,
      'currentProgramID': instance.currentProgramID,
      'pinChangeRequired': instance.pinChangeRequired,
      'pinUpdateRequired': instance.pinUpdateRequired,
      'suspended': instance.suspended,
      'streamToken': instance.streamToken,
    };
