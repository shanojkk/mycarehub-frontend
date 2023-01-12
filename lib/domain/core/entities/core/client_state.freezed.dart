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
  @JsonKey(name: 'clientProfile')
  ClientProfile? get clientProfile =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'ID') String? id,
// @JsonKey(name: 'Active', defaultValue: false) bool? active,
  @JsonKey(name: 'addresses')
  List<Address>? get addresses =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'ClientCounselled', defaultValue: false) bool? counselled,
// @JsonKey(name: 'ClientTypes') List<ClientType>? clientTypes,
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'TreatmentEnrollmentDate') String? treatmentEnrollmentDate,
  @JsonKey(name: 'User')
  User? get user => throw _privateConstructorUsedError;

  /// others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacilityName')
  String? get facilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityPhoneNumber')
  String? get facilityPhoneNumber =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'ChvUserID') String? chvUserID,
// @JsonKey(name: 'ChvUserName') String? chvUserName,
// @JsonKey(name: 'CCCNumber') String? cccNumber,
// @JsonKey(name: 'FhirPatientID') String? fhirPatientID,
// @JsonKey(name: 'HealthRecordID') String? healthRecordID,
// @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
  @JsonKey(name: 'roles')
  List<Role>? get roles => throw _privateConstructorUsedError;
  @JsonKey(name: 'permissions')
  List<AuthorityPermission>? get permissions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'communityToken')
  String? get communityToken => throw _privateConstructorUsedError;

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
  FacilityState? get facilityState => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
      @JsonKey(name: 'addresses') List<Address>? addresses,
      @JsonKey(name: 'defaultFacilityID') String? facilityID,
      @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'User') User? user,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn') bool? isSignedIn,
      @JsonKey(name: 'defaultFacilityName') String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
      @JsonKey(name: 'roles') List<Role>? roles,
      @JsonKey(name: 'permissions') List<AuthorityPermission>? permissions,
      @JsonKey(name: 'communityToken') String? communityToken,
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
      NotificationFilterState? notificationFilterState,
      FacilityState? facilityState});

  $ClientProfileCopyWith<$Res>? get clientProfile;
  $UserCopyWith<$Res>? get user;
  $HealthDiaryStateCopyWith<$Res>? get healthDiaryState;
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  $HealthTimelineStateCopyWith<$Res>? get healthTimelineState;
  $MedicalDataStateCopyWith<$Res>? get medicalDataState;
  $ViralLoadEdgesCopyWith<$Res>? get viralLoadData;
  $NextRefillDataCopyWith<$Res>? get nextRefillData;
  $CaregiverInformationCopyWith<$Res>? get caregiverInformation;
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
  $FacilityStateCopyWith<$Res>? get facilityState;
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
    Object? clientProfile = freezed,
    Object? addresses = freezed,
    Object? facilityID = freezed,
    Object? relatedPersons = freezed,
    Object? user = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
    Object? facilityName = freezed,
    Object? facilityPhoneNumber = freezed,
    Object? roles = freezed,
    Object? permissions = freezed,
    Object? communityToken = freezed,
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
    Object? facilityState = freezed,
  }) {
    return _then(_value.copyWith(
      clientProfile: freezed == clientProfile
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      facilityID: freezed == facilityID
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedPersons: freezed == relatedPersons
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
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
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AuthorityPermission>?,
      communityToken: freezed == communityToken
          ? _value.communityToken
          : communityToken // ignore: cast_nullable_to_non_nullable
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
      facilityState: freezed == facilityState
          ? _value.facilityState
          : facilityState // ignore: cast_nullable_to_non_nullable
              as FacilityState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientProfileCopyWith<$Res>? get clientProfile {
    if (_value.clientProfile == null) {
      return null;
    }

    return $ClientProfileCopyWith<$Res>(_value.clientProfile!, (value) {
      return _then(_value.copyWith(clientProfile: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $FacilityStateCopyWith<$Res>? get facilityState {
    if (_value.facilityState == null) {
      return null;
    }

    return $FacilityStateCopyWith<$Res>(_value.facilityState!, (value) {
      return _then(_value.copyWith(facilityState: value) as $Val);
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
      {@JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
      @JsonKey(name: 'addresses') List<Address>? addresses,
      @JsonKey(name: 'defaultFacilityID') String? facilityID,
      @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'User') User? user,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn') bool? isSignedIn,
      @JsonKey(name: 'defaultFacilityName') String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
      @JsonKey(name: 'roles') List<Role>? roles,
      @JsonKey(name: 'permissions') List<AuthorityPermission>? permissions,
      @JsonKey(name: 'communityToken') String? communityToken,
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
      NotificationFilterState? notificationFilterState,
      FacilityState? facilityState});

  @override
  $ClientProfileCopyWith<$Res>? get clientProfile;
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
  @override
  $FacilityStateCopyWith<$Res>? get facilityState;
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
    Object? clientProfile = freezed,
    Object? addresses = freezed,
    Object? facilityID = freezed,
    Object? relatedPersons = freezed,
    Object? user = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
    Object? facilityName = freezed,
    Object? facilityPhoneNumber = freezed,
    Object? roles = freezed,
    Object? permissions = freezed,
    Object? communityToken = freezed,
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
    Object? facilityState = freezed,
  }) {
    return _then(_$_ClientState(
      clientProfile: freezed == clientProfile
          ? _value.clientProfile
          : clientProfile // ignore: cast_nullable_to_non_nullable
              as ClientProfile?,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      facilityID: freezed == facilityID
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedPersons: freezed == relatedPersons
          ? _value._relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
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
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<AuthorityPermission>?,
      communityToken: freezed == communityToken
          ? _value.communityToken
          : communityToken // ignore: cast_nullable_to_non_nullable
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
      facilityState: freezed == facilityState
          ? _value.facilityState
          : facilityState // ignore: cast_nullable_to_non_nullable
              as FacilityState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientState implements _ClientState {
  _$_ClientState(
      {@JsonKey(name: 'clientProfile')
          this.clientProfile,
      @JsonKey(name: 'addresses')
          final List<Address>? addresses,
      @JsonKey(name: 'defaultFacilityID')
          this.facilityID,
      @JsonKey(name: 'relatedPersons')
          final List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'User')
          this.user,
      @JsonKey(name: 'lastMoodRecordedDate')
          this.lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          this.isSignedIn,
      @JsonKey(name: 'defaultFacilityName')
          this.facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          this.facilityPhoneNumber,
      @JsonKey(name: 'roles')
          final List<Role>? roles,
      @JsonKey(name: 'permissions')
          final List<AuthorityPermission>? permissions,
      @JsonKey(name: 'communityToken')
          this.communityToken,
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
      this.notificationFilterState,
      this.facilityState})
      : _addresses = addresses,
        _relatedPersons = relatedPersons,
        _roles = roles,
        _permissions = permissions,
        _pastAppointments = pastAppointments,
        _upcomingAppointments = upcomingAppointments,
        _notifications = notifications;

  factory _$_ClientState.fromJson(Map<String, dynamic> json) =>
      _$$_ClientStateFromJson(json);

  @override
  @JsonKey(name: 'clientProfile')
  final ClientProfile? clientProfile;
// @JsonKey(name: 'ID') String? id,
// @JsonKey(name: 'Active', defaultValue: false) bool? active,
  final List<Address>? _addresses;
// @JsonKey(name: 'ID') String? id,
// @JsonKey(name: 'Active', defaultValue: false) bool? active,
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @JsonKey(name: 'ClientCounselled', defaultValue: false) bool? counselled,
// @JsonKey(name: 'ClientTypes') List<ClientType>? clientTypes,
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

// @JsonKey(name: 'TreatmentEnrollmentDate') String? treatmentEnrollmentDate,
  @override
  @JsonKey(name: 'User')
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
// @JsonKey(name: 'ChvUserID') String? chvUserID,
// @JsonKey(name: 'ChvUserName') String? chvUserName,
// @JsonKey(name: 'CCCNumber') String? cccNumber,
// @JsonKey(name: 'FhirPatientID') String? fhirPatientID,
// @JsonKey(name: 'HealthRecordID') String? healthRecordID,
// @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
  final List<Role>? _roles;
// @JsonKey(name: 'ChvUserID') String? chvUserID,
// @JsonKey(name: 'ChvUserName') String? chvUserName,
// @JsonKey(name: 'CCCNumber') String? cccNumber,
// @JsonKey(name: 'FhirPatientID') String? fhirPatientID,
// @JsonKey(name: 'HealthRecordID') String? healthRecordID,
// @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AuthorityPermission>? _permissions;
  @override
  @JsonKey(name: 'permissions')
  List<AuthorityPermission>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'communityToken')
  final String? communityToken;

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
  final FacilityState? facilityState;

  @override
  String toString() {
    return 'ClientState(clientProfile: $clientProfile, addresses: $addresses, facilityID: $facilityID, relatedPersons: $relatedPersons, user: $user, lastMoodRecordedDate: $lastMoodRecordedDate, isSignedIn: $isSignedIn, facilityName: $facilityName, facilityPhoneNumber: $facilityPhoneNumber, roles: $roles, permissions: $permissions, communityToken: $communityToken, healthDiaryState: $healthDiaryState, communitiesState: $communitiesState, pastAppointments: $pastAppointments, upcomingAppointments: $upcomingAppointments, healthTimelineState: $healthTimelineState, medicalDataState: $medicalDataState, viralLoadData: $viralLoadData, nextRefillData: $nextRefillData, caregiverInformation: $caregiverInformation, hasCareGiverInfo: $hasCareGiverInfo, notifications: $notifications, notificationFilterState: $notificationFilterState, facilityState: $facilityState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientState &&
            (identical(other.clientProfile, clientProfile) ||
                other.clientProfile == clientProfile) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.facilityID, facilityID) ||
                other.facilityID == facilityID) &&
            const DeepCollectionEquality()
                .equals(other._relatedPersons, _relatedPersons) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.lastMoodRecordedDate, lastMoodRecordedDate) ||
                other.lastMoodRecordedDate == lastMoodRecordedDate) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.facilityName, facilityName) ||
                other.facilityName == facilityName) &&
            (identical(other.facilityPhoneNumber, facilityPhoneNumber) ||
                other.facilityPhoneNumber == facilityPhoneNumber) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.communityToken, communityToken) ||
                other.communityToken == communityToken) &&
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
                other.notificationFilterState == notificationFilterState) &&
            (identical(other.facilityState, facilityState) ||
                other.facilityState == facilityState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        clientProfile,
        const DeepCollectionEquality().hash(_addresses),
        facilityID,
        const DeepCollectionEquality().hash(_relatedPersons),
        user,
        lastMoodRecordedDate,
        isSignedIn,
        facilityName,
        facilityPhoneNumber,
        const DeepCollectionEquality().hash(_roles),
        const DeepCollectionEquality().hash(_permissions),
        communityToken,
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
        notificationFilterState,
        facilityState
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
      {@JsonKey(name: 'clientProfile')
          final ClientProfile? clientProfile,
      @JsonKey(name: 'addresses')
          final List<Address>? addresses,
      @JsonKey(name: 'defaultFacilityID')
          final String? facilityID,
      @JsonKey(name: 'relatedPersons')
          final List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'User')
          final User? user,
      @JsonKey(name: 'lastMoodRecordedDate')
          final String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          final bool? isSignedIn,
      @JsonKey(name: 'defaultFacilityName')
          final String? facilityName,
      @JsonKey(name: 'facilityPhoneNumber')
          final String? facilityPhoneNumber,
      @JsonKey(name: 'roles')
          final List<Role>? roles,
      @JsonKey(name: 'permissions')
          final List<AuthorityPermission>? permissions,
      @JsonKey(name: 'communityToken')
          final String? communityToken,
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
      final NotificationFilterState? notificationFilterState,
      final FacilityState? facilityState}) = _$_ClientState;

  factory _ClientState.fromJson(Map<String, dynamic> json) =
      _$_ClientState.fromJson;

  @override
  @JsonKey(name: 'clientProfile')
  ClientProfile? get clientProfile;
  @override // @JsonKey(name: 'ID') String? id,
// @JsonKey(name: 'Active', defaultValue: false) bool? active,
  @JsonKey(name: 'addresses')
  List<Address>? get addresses;
  @override // @JsonKey(name: 'ClientCounselled', defaultValue: false) bool? counselled,
// @JsonKey(name: 'ClientTypes') List<ClientType>? clientTypes,
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID;
  @override
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons;
  @override // @JsonKey(name: 'TreatmentEnrollmentDate') String? treatmentEnrollmentDate,
  @JsonKey(name: 'User')
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
  @override // @JsonKey(name: 'ChvUserID') String? chvUserID,
// @JsonKey(name: 'ChvUserName') String? chvUserName,
// @JsonKey(name: 'CCCNumber') String? cccNumber,
// @JsonKey(name: 'FhirPatientID') String? fhirPatientID,
// @JsonKey(name: 'HealthRecordID') String? healthRecordID,
// @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
  @JsonKey(name: 'roles')
  List<Role>? get roles;
  @override
  @JsonKey(name: 'permissions')
  List<AuthorityPermission>? get permissions;
  @override
  @JsonKey(name: 'communityToken')
  String? get communityToken;
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
  FacilityState? get facilityState;
  @override
  @JsonKey(ignore: true)
  _$$_ClientStateCopyWith<_$_ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
