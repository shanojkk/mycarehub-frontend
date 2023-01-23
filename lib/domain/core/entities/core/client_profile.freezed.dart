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
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'chvUserID')
  String? get chvUserID => throw _privateConstructorUsedError;
  @JsonKey(name: 'chvUserName')
  String? get chvUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cccNumber')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'fhirPatientID')
  String? get fhirPatientID => throw _privateConstructorUsedError;
  @JsonKey(name: 'healthRecordID')
  String? get healthRecordID => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverID')
  String? get caregiverID => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacility')
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'clientCounselled', defaultValue: false) bool? counselled,
      @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID') String? facilityID,
      @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'chvUserID') String? chvUserID,
      @JsonKey(name: 'chvUserName') String? chvUserName,
      @JsonKey(name: 'cccNumber') String? cccNumber,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      @JsonKey(name: 'healthRecordID') String? healthRecordID,
      @JsonKey(name: 'caregiverID') String? caregiverID,
      @JsonKey(name: 'defaultFacility') Facility? defaultFacility});

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
    Object? caregiverID = freezed,
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
      caregiverID: freezed == caregiverID
          ? _value.caregiverID
          : caregiverID // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'clientCounselled', defaultValue: false) bool? counselled,
      @JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID') String? facilityID,
      @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'chvUserID') String? chvUserID,
      @JsonKey(name: 'chvUserName') String? chvUserName,
      @JsonKey(name: 'cccNumber') String? cccNumber,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      @JsonKey(name: 'healthRecordID') String? healthRecordID,
      @JsonKey(name: 'caregiverID') String? caregiverID,
      @JsonKey(name: 'defaultFacility') Facility? defaultFacility});

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
    Object? caregiverID = freezed,
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
      caregiverID: freezed == caregiverID
          ? _value.caregiverID
          : caregiverID // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'clientCounselled', defaultValue: false) this.counselled,
      @JsonKey(name: 'clientTypes') final List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID') this.facilityID,
      @JsonKey(name: 'treatmentEnrollmentDate') this.treatmentEnrollmentDate,
      @JsonKey(name: 'treatmentBuddy') this.treatmentBuddy,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'chvUserID') this.chvUserID,
      @JsonKey(name: 'chvUserName') this.chvUserName,
      @JsonKey(name: 'cccNumber') this.cccNumber,
      @JsonKey(name: 'fhirPatientID') this.fhirPatientID,
      @JsonKey(name: 'healthRecordID') this.healthRecordID,
      @JsonKey(name: 'caregiverID') this.caregiverID,
      @JsonKey(name: 'defaultFacility') this.defaultFacility})
      : _clientTypes = clientTypes;

  factory _$_ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$$_ClientProfileFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'clientCounselled', defaultValue: false)
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
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  final String? treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'treatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'chvUserID')
  final String? chvUserID;
  @override
  @JsonKey(name: 'chvUserName')
  final String? chvUserName;
  @override
  @JsonKey(name: 'cccNumber')
  final String? cccNumber;
  @override
  @JsonKey(name: 'fhirPatientID')
  final String? fhirPatientID;
  @override
  @JsonKey(name: 'healthRecordID')
  final String? healthRecordID;
  @override
  @JsonKey(name: 'caregiverID')
  final String? caregiverID;
  @override
  @JsonKey(name: 'defaultFacility')
  final Facility? defaultFacility;

  @override
  String toString() {
    return 'ClientProfile(id: $id, active: $active, counselled: $counselled, clientTypes: $clientTypes, facilityID: $facilityID, treatmentEnrollmentDate: $treatmentEnrollmentDate, treatmentBuddy: $treatmentBuddy, user: $user, chvUserID: $chvUserID, chvUserName: $chvUserName, cccNumber: $cccNumber, fhirPatientID: $fhirPatientID, healthRecordID: $healthRecordID, caregiverID: $caregiverID, defaultFacility: $defaultFacility)';
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
            (identical(other.caregiverID, caregiverID) ||
                other.caregiverID == caregiverID) &&
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
      caregiverID,
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
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          final bool? counselled,
      @JsonKey(name: 'clientTypes')
          final List<ClientType>? clientTypes,
      @JsonKey(name: 'defaultFacilityID')
          final String? facilityID,
      @JsonKey(name: 'treatmentEnrollmentDate')
          final String? treatmentEnrollmentDate,
      @JsonKey(name: 'treatmentBuddy')
          final String? treatmentBuddy,
      @JsonKey(name: 'user')
          final User? user,
      @JsonKey(name: 'chvUserID')
          final String? chvUserID,
      @JsonKey(name: 'chvUserName')
          final String? chvUserName,
      @JsonKey(name: 'cccNumber')
          final String? cccNumber,
      @JsonKey(name: 'fhirPatientID')
          final String? fhirPatientID,
      @JsonKey(name: 'healthRecordID')
          final String? healthRecordID,
      @JsonKey(name: 'caregiverID')
          final String? caregiverID,
      @JsonKey(name: 'defaultFacility')
          final Facility? defaultFacility}) = _$_ClientProfile;

  factory _ClientProfile.fromJson(Map<String, dynamic> json) =
      _$_ClientProfile.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  bool? get counselled;
  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes;
  @override
  @JsonKey(name: 'defaultFacilityID')
  String? get facilityID;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy;
  @override
  @JsonKey(name: 'user')
  User? get user;
  @override
  @JsonKey(name: 'chvUserID')
  String? get chvUserID;
  @override
  @JsonKey(name: 'chvUserName')
  String? get chvUserName;
  @override
  @JsonKey(name: 'cccNumber')
  String? get cccNumber;
  @override
  @JsonKey(name: 'fhirPatientID')
  String? get fhirPatientID;
  @override
  @JsonKey(name: 'healthRecordID')
  String? get healthRecordID;
  @override
  @JsonKey(name: 'caregiverID')
  String? get caregiverID;
  @override
  @JsonKey(name: 'defaultFacility')
  Facility? get defaultFacility;
  @override
  @JsonKey(ignore: true)
  _$$_ClientProfileCopyWith<_$_ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
