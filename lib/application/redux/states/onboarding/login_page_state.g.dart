// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginPageState _$_$_LoginPageStateFromJson(Map<String, dynamic> json) {
  return _$_LoginPageState(
    phoneNumber: json['phoneNumber'] as String?,
    pinCode: json['pinCode'] as String?,
    invalidCredentials: json['invalidCredentials'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_LoginPageStateToJson(_$_LoginPageState instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
      'invalidCredentials': instance.invalidCredentials,
    };
