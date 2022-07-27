// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/redux/states/communities_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/core/address.dart';
import 'package:pro_health_360/domain/core/entities/core/health_diary_state.dart';
import 'package:pro_health_360/domain/core/entities/core/health_timeline_state.dart';
import 'package:pro_health_360/domain/core/entities/core/notification_filter_state.dart';
import 'package:pro_health_360/domain/core/entities/core/related_person.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_state.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/next_refill_data.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_edges.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

part 'client_state.freezed.dart';
part 'client_state.g.dart';

@freezed
class ClientState with _$ClientState {
  factory ClientState({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'addresses') List<Address>? addresses,
    @JsonKey(name: 'counselled', defaultValue: false) bool? counselled,
    @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
    @JsonKey(name: 'facilityID') String? facilityID,
    @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
    @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
    @JsonKey(name: 'user') User? user,

    /// others
    @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
    @JsonKey(name: 'isSignedIn') bool? isSignedIn,
    @JsonKey(name: 'facilityName') String? facilityName,
    @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
    @JsonKey(name: 'chvUserID') String? chvUserID,
    @JsonKey(name: 'chvUserName') String? chvUserName,
    @JsonKey(name: 'CCCNumber') String? cccNumber,
    @JsonKey(name: 'fhirPatientID') String? fhirPatientID,

    /// The client's health diary state
    HealthDiaryState? healthDiaryState,

    // communities state
    CommunitiesState? communitiesState,

    // Past appointments
    List<Appointment>? pastAppointments,

    // Past appointments
    List<Appointment>? upcomingAppointments,
    // screening tools state

    HealthTimelineState? healthTimelineState,

    // Medical data state
    MedicalDataState? medicalDataState,

    // viral load data
    ViralLoadEdges? viralLoadData,

    // next refill data
    NextRefillData? nextRefillData,

    // caregiver information
    CaregiverInformation? caregiverInformation,
    bool? hasCareGiverInfo,

    // notifications
    List<NotificationDetails?>? notifications,
    NotificationFilterState? notificationFilterState,
  }) = _ClientState;

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);

  factory ClientState.initial() => ClientState(
        id: UNKNOWN,
        user: User.initial(),
        treatmentEnrollmentDate: UNKNOWN,
        clientTypes: <ClientType>[ClientType.UNKNOWN],
        active: false,
        addresses: <Address>[],
        relatedPersons: <RelatedPerson>[],
        facilityID: UNKNOWN,
        treatmentBuddy: UNKNOWN,
        counselled: false,
        lastMoodRecordedDate: UNKNOWN,
        isSignedIn: false,
        facilityName: UNKNOWN,
        healthDiaryState: HealthDiaryState.initial(),
        facilityPhoneNumber: UNKNOWN,
        chvUserID: UNKNOWN,
        chvUserName: UNKNOWN,
        communitiesState: CommunitiesState.initial(),
        pastAppointments: <Appointment>[],
        upcomingAppointments: <Appointment>[],
        cccNumber: UNKNOWN,
        fhirPatientID: UNKNOWN,
        healthTimelineState: HealthTimelineState.initial(),
        medicalDataState: MedicalDataState.initial(),
        viralLoadData: ViralLoadEdges.initial(),
        nextRefillData: NextRefillData.initial(),
        caregiverInformation: CaregiverInformation.initial(),
        notifications: <NotificationDetails>[],
        hasCareGiverInfo: false,
      );
}
