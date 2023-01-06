// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientState _$ClientStateFromJson(Map<String, dynamic> json) {
  return _ClientState.fromJson(json);
}

/// @nodoc
mixin _$ClientState {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'counselled', defaultValue: false)
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;

  /// others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacilityName')
  String? get facilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityPhoneNumber')
  String? get facilityPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'chvUserID')
  String? get chvUserID => throw _privateConstructorUsedError;
  @JsonKey(name: 'chvUserName')
  String? get chvUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CCCNumber')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'fhirPatientID')
  String? get fhirPatientID => throw _privateConstructorUsedError;

  /// The client's health diary state
  HealthDiaryState? get healthDiaryState =>
      throw _privateConstructorUsedError; // communities state
  CommunitiesState? get communitiesState =>
      throw _privateConstructorUsedError; // Past appointments
  List<Appointment>? get pastAppointments =>
      throw _privateConstructorUsedError; // Past appointments
  List<Appointment>? get upcomingAppointments =>
      throw _privateConstructorUsedError; // screening tools state
  HealthTimelineState? get healthTimelineState =>
      throw _privateConstructorUsedError; // Medical data state
  MedicalDataState? get medicalDataState =>
      throw _privateConstructorUsedError; // viral load data
  ViralLoadEdges? get viralLoadData =>
      throw _privateConstructorUsedError; // next refill data
  NextRefillData? get nextRefillData =>
      throw _privateConstructorUsedError; // caregiver information
  CaregiverInformation? get caregiverInformation =>
      throw _privateConstructorUsedError;
  bool? get hasCareGiverInfo =>
      throw _privateConstructorUsedError; // notifications
  List<NotificationDetails?>? get notifications =>
      throw _privateConstructorUsedError;
  NotificationFilterState? get notificationFilterState =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientStateCopyWith<ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStateCopyWith<$Res> {
  factory $ClientStateCopyWith(
          ClientState value, $Res Function(ClientState) then) =
      _$ClientStateCopyWithImpl<$Res, ClientState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'addresses') List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false) bool? counselled,
      @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID') String? facilityID,
      @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn') bool? isSignedIn,
      @JsonKey(name: 'defaultFacilityName') String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID') String? chvUserID,
      @JsonKey(name: 'chvUserName') String? chvUserName,
      @JsonKey(name: 'CCCNumber') String? cccNumber,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      HealthDiaryState? healthDiaryState,
      CommunitiesState? communitiesState,
      List<Appointment>? pastAppointments,
      List<Appointment>? upcomingAppointments,
      HealthTimelineState? healthTimelineState,
      MedicalDataState? medicalDataState,
      ViralLoadEdges? viralLoadData,
      NextRefillData? nextRefillData,
      CaregiverInformation? caregiverInformation,
      bool? hasCareGiverInfo,
      List<NotificationDetails?>? notifications,
      NotificationFilterState? notificationFilterState});

  $UserCopyWith<$Res>? get user;
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState;
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  $HealthTimelineStateCopyWith<$Res>? get healthTimelineState;
  $MedicalDataStateCopyWith<$Res>? get medicalDataState;
  $ViralLoadEdgesCopyWith<$Res>? get viralLoadData;
  $NextRefillDataCopyWith<$Res>? get nextRefillData;
  $CaregiverInformationCopyWith<$Res>? get caregiverInformation;
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
}

/// @nodoc
class _$ClientStateCopyWithImpl<$Res, $Val extends ClientState>
    implements $ClientStateCopyWith<$Res> {
  _$ClientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? counselled = freezed,
    Object? clientTypes = freezed,
    Object? facilityID = freezed,
    Object? relatedPersons = freezed,
    Object? treatmentBuddy = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? user = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
    Object? facilityName = freezed,
    Object? facilityPhoneNumber = freezed,
    Object? chvUserID = freezed,
    Object? chvUserName = freezed,
    Object? cccNumber = freezed,
    Object? fhirPatientID = freezed,
    Object? healthDiaryState = freezed,
    Object? communitiesState = freezed,
    Object? pastAppointments = freezed,
    Object? upcomingAppointments = freezed,
    Object? healthTimelineState = freezed,
    Object? medicalDataState = freezed,
    Object? viralLoadData = freezed,
    Object? nextRefillData = freezed,
    Object? caregiverInformation = freezed,
    Object? hasCareGiverInfo = freezed,
    Object? notifications = freezed,
    Object? notificationFilterState = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      counselled: freezed == counselled
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientTypes: freezed == clientTypes
          ? _value.clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      facilityID: freezed == facilityID
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedPersons: freezed == relatedPersons
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      treatmentBuddy: freezed == treatmentBuddy
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentEnrollmentDate: freezed == treatmentEnrollmentDate
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      lastMoodRecordedDate: freezed == lastMoodRecordedDate
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: freezed == isSignedIn
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilityName: freezed == facilityName
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityPhoneNumber: freezed == facilityPhoneNumber
          ? _value.facilityPhoneNumber
          : facilityPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserID: freezed == chvUserID
          ? _value.chvUserID
          : chvUserID // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserName: freezed == chvUserName
          ? _value.chvUserName
          : chvUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      cccNumber: freezed == cccNumber
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fhirPatientID: freezed == fhirPatientID
          ? _value.fhirPatientID
          : fhirPatientID // ignore: cast_nullable_to_non_nullable
              as String?,
      healthDiaryState: freezed == healthDiaryState
          ? _value.healthDiaryState
          : healthDiaryState // ignore: cast_nullable_to_non_nullable
              as HealthDiaryState?,
      communitiesState: freezed == communitiesState
          ? _value.communitiesState
          : communitiesState // ignore: cast_nullable_to_non_nullable
              as CommunitiesState?,
      pastAppointments: freezed == pastAppointments
          ? _value.pastAppointments
          : pastAppointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      upcomingAppointments: freezed == upcomingAppointments
          ? _value.upcomingAppointments
          : upcomingAppointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      healthTimelineState: freezed == healthTimelineState
          ? _value.healthTimelineState
          : healthTimelineState // ignore: cast_nullable_to_non_nullable
              as HealthTimelineState?,
      medicalDataState: freezed == medicalDataState
          ? _value.medicalDataState
          : medicalDataState // ignore: cast_nullable_to_non_nullable
              as MedicalDataState?,
      viralLoadData: freezed == viralLoadData
          ? _value.viralLoadData
          : viralLoadData // ignore: cast_nullable_to_non_nullable
              as ViralLoadEdges?,
      nextRefillData: freezed == nextRefillData
          ? _value.nextRefillData
          : nextRefillData // ignore: cast_nullable_to_non_nullable
              as NextRefillData?,
      caregiverInformation: freezed == caregiverInformation
          ? _value.caregiverInformation
          : caregiverInformation // ignore: cast_nullable_to_non_nullable
              as CaregiverInformation?,
      hasCareGiverInfo: freezed == hasCareGiverInfo
          ? _value.hasCareGiverInfo
          : hasCareGiverInfo // ignore: cast_nullable_to_non_nullable
              as bool?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails?>?,
      notificationFilterState: freezed == notificationFilterState
          ? _value.notificationFilterState
          : notificationFilterState // ignore: cast_nullable_to_non_nullable
              as NotificationFilterState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState {
    if (_value.healthDiaryState == null) {
      return null;
    }

    return $HealthDiaryStateCopyWith<$Res>(_value.healthDiaryState!, (value) {
      return _then(_value.copyWith(healthDiaryState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunitiesStateCopyWith<$Res>? get communitiesState {
    if (_value.communitiesState == null) {
      return null;
    }

    return $CommunitiesStateCopyWith<$Res>(_value.communitiesState!, (value) {
      return _then(_value.copyWith(communitiesState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthTimelineStateCopyWith<$Res>? get healthTimelineState {
    if (_value.healthTimelineState == null) {
      return null;
    }

    return $HealthTimelineStateCopyWith<$Res>(_value.healthTimelineState!,
        (value) {
      return _then(_value.copyWith(healthTimelineState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicalDataStateCopyWith<$Res>? get medicalDataState {
    if (_value.medicalDataState == null) {
      return null;
    }

    return $MedicalDataStateCopyWith<$Res>(_value.medicalDataState!, (value) {
      return _then(_value.copyWith(medicalDataState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ViralLoadEdgesCopyWith<$Res>? get viralLoadData {
    if (_value.viralLoadData == null) {
      return null;
    }

    return $ViralLoadEdgesCopyWith<$Res>(_value.viralLoadData!, (value) {
      return _then(_value.copyWith(viralLoadData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NextRefillDataCopyWith<$Res>? get nextRefillData {
    if (_value.nextRefillData == null) {
      return null;
    }

    return $NextRefillDataCopyWith<$Res>(_value.nextRefillData!, (value) {
      return _then(_value.copyWith(nextRefillData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CaregiverInformationCopyWith<$Res>? get caregiverInformation {
    if (_value.caregiverInformation == null) {
      return null;
    }

    return $CaregiverInformationCopyWith<$Res>(_value.caregiverInformation!,
        (value) {
      return _then(_value.copyWith(caregiverInformation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState {
    if (_value.notificationFilterState == null) {
      return null;
    }

    return $NotificationFilterStateCopyWith<$Res>(
        _value.notificationFilterState!, (value) {
      return _then(_value.copyWith(notificationFilterState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClientStateCopyWith<$Res>
    implements $ClientStateCopyWith<$Res> {
  factory _$$_ClientStateCopyWith(
          _$_ClientState value, $Res Function(_$_ClientState) then) =
      __$$_ClientStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'addresses') List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false) bool? counselled,
      @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID') String? facilityID,
      @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn') bool? isSignedIn,
      @JsonKey(name: 'defaultFacilityName') String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID') String? chvUserID,
      @JsonKey(name: 'chvUserName') String? chvUserName,
      @JsonKey(name: 'CCCNumber') String? cccNumber,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      HealthDiaryState? healthDiaryState,
      CommunitiesState? communitiesState,
      List<Appointment>? pastAppointments,
      List<Appointment>? upcomingAppointments,
      HealthTimelineState? healthTimelineState,
      MedicalDataState? medicalDataState,
      ViralLoadEdges? viralLoadData,
      NextRefillData? nextRefillData,
      CaregiverInformation? caregiverInformation,
      bool? hasCareGiverInfo,
      List<NotificationDetails?>? notifications,
      NotificationFilterState? notificationFilterState});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState;
  @override
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  @override
  $HealthTimelineStateCopyWith<$Res>? get healthTimelineState;
  @override
  $MedicalDataStateCopyWith<$Res>? get medicalDataState;
  @override
  $ViralLoadEdgesCopyWith<$Res>? get viralLoadData;
  @override
  $NextRefillDataCopyWith<$Res>? get nextRefillData;
  @override
  $CaregiverInformationCopyWith<$Res>? get caregiverInformation;
  @override
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
}

/// @nodoc
class __$$_ClientStateCopyWithImpl<$Res>
    extends _$ClientStateCopyWithImpl<$Res, _$_ClientState>
    implements _$$_ClientStateCopyWith<$Res> {
  __$$_ClientStateCopyWithImpl(
      _$_ClientState _value, $Res Function(_$_ClientState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? counselled = freezed,
    Object? clientTypes = freezed,
    Object? facilityID = freezed,
    Object? relatedPersons = freezed,
    Object? treatmentBuddy = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? user = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
    Object? facilityName = freezed,
    Object? facilityPhoneNumber = freezed,
    Object? chvUserID = freezed,
    Object? chvUserName = freezed,
    Object? cccNumber = freezed,
    Object? fhirPatientID = freezed,
    Object? healthDiaryState = freezed,
    Object? communitiesState = freezed,
    Object? pastAppointments = freezed,
    Object? upcomingAppointments = freezed,
    Object? healthTimelineState = freezed,
    Object? medicalDataState = freezed,
    Object? viralLoadData = freezed,
    Object? nextRefillData = freezed,
    Object? caregiverInformation = freezed,
    Object? hasCareGiverInfo = freezed,
    Object? notifications = freezed,
    Object? notificationFilterState = freezed,
  }) {
    return _then(_$_ClientState(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      counselled: freezed == counselled
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientTypes: freezed == clientTypes
          ? _value._clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      facilityID: freezed == facilityID
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedPersons: freezed == relatedPersons
          ? _value._relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      treatmentBuddy: freezed == treatmentBuddy
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentEnrollmentDate: freezed == treatmentEnrollmentDate
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      lastMoodRecordedDate: freezed == lastMoodRecordedDate
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: freezed == isSignedIn
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilityName: freezed == facilityName
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityPhoneNumber: freezed == facilityPhoneNumber
          ? _value.facilityPhoneNumber
          : facilityPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserID: freezed == chvUserID
          ? _value.chvUserID
          : chvUserID // ignore: cast_nullable_to_non_nullable
              as String?,
      chvUserName: freezed == chvUserName
          ? _value.chvUserName
          : chvUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      cccNumber: freezed == cccNumber
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fhirPatientID: freezed == fhirPatientID
          ? _value.fhirPatientID
          : fhirPatientID // ignore: cast_nullable_to_non_nullable
              as String?,
      healthDiaryState: freezed == healthDiaryState
          ? _value.healthDiaryState
          : healthDiaryState // ignore: cast_nullable_to_non_nullable
              as HealthDiaryState?,
      communitiesState: freezed == communitiesState
          ? _value.communitiesState
          : communitiesState // ignore: cast_nullable_to_non_nullable
              as CommunitiesState?,
      pastAppointments: freezed == pastAppointments
          ? _value._pastAppointments
          : pastAppointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      upcomingAppointments: freezed == upcomingAppointments
          ? _value._upcomingAppointments
          : upcomingAppointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      healthTimelineState: freezed == healthTimelineState
          ? _value.healthTimelineState
          : healthTimelineState // ignore: cast_nullable_to_non_nullable
              as HealthTimelineState?,
      medicalDataState: freezed == medicalDataState
          ? _value.medicalDataState
          : medicalDataState // ignore: cast_nullable_to_non_nullable
              as MedicalDataState?,
      viralLoadData: freezed == viralLoadData
          ? _value.viralLoadData
          : viralLoadData // ignore: cast_nullable_to_non_nullable
              as ViralLoadEdges?,
      nextRefillData: freezed == nextRefillData
          ? _value.nextRefillData
          : nextRefillData // ignore: cast_nullable_to_non_nullable
              as NextRefillData?,
      caregiverInformation: freezed == caregiverInformation
          ? _value.caregiverInformation
          : caregiverInformation // ignore: cast_nullable_to_non_nullable
              as CaregiverInformation?,
      hasCareGiverInfo: freezed == hasCareGiverInfo
          ? _value.hasCareGiverInfo
          : hasCareGiverInfo // ignore: cast_nullable_to_non_nullable
              as bool?,
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails?>?,
      notificationFilterState: freezed == notificationFilterState
          ? _value.notificationFilterState
          : notificationFilterState // ignore: cast_nullable_to_non_nullable
              as NotificationFilterState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientState implements _ClientState {
  _$_ClientState(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'addresses')
          final List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          this.counselled,
      @JsonKey(name: 'clientTypes')
          final List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID')
          this.facilityID,
      @JsonKey(name: 'relatedPersons')
          final List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          this.treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          this.treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          this.user,
      @JsonKey(name: 'lastMoodRecordedDate')
          this.lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          this.isSignedIn,
      @JsonKey(name: 'defaultFacilityName')
          this.facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          this.facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          this.chvUserID,
      @JsonKey(name: 'chvUserName')
          this.chvUserName,
      @JsonKey(name: 'CCCNumber')
          this.cccNumber,
      @JsonKey(name: 'fhirPatientID')
          this.fhirPatientID,
      this.healthDiaryState,
      this.communitiesState,
      final List<Appointment>? pastAppointments,
      final List<Appointment>? upcomingAppointments,
      this.healthTimelineState,
      this.medicalDataState,
      this.viralLoadData,
      this.nextRefillData,
      this.caregiverInformation,
      this.hasCareGiverInfo,
      final List<NotificationDetails?>? notifications,
      this.notificationFilterState})
      : _addresses = addresses,
        _clientTypes = clientTypes,
        _relatedPersons = relatedPersons,
        _pastAppointments = pastAppointments,
        _upcomingAppointments = upcomingAppointments,
        _notifications = notifications;

  factory _$_ClientState.fromJson(Map<String, dynamic> json) =>
      _$$_ClientStateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  final List<Address>? _addresses;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'counselled', defaultValue: false)
  final bool? counselled;
  final List<ClientType>? _clientTypes;
  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes {
    final value = _clientTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'defaultFacilityID')
  final String? facilityID;
  final List<RelatedPerson>? _relatedPersons;
  @override
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons {
    final value = _relatedPersons;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'treatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  final String? treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'user')
  final User? user;

  /// others
  @override
  @JsonKey(name: 'lastMoodRecordedDate')
  final String? lastMoodRecordedDate;
  @override
  @JsonKey(name: 'isSignedIn')
  final bool? isSignedIn;
  @override
  @JsonKey(name: 'defaultFacilityName')
  final String? facilityName;
  @override
  @JsonKey(name: 'facilityPhoneNumber')
  final String? facilityPhoneNumber;
  @override
  @JsonKey(name: 'chvUserID')
  final String? chvUserID;
  @override
  @JsonKey(name: 'chvUserName')
  final String? chvUserName;
  @override
  @JsonKey(name: 'CCCNumber')
  final String? cccNumber;
  @override
  @JsonKey(name: 'fhirPatientID')
  final String? fhirPatientID;

  /// The client's health diary state
  @override
  final HealthDiaryState? healthDiaryState;
// communities state
  @override
  final CommunitiesState? communitiesState;
// Past appointments
  final List<Appointment>? _pastAppointments;
// Past appointments
  @override
  List<Appointment>? get pastAppointments {
    final value = _pastAppointments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Past appointments
  final List<Appointment>? _upcomingAppointments;
// Past appointments
  @override
  List<Appointment>? get upcomingAppointments {
    final value = _upcomingAppointments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// screening tools state
  @override
  final HealthTimelineState? healthTimelineState;
// Medical data state
  @override
  final MedicalDataState? medicalDataState;
// viral load data
  @override
  final ViralLoadEdges? viralLoadData;
// next refill data
  @override
  final NextRefillData? nextRefillData;
// caregiver information
  @override
  final CaregiverInformation? caregiverInformation;
  @override
  final bool? hasCareGiverInfo;
// notifications
  final List<NotificationDetails?>? _notifications;
// notifications
  @override
  List<NotificationDetails?>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NotificationFilterState? notificationFilterState;

  @override
  String toString() {
    return 'ClientState(id: $id, active: $active, addresses: $addresses, counselled: $counselled, clientTypes: $clientTypes, facilityID: $facilityID, relatedPersons: $relatedPersons, treatmentBuddy: $treatmentBuddy, treatmentEnrollmentDate: $treatmentEnrollmentDate, user: $user, lastMoodRecordedDate: $lastMoodRecordedDate, isSignedIn: $isSignedIn, facilityName: $facilityName, facilityPhoneNumber: $facilityPhoneNumber, chvUserID: $chvUserID, chvUserName: $chvUserName, cccNumber: $cccNumber, fhirPatientID: $fhirPatientID, healthDiaryState: $healthDiaryState, communitiesState: $communitiesState, pastAppointments: $pastAppointments, upcomingAppointments: $upcomingAppointments, healthTimelineState: $healthTimelineState, medicalDataState: $medicalDataState, viralLoadData: $viralLoadData, nextRefillData: $nextRefillData, caregiverInformation: $caregiverInformation, hasCareGiverInfo: $hasCareGiverInfo, notifications: $notifications, notificationFilterState: $notificationFilterState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.counselled, counselled) ||
                other.counselled == counselled) &&
            const DeepCollectionEquality()
                .equals(other._clientTypes, _clientTypes) &&
            (identical(other.facilityID, facilityID) ||
                other.facilityID == facilityID) &&
            const DeepCollectionEquality()
                .equals(other._relatedPersons, _relatedPersons) &&
            (identical(other.treatmentBuddy, treatmentBuddy) ||
                other.treatmentBuddy == treatmentBuddy) &&
            (identical(
                    other.treatmentEnrollmentDate, treatmentEnrollmentDate) ||
                other.treatmentEnrollmentDate == treatmentEnrollmentDate) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.lastMoodRecordedDate, lastMoodRecordedDate) ||
                other.lastMoodRecordedDate == lastMoodRecordedDate) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.facilityName, facilityName) ||
                other.facilityName == facilityName) &&
            (identical(other.facilityPhoneNumber, facilityPhoneNumber) ||
                other.facilityPhoneNumber == facilityPhoneNumber) &&
            (identical(other.chvUserID, chvUserID) ||
                other.chvUserID == chvUserID) &&
            (identical(other.chvUserName, chvUserName) ||
                other.chvUserName == chvUserName) &&
            (identical(other.cccNumber, cccNumber) ||
                other.cccNumber == cccNumber) &&
            (identical(other.fhirPatientID, fhirPatientID) ||
                other.fhirPatientID == fhirPatientID) &&
            (identical(other.healthDiaryState, healthDiaryState) ||
                other.healthDiaryState == healthDiaryState) &&
            (identical(other.communitiesState, communitiesState) ||
                other.communitiesState == communitiesState) &&
            const DeepCollectionEquality()
                .equals(other._pastAppointments, _pastAppointments) &&
            const DeepCollectionEquality()
                .equals(other._upcomingAppointments, _upcomingAppointments) &&
            (identical(other.healthTimelineState, healthTimelineState) ||
                other.healthTimelineState == healthTimelineState) &&
            (identical(other.medicalDataState, medicalDataState) ||
                other.medicalDataState == medicalDataState) &&
            (identical(other.viralLoadData, viralLoadData) ||
                other.viralLoadData == viralLoadData) &&
            (identical(other.nextRefillData, nextRefillData) ||
                other.nextRefillData == nextRefillData) &&
            (identical(other.caregiverInformation, caregiverInformation) ||
                other.caregiverInformation == caregiverInformation) &&
            (identical(other.hasCareGiverInfo, hasCareGiverInfo) ||
                other.hasCareGiverInfo == hasCareGiverInfo) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(
                    other.notificationFilterState, notificationFilterState) ||
                other.notificationFilterState == notificationFilterState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        active,
        const DeepCollectionEquality().hash(_addresses),
        counselled,
        const DeepCollectionEquality().hash(_clientTypes),
        facilityID,
        const DeepCollectionEquality().hash(_relatedPersons),
        treatmentBuddy,
        treatmentEnrollmentDate,
        user,
        lastMoodRecordedDate,
        isSignedIn,
        facilityName,
        facilityPhoneNumber,
        chvUserID,
        chvUserName,
        cccNumber,
        fhirPatientID,
        healthDiaryState,
        communitiesState,
        const DeepCollectionEquality().hash(_pastAppointments),
        const DeepCollectionEquality().hash(_upcomingAppointments),
        healthTimelineState,
        medicalDataState,
        viralLoadData,
        nextRefillData,
        caregiverInformation,
        hasCareGiverInfo,
        const DeepCollectionEquality().hash(_notifications),
        notificationFilterState
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientStateCopyWith<_$_ClientState> get copyWith =>
      __$$_ClientStateCopyWithImpl<_$_ClientState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientStateToJson(
      this,
    );
  }
}

abstract class _ClientState implements ClientState {
  factory _ClientState(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'addresses')
          final List<Address>? addresses,
      @JsonKey(name: 'counselled', defaultValue: false)
          final bool? counselled,
      @JsonKey(name: 'clientTypes')
          final List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID')
          final String? facilityID,
      @JsonKey(name: 'relatedPersons')
          final List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'treatmentBuddy')
          final String? treatmentBuddy,
      @JsonKey(name: 'treatmentEnrollmentDate')
          final String? treatmentEnrollmentDate,
      @JsonKey(name: 'user')
          final User? user,
      @JsonKey(name: 'lastMoodRecordedDate')
          final String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          final bool? isSignedIn,
      @JsonKey(name: 'defaultFacilityName')
          final String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          final String? facilityPhoneNumber,
      @JsonKey(name: 'chvUserID')
          final String? chvUserID,
      @JsonKey(name: 'chvUserName')
          final String? chvUserName,
      @JsonKey(name: 'CCCNumber')
          final String? cccNumber,
      @JsonKey(name: 'fhirPatientID')
          final String? fhirPatientID,
      final HealthDiaryState? healthDiaryState,
      final CommunitiesState? communitiesState,
      final List<Appointment>? pastAppointments,
      final List<Appointment>? upcomingAppointments,
      final HealthTimelineState? healthTimelineState,
      final MedicalDataState? medicalDataState,
      final ViralLoadEdges? viralLoadData,
      final NextRefillData? nextRefillData,
      final CaregiverInformation? caregiverInformation,
      final bool? hasCareGiverInfo,
      final List<NotificationDetails?>? notifications,
      final NotificationFilterState? notificationFilterState}) = _$_ClientState;

  factory _ClientState.fromJson(Map<String, dynamic> json) =
      _$_ClientState.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses;
  @override
  @JsonKey(name: 'counselled', defaultValue: false)
  bool? get counselled;
  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes;
  @override
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID;
  @override
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons;
  @override
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'user')
  User? get user;
  @override

  /// others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate;
  @override
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn;
  @override
  @JsonKey(name: 'defaultFacilityName')
  String? get facilityName;
  @override
  @JsonKey(name: 'facilityPhoneNumber')
  String? get facilityPhoneNumber;
  @override
  @JsonKey(name: 'chvUserID')
  String? get chvUserID;
  @override
  @JsonKey(name: 'chvUserName')
  String? get chvUserName;
  @override
  @JsonKey(name: 'CCCNumber')
  String? get cccNumber;
  @override
  @JsonKey(name: 'fhirPatientID')
  String? get fhirPatientID;
  @override

  /// The client's health diary state
  HealthDiaryState? get healthDiaryState;
  @override // communities state
  CommunitiesState? get communitiesState;
  @override // Past appointments
  List<Appointment>? get pastAppointments;
  @override // Past appointments
  List<Appointment>? get upcomingAppointments;
  @override // screening tools state
  HealthTimelineState? get healthTimelineState;
  @override // Medical data state
  MedicalDataState? get medicalDataState;
  @override // viral load data
  ViralLoadEdges? get viralLoadData;
  @override // next refill data
  NextRefillData? get nextRefillData;
  @override // caregiver information
  CaregiverInformation? get caregiverInformation;
  @override
  bool? get hasCareGiverInfo;
  @override // notifications
  List<NotificationDetails?>? get notifications;
  @override
  NotificationFilterState? get notificationFilterState;
  @override
  @JsonKey(ignore: true)
  _$$_ClientStateCopyWith<_$_ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
