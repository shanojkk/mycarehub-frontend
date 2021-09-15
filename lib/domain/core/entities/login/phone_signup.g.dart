// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneSignUp _$PhoneSignUpFromJson(Map<String, dynamic> json) {
  return PhoneSignUp(
    acceptCommunicationTerms: json['acceptCommunicationTerms'] as bool,
    phoneNumber: json['phoneNumber'] as String?,
    accountCreated: json['accountCreated'] as bool,
    accountExists: json['accountExists'] as bool,
    confirmPin: json['confirmPin'] as String?,
    createPin: json['createPin'] as String?,
    invalidCredentials: json['invalidCredentials'] as bool,
    otp: json['otp'] as String?,
  );
}

Map<String, dynamic> _$PhoneSignUpToJson(PhoneSignUp instance) =>
    <String, dynamic>{
      'acceptCommunicationTerms': instance.acceptCommunicationTerms,
      'accountCreated': instance.accountCreated,
      'accountExists': instance.accountExists,
      'confirmPin': instance.confirmPin,
      'createPin': instance.createPin,
      'invalidCredentials': instance.invalidCredentials,
      'otp': instance.otp,
      'phoneNumber': instance.phoneNumber,
    };
