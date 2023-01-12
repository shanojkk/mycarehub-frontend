// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$$_UserResponseFromJson(Map<String, dynamic> json) =>
    _$_UserResponse(
      credentials: json['credentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>),
      userProfile: json['userProfile'] == null
          ? null
          : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      caregiverState: json['caregiverProfile'] == null
          ? null
          : CaregiverState.fromJson(
              json['caregiverProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'userProfile': instance.userProfile,
      'caregiverProfile': instance.caregiverState,
    };
