// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authority_permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorityPermission _$$_AuthorityPermissionFromJson(
        Map<String, dynamic> json) =>
    _$_AuthorityPermission(
      id: json['permissionID'] as String?,
      active: json['Active'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AuthorityPermissionToJson(
        _$_AuthorityPermission instance) =>
    <String, dynamic>{
      'permissionID': instance.id,
      'Active': instance.active,
    };
