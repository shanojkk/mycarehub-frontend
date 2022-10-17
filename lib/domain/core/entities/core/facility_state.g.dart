// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityState _$$_FacilityStateFromJson(Map<String, dynamic> json) =>
    _$_FacilityState(
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentFacility: json['currentFacility'] == null
          ? null
          : Facility.fromJson(json['currentFacility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FacilityStateToJson(_$_FacilityState instance) =>
    <String, dynamic>{
      'facilities': instance.facilities,
      'currentFacility': instance.currentFacility,
    };
