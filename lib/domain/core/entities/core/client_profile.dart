// Package imports:

import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
class ClientProfile with _$ClientProfile {
  factory ClientProfile({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Active', defaultValue: false) bool? active,
    @JsonKey(name: 'ClientCounselled', defaultValue: false) bool? counselled,
    @JsonKey(name: 'ClientTypes') List<ClientType>? clientTypes,
    @JsonKey(name: 'defaultFacilityID') String? facilityID,
    @JsonKey(name: 'TreatmentEnrollmentDate') String? treatmentEnrollmentDate,
    @JsonKey(name: 'TreatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'User') User? user,
    @JsonKey(name: 'ChvUserID') String? chvUserID,
    @JsonKey(name: 'ChvUserName') String? chvUserName,
    @JsonKey(name: 'CCCNumber') String? cccNumber,
    @JsonKey(name: 'FhirPatientID') String? fhirPatientID,
    @JsonKey(name: 'HealthRecordID') String? healthRecordID,
    @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
  }) = _ClientProfile;

  factory ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileFromJson(json);

  factory ClientProfile.initial() => ClientProfile(
        id: UNKNOWN,
        user: User.initial(),
        treatmentEnrollmentDate: UNKNOWN,
        treatmentBuddy: UNKNOWN,
        clientTypes: <ClientType>[ClientType.UNKNOWN],
        active: false,
        facilityID: UNKNOWN,
        counselled: false,
        chvUserID: UNKNOWN,
        chvUserName: UNKNOWN,
        cccNumber: UNKNOWN,
        fhirPatientID: UNKNOWN,
        healthRecordID: UNKNOWN,
      );
}
