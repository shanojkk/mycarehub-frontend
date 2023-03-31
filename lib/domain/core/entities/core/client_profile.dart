// Package imports:

import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/identifier.dart';

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
class ClientProfile with _$ClientProfile {
  factory ClientProfile({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'clientCounselled', defaultValue: false) bool? counselled,
    @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
    @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
    @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'chvUserID') String? chvUserID,
    @JsonKey(name: 'chvUserName') String? chvUserName,
    @JsonKey(name: 'identifiers') List<Identifier>? identifiers,
    @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
    @JsonKey(name: 'healthRecordID') String? healthRecordID,
    @JsonKey(name: 'caregiverID') String? caregiverID,
    @JsonKey(name: 'defaultFacility') Facility? defaultFacility,
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
        counselled: false,
        chvUserID: UNKNOWN,
        chvUserName: UNKNOWN,
        identifiers: <Identifier>[],
        fhirPatientID: UNKNOWN,
        healthRecordID: UNKNOWN,
        defaultFacility: Facility.initial(),
      );
}
