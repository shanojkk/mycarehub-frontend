// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientProfile _$$_ClientProfileFromJson(Map<String, dynamic> json) =>
    _$_ClientProfile(
      id: json['ID'] as String?,
      active: json['Active'] as bool? ?? false,
      counselled: json['ClientCounselled'] as bool? ?? false,
      clientTypes: (json['ClientTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ClientTypeEnumMap, e))
          .toList(),
      facilityID: json['defaultFacilityID'] as String?,
      treatmentEnrollmentDate: json['TreatmentEnrollmentDate'] as String?,
      treatmentBuddy: json['TreatmentBuddy'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      chvUserID: json['ChvUserID'] as String?,
      chvUserName: json['ChvUserName'] as String?,
      cccNumber: json['CCCNumber'] as String?,
      fhirPatientID: json['FhirPatientID'] as String?,
      healthRecordID: json['HealthRecordID'] as String?,
      defaultFacility: json['DefaultFacility'] == null
          ? null
          : Facility.fromJson(json['DefaultFacility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientProfileToJson(_$_ClientProfile instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Active': instance.active,
      'ClientCounselled': instance.counselled,
      'ClientTypes':
          instance.clientTypes?.map((e) => _$ClientTypeEnumMap[e]!).toList(),
      'defaultFacilityID': instance.facilityID,
      'TreatmentEnrollmentDate': instance.treatmentEnrollmentDate,
      'TreatmentBuddy': instance.treatmentBuddy,
      'User': instance.user,
      'ChvUserID': instance.chvUserID,
      'ChvUserName': instance.chvUserName,
      'CCCNumber': instance.cccNumber,
      'FhirPatientID': instance.fhirPatientID,
      'HealthRecordID': instance.healthRecordID,
      'DefaultFacility': instance.defaultFacility,
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
