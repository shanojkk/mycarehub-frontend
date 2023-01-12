// Package imports:

import 'package:pro_health_360/domain/core/entities/core/authority_permission.dart';
import 'package:pro_health_360/domain/core/entities/core/client_profile.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/redux/states/communities_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/core/address.dart';
import 'package:pro_health_360/domain/core/entities/core/facility_state.dart';
import 'package:pro_health_360/domain/core/entities/core/health_diary_state.dart';
import 'package:pro_health_360/domain/core/entities/core/health_timeline_state.dart';
import 'package:pro_health_360/domain/core/entities/core/notification_filter_state.dart';
import 'package:pro_health_360/domain/core/entities/core/related_person.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_state.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/next_refill_data.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_edges.dart';

part 'client_state.freezed.dart';
part 'client_state.g.dart';

@freezed
class ClientState with _$ClientState {
  factory ClientState({
    @JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
    @JsonKey(name: 'addresses') List<Address>? addresses,
    @JsonKey(name: 'defaultFacilityID') String? facilityID,
    @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
    @JsonKey(name: 'User') User? user,

    /// others
    @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
    @JsonKey(name: 'isSignedIn') bool? isSignedIn,
    @JsonKey(name: 'defaultFacilityName') String? facilityName,
    @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
    @JsonKey(name: 'roles') List<Role>? roles,
    @JsonKey(name: 'permissions') List<AuthorityPermission>? permissions,
    @JsonKey(name: 'communityToken') String? communityToken,

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
    FacilityState? facilityState,
  }) = _ClientState;

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);

  factory ClientState.initial() => ClientState(
        // id: UNKNOWN,
        clientProfile: ClientProfile.initial(),
        user: User.initial(),
        addresses: <Address>[],
        relatedPersons: <RelatedPerson>[],
        facilityID: UNKNOWN,
        lastMoodRecordedDate: UNKNOWN,
        isSignedIn: false,
        facilityName: UNKNOWN,
        healthDiaryState: HealthDiaryState.initial(),
        facilityPhoneNumber: UNKNOWN,
        communitiesState: CommunitiesState.initial(),
        pastAppointments: <Appointment>[],
        upcomingAppointments: <Appointment>[],
        healthTimelineState: HealthTimelineState.initial(),
        medicalDataState: MedicalDataState.initial(),
        viralLoadData: ViralLoadEdges.initial(),
        nextRefillData: NextRefillData.initial(),
        caregiverInformation: CaregiverInformation.initial(),
        notifications: <NotificationDetails>[],
        hasCareGiverInfo: false,
        facilityState: FacilityState.initial(),
        roles: <Role>[],
        permissions: <AuthorityPermission>[],
      );
}
