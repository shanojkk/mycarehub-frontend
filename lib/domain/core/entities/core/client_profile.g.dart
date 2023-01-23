// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientProfile _$$_ClientProfileFromJson(Map<String, dynamic> json) =>
    _$_ClientProfile(
      id: json['id'] as String?,
      active: json['active'] as bool? ?? false,
      counselled: json['clientCounselled'] as bool? ?? false,
      clientTypes: (json['clientTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ClientTypeEnumMap, e))
          .toList(),
      facilityID: json['defaultFacilityID'] as String?,
      treatmentEnrollmentDate: json['treatmentEnrollmentDate'] as String?,
      treatmentBuddy: json['treatmentBuddy'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      chvUserID: json['chvUserID'] as String?,
      chvUserName: json['chvUserName'] as String?,
      cccNumber: json['cccNumber'] as String?,
      fhirPatientID: json['fhirPatientID'] as String?,
      healthRecordID: json['healthRecordID'] as String?,
      caregiverID: json['caregiverID'] as String?,
      defaultFacility: json['defaultFacility'] == null
          ? null
          : Facility.fromJson(json['defaultFacility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientProfileToJson(_$_ClientProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'clientCounselled': instance.counselled,
      'clientTypes':
          instance.clientTypes?.map((e) => _$ClientTypeEnumMap[e]!).toList(),
      'defaultFacilityID': instance.facilityID,
      'treatmentEnrollmentDate': instance.treatmentEnrollmentDate,
      'treatmentBuddy': instance.treatmentBuddy,
      'user': instance.user,
      'chvUserID': instance.chvUserID,
      'chvUserName': instance.chvUserName,
      'cccNumber': instance.cccNumber,
      'fhirPatientID': instance.fhirPatientID,
      'healthRecordID': instance.healthRecordID,
      'caregiverID': instance.caregiverID,
      'defaultFacility': instance.defaultFacility,
    };

const _$ClientTypeEnumMap = {
  ClientType.PMTCT: 'PMTCT',
  ClientType.OVC: 'OVC',
  ClientType.OTZ: 'OTZ',
  ClientType.OTZ_PLUS: 'OTZ_PLUS',
  ClientType.HVL: 'HVL',
  ClientType.DREAMS: 'DREAMS',
  ClientType.HIGH_RISK: 'HIGH_RISK',
  ClientType.SPOUSES: 'SPOUSES',
  ClientType.YOUTH: 'YOUTH',
  ClientType.KenyaEMR: 'KenyaEMR',
  ClientType.UNKNOWN: 'UNKNOWN',
};
