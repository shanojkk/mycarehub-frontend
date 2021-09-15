// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneLogin _$PhoneLoginFromJson(Map<String, dynamic> json) {
  return PhoneLogin(
    invalidCredentials: json['invalidCredentials'] as bool,
    phoneNumber: json['phoneNumber'] as String,
    pinCode: json['pinCode'] as String,
  );
}

Map<String, dynamic> _$PhoneLoginToJson(PhoneLogin instance) =>
    <String, dynamic>{
      'invalidCredentials': instance.invalidCredentials,
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
    };
