// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caregiver_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CaregiverState _$$_CaregiverStateFromJson(Map<String, dynamic> json) =>
    _$_CaregiverState(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      caregiverNumber: json['caregiver_number'] as String?,
    );

Map<String, dynamic> _$$_CaregiverStateToJson(_$_CaregiverState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'caregiver_number': instance.caregiverNumber,
    };
