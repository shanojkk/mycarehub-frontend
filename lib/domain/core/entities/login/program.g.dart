// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Program _$$_ProgramFromJson(Map<String, dynamic> json) => _$_Program(
      id: json['id'] as String?,
      active: json['active'] as bool?,
      name: json['name'] as String?,
      organization: json['organisation'] == null
          ? null
          : Organization.fromJson(json['organisation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProgramToJson(_$_Program instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'name': instance.name,
      'organisation': instance.organization,
    };
