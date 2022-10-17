// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLoginResponse _$$_PhoneLoginResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PhoneLoginResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      isCaregiver: json['is_caregiver'] as bool? ?? false,
      isClient: json['is_client'] as bool? ?? false,
      userResponse: json['response'] == null
          ? null
          : UserResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PhoneLoginResponseToJson(
        _$_PhoneLoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'is_caregiver': instance.isCaregiver,
      'is_client': instance.isClient,
      'response': instance.userResponse,
    };
