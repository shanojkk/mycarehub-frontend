// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientState _$$_ClientStateFromJson(Map<String, dynamic> json) =>
    _$_ClientState(
      clientProfile: json['clientProfile'] == null
          ? null
          : ClientProfile.fromJson(
              json['clientProfile'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilityID: json['defaultFacilityID'] as String?,
      relatedPersons: (json['relatedPersons'] as List<dynamic>?)
          ?.map((e) => RelatedPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMoodRecordedDate: json['lastMoodRecordedDate'] as String?,
      isSignedIn: json['isSignedIn'] as bool?,
      facilityName: json['defaultFacilityName'] as String?,
      facilityPhoneNumber: json['facilityPhoneNumber'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => AuthorityPermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityToken: json['communityToken'] as String?,
      healthDiaryState: json['healthDiaryState'] == null
          ? null
          : HealthDiaryState.fromJson(
              json['healthDiaryState'] as Map<String, dynamic>),
      communitiesState: json['communitiesState'] == null
          ? null
          : CommunitiesState.fromJson(
              json['communitiesState'] as Map<String, dynamic>),
      pastAppointments: (json['pastAppointments'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcomingAppointments: (json['upcomingAppointments'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      healthTimelineState: json['healthTimelineState'] == null
          ? null
          : HealthTimelineState.fromJson(
              json['healthTimelineState'] as Map<String, dynamic>),
      medicalDataState: json['medicalDataState'] == null
          ? null
          : MedicalDataState.fromJson(
              json['medicalDataState'] as Map<String, dynamic>),
      viralLoadData: json['viralLoadData'] == null
          ? null
          : ViralLoadEdges.fromJson(
              json['viralLoadData'] as Map<String, dynamic>),
      nextRefillData: json['nextRefillData'] == null
          ? null
          : NextRefillData.fromJson(
              json['nextRefillData'] as Map<String, dynamic>),
      caregiverInformation: json['caregiverInformation'] == null
          ? null
          : CaregiverInformation.fromJson(
              json['caregiverInformation'] as Map<String, dynamic>),
      hasCareGiverInfo: json['hasCareGiverInfo'] as bool?,
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NotificationDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      notificationFilterState: json['notificationFilterState'] == null
          ? null
          : NotificationFilterState.fromJson(
              json['notificationFilterState'] as Map<String, dynamic>),
      facilityState: json['facilityState'] == null
          ? null
          : FacilityState.fromJson(
              json['facilityState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientStateToJson(_$_ClientState instance) =>
    <String, dynamic>{
      'clientProfile': instance.clientProfile,
      'addresses': instance.addresses,
      'defaultFacilityID': instance.facilityID,
      'relatedPersons': instance.relatedPersons,
      'lastMoodRecordedDate': instance.lastMoodRecordedDate,
      'isSignedIn': instance.isSignedIn,
      'defaultFacilityName': instance.facilityName,
      'facilityPhoneNumber': instance.facilityPhoneNumber,
      'roles': instance.roles,
      'permissions': instance.permissions,
      'communityToken': instance.communityToken,
      'healthDiaryState': instance.healthDiaryState,
      'communitiesState': instance.communitiesState,
      'pastAppointments': instance.pastAppointments,
      'upcomingAppointments': instance.upcomingAppointments,
      'healthTimelineState': instance.healthTimelineState,
      'medicalDataState': instance.medicalDataState,
      'viralLoadData': instance.viralLoadData,
      'nextRefillData': instance.nextRefillData,
      'caregiverInformation': instance.caregiverInformation,
      'hasCareGiverInfo': instance.hasCareGiverInfo,
      'notifications': instance.notifications,
      'notificationFilterState': instance.notificationFilterState,
      'facilityState': instance.facilityState,
    };
