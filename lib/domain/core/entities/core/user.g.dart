// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['userID'] as String?,
    displayName: json['displayName'] as String?,
    username: json['userName'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'userID': instance.userId,
      'displayName': instance.displayName,
      'userName': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };