// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPin _$UserPinFromJson(Map<String, dynamic> json) {
  return UserPin(
    forgotPIN: json['forgotPIN'] as bool,
    invalidPin: json['invalidPin'] as bool,
    isChangingPin: json['isChangingPin'] as bool,
    pin: json['pin'] as String?,
    recoveryOtp: json['recoveryOtp'] as String?,
  );
}

Map<String, dynamic> _$UserPinToJson(UserPin instance) => <String, dynamic>{
      'forgotPIN': instance.forgotPIN,
      'invalidPin': instance.invalidPin,
      'isChangingPin': instance.isChangingPin,
      'pin': instance.pin,
      'recoveryOtp': instance.recoveryOtp,
    };
