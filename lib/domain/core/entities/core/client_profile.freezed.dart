// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientProfile _$ClientProfileFromJson(Map<String, dynamic> json) {
  return _ClientProfile.fromJson(json);
}

/// @nodoc
mixin _$ClientProfile {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientCounselled', defaultValue: false)
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientTypes')
  List<ClientType>? get clientTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TreatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TreatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'User')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChvUserID')
  String? get chvUserID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChvUserName')
  String? get chvUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CCCNumber')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'FhirPatientID')
  String? get fhirPatientID => throw _privateConstructorUsedError;
  @JsonKey(name: 'HealthRecordID')
  String? get healthRecordID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultFacility')
  Facility? get defaultFacility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientProfileCopyWith<ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientProfileCopyWith<$Res> {
  factory $ClientProfileCopyWith(
          ClientProfile value, $Res Function(ClientProfile) then) =
      _$ClientProfileCopyWithImpl<$Res, ClientProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
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
      @JsonKey(name: 'DefaultFacility') Facility? defaultFacility});

  $UserCopyWith<$Res>? get user;
  $FacilityCopyWith<$Res>? get defaultFacility;
}

/// @nodoc
class _$ClientProfileCopyWithImpl<$Res, $Val extends ClientProfile>
    implements $ClientProfileCopyWith<$Res> {
  _$ClientProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? counselled = freezed,
    Object? clientTypes = freezed,
    Object? facilityID = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? treatmentBuddy = freezed,
    Object? user = freezed,
    Object? chvUserID = freezed,
    Object? chvUserName = freezed,
    Object? cccNumber = freezed,
    Object? fhirPatientID = freezed,
    Object? healthRecordID = freezed,
    Object? defaultFacility = freezed,
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
      treatmentEnrollmentDate: freezed == treatmentEnrollmentDate
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: freezed == treatmentBuddy
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
      healthRecordID: freezed == healthRecordID
          ? _value.healthRecordID
          : healthRecordID // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
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
  $FacilityCopyWith<$Res>? get defaultFacility {
    if (_value.defaultFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.defaultFacility!, (value) {
      return _then(_value.copyWith(defaultFacility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClientProfileCopyWith<$Res>
    implements $ClientProfileCopyWith<$Res> {
  factory _$$_ClientProfileCopyWith(
          _$_ClientProfile value, $Res Function(_$_ClientProfile) then) =
      __$$_ClientProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
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
      @JsonKey(name: 'DefaultFacility') Facility? defaultFacility});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $FacilityCopyWith<$Res>? get defaultFacility;
}

/// @nodoc
class __$$_ClientProfileCopyWithImpl<$Res>
    extends _$ClientProfileCopyWithImpl<$Res, _$_ClientProfile>
    implements _$$_ClientProfileCopyWith<$Res> {
  __$$_ClientProfileCopyWithImpl(
      _$_ClientProfile _value, $Res Function(_$_ClientProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? counselled = freezed,
    Object? clientTypes = freezed,
    Object? facilityID = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? treatmentBuddy = freezed,
    Object? user = freezed,
    Object? chvUserID = freezed,
    Object? chvUserName = freezed,
    Object? cccNumber = freezed,
    Object? fhirPatientID = freezed,
    Object? healthRecordID = freezed,
    Object? defaultFacility = freezed,
  }) {
    return _then(_$_ClientProfile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      treatmentEnrollmentDate: freezed == treatmentEnrollmentDate
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: freezed == treatmentBuddy
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
      healthRecordID: freezed == healthRecordID
          ? _value.healthRecordID
          : healthRecordID // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientProfile implements _ClientProfile {
  _$_ClientProfile(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Active', defaultValue: false) this.active,
      @JsonKey(name: 'ClientCounselled', defaultValue: false) this.counselled,
      @JsonKey(name: 'ClientTypes') final List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID') this.facilityID,
      @JsonKey(name: 'TreatmentEnrollmentDate') this.treatmentEnrollmentDate,
      @JsonKey(name: 'TreatmentBuddy') this.treatmentBuddy,
      @JsonKey(name: 'User') this.user,
      @JsonKey(name: 'ChvUserID') this.chvUserID,
      @JsonKey(name: 'ChvUserName') this.chvUserName,
      @JsonKey(name: 'CCCNumber') this.cccNumber,
      @JsonKey(name: 'FhirPatientID') this.fhirPatientID,
      @JsonKey(name: 'HealthRecordID') this.healthRecordID,
      @JsonKey(name: 'DefaultFacility') this.defaultFacility})
      : _clientTypes = clientTypes;

  factory _$_ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$$_ClientProfileFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'ClientCounselled', defaultValue: false)
  final bool? counselled;
  final List<ClientType>? _clientTypes;
  @override
  @JsonKey(name: 'ClientTypes')
  List<ClientType>? get clientTypes {
    final value = _clientTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'defaultFacilityID')
  final String? facilityID;
  @override
  @JsonKey(name: 'TreatmentEnrollmentDate')
  final String? treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'TreatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'User')
  final User? user;
  @override
  @JsonKey(name: 'ChvUserID')
  final String? chvUserID;
  @override
  @JsonKey(name: 'ChvUserName')
  final String? chvUserName;
  @override
  @JsonKey(name: 'CCCNumber')
  final String? cccNumber;
  @override
  @JsonKey(name: 'FhirPatientID')
  final String? fhirPatientID;
  @override
  @JsonKey(name: 'HealthRecordID')
  final String? healthRecordID;
  @override
  @JsonKey(name: 'DefaultFacility')
  final Facility? defaultFacility;

  @override
  String toString() {
    return 'ClientProfile(id: $id, active: $active, counselled: $counselled, clientTypes: $clientTypes, facilityID: $facilityID, treatmentEnrollmentDate: $treatmentEnrollmentDate, treatmentBuddy: $treatmentBuddy, user: $user, chvUserID: $chvUserID, chvUserName: $chvUserName, cccNumber: $cccNumber, fhirPatientID: $fhirPatientID, healthRecordID: $healthRecordID, defaultFacility: $defaultFacility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.counselled, counselled) ||
                other.counselled == counselled) &&
            const DeepCollectionEquality()
                .equals(other._clientTypes, _clientTypes) &&
            (identical(other.facilityID, facilityID) ||
                other.facilityID == facilityID) &&
            (identical(
                    other.treatmentEnrollmentDate, treatmentEnrollmentDate) ||
                other.treatmentEnrollmentDate == treatmentEnrollmentDate) &&
            (identical(other.treatmentBuddy, treatmentBuddy) ||
                other.treatmentBuddy == treatmentBuddy) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.chvUserID, chvUserID) ||
                other.chvUserID == chvUserID) &&
            (identical(other.chvUserName, chvUserName) ||
                other.chvUserName == chvUserName) &&
            (identical(other.cccNumber, cccNumber) ||
                other.cccNumber == cccNumber) &&
            (identical(other.fhirPatientID, fhirPatientID) ||
                other.fhirPatientID == fhirPatientID) &&
            (identical(other.healthRecordID, healthRecordID) ||
                other.healthRecordID == healthRecordID) &&
            (identical(other.defaultFacility, defaultFacility) ||
                other.defaultFacility == defaultFacility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      active,
      counselled,
      const DeepCollectionEquality().hash(_clientTypes),
      facilityID,
      treatmentEnrollmentDate,
      treatmentBuddy,
      user,
      chvUserID,
      chvUserName,
      cccNumber,
      fhirPatientID,
      healthRecordID,
      defaultFacility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientProfileCopyWith<_$_ClientProfile> get copyWith =>
      __$$_ClientProfileCopyWithImpl<_$_ClientProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientProfileToJson(
      this,
    );
  }
}

abstract class _ClientProfile implements ClientProfile {
  factory _ClientProfile(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'ClientCounselled', defaultValue: false)
          final bool? counselled,
      @JsonKey(name: 'ClientTypes')
          final List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID')
          final String? facilityID,
      @JsonKey(name: 'TreatmentEnrollmentDate')
          final String? treatmentEnrollmentDate,
      @JsonKey(name: 'TreatmentBuddy')
          final String? treatmentBuddy,
      @JsonKey(name: 'User')
          final User? user,
      @JsonKey(name: 'ChvUserID')
          final String? chvUserID,
      @JsonKey(name: 'ChvUserName')
          final String? chvUserName,
      @JsonKey(name: 'CCCNumber')
          final String? cccNumber,
      @JsonKey(name: 'FhirPatientID')
          final String? fhirPatientID,
      @JsonKey(name: 'HealthRecordID')
          final String? healthRecordID,
      @JsonKey(name: 'DefaultFacility')
          final Facility? defaultFacility}) = _$_ClientProfile;

  factory _ClientProfile.fromJson(Map<String, dynamic> json) =
      _$_ClientProfile.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'ClientCounselled', defaultValue: false)
  bool? get counselled;
  @override
  @JsonKey(name: 'ClientTypes')
  List<ClientType>? get clientTypes;
  @override
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID;
  @override
  @JsonKey(name: 'TreatmentEnrollmentDate')
  String? get treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'TreatmentBuddy')
  String? get treatmentBuddy;
  @override
  @JsonKey(name: 'User')
  User? get user;
  @override
  @JsonKey(name: 'ChvUserID')
  String? get chvUserID;
  @override
  @JsonKey(name: 'ChvUserName')
  String? get chvUserName;
  @override
  @JsonKey(name: 'CCCNumber')
  String? get cccNumber;
  @override
  @JsonKey(name: 'FhirPatientID')
  String? get fhirPatientID;
  @override
  @JsonKey(name: 'HealthRecordID')
  String? get healthRecordID;
  @override
  @JsonKey(name: 'DefaultFacility')
  Facility? get defaultFacility;
  @override
  @JsonKey(ignore: true)
  _$$_ClientProfileCopyWith<_$_ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
