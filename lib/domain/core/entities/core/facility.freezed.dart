// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Facility _$FacilityFromJson(Map<String, dynamic> json) {
  return _Facility.fromJson(json);
}

/// @nodoc
mixin _$Facility {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'fhirOrganisationID')
  String? get fhirOrganisationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'workStationDetails')
  WorkStationDetails? get workStationDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityCopyWith<Facility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityCopyWith<$Res> {
  factory $FacilityCopyWith(Facility value, $Res Function(Facility) then) =
      _$FacilityCopyWithImpl<$Res, Facility>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'code')
          int? code,
      @JsonKey(name: 'phone')
          String? phone,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'county')
          String? county,
      @JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'fhirOrganisationID')
          String? fhirOrganisationID,
      @JsonKey(name: 'workStationDetails')
          WorkStationDetails? workStationDetails});

  $WorkStationDetailsCopyWith<$Res>? get workStationDetails;
}

/// @nodoc
class _$FacilityCopyWithImpl<$Res, $Val extends Facility>
    implements $FacilityCopyWith<$Res> {
  _$FacilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? phone = freezed,
    Object? active = freezed,
    Object? county = freezed,
    Object? description = freezed,
    Object? fhirOrganisationID = freezed,
    Object? workStationDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      fhirOrganisationID: freezed == fhirOrganisationID
          ? _value.fhirOrganisationID
          : fhirOrganisationID // ignore: cast_nullable_to_non_nullable
              as String?,
      workStationDetails: freezed == workStationDetails
          ? _value.workStationDetails
          : workStationDetails // ignore: cast_nullable_to_non_nullable
              as WorkStationDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkStationDetailsCopyWith<$Res>? get workStationDetails {
    if (_value.workStationDetails == null) {
      return null;
    }

    return $WorkStationDetailsCopyWith<$Res>(_value.workStationDetails!,
        (value) {
      return _then(_value.copyWith(workStationDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacilityCopyWith<$Res> implements $FacilityCopyWith<$Res> {
  factory _$$_FacilityCopyWith(
          _$_Facility value, $Res Function(_$_Facility) then) =
      __$$_FacilityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'code')
          int? code,
      @JsonKey(name: 'phone')
          String? phone,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'county')
          String? county,
      @JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'fhirOrganisationID')
          String? fhirOrganisationID,
      @JsonKey(name: 'workStationDetails')
          WorkStationDetails? workStationDetails});

  @override
  $WorkStationDetailsCopyWith<$Res>? get workStationDetails;
}

/// @nodoc
class __$$_FacilityCopyWithImpl<$Res>
    extends _$FacilityCopyWithImpl<$Res, _$_Facility>
    implements _$$_FacilityCopyWith<$Res> {
  __$$_FacilityCopyWithImpl(
      _$_Facility _value, $Res Function(_$_Facility) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? phone = freezed,
    Object? active = freezed,
    Object? county = freezed,
    Object? description = freezed,
    Object? fhirOrganisationID = freezed,
    Object? workStationDetails = freezed,
  }) {
    return _then(_$_Facility(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      fhirOrganisationID: freezed == fhirOrganisationID
          ? _value.fhirOrganisationID
          : fhirOrganisationID // ignore: cast_nullable_to_non_nullable
              as String?,
      workStationDetails: freezed == workStationDetails
          ? _value.workStationDetails
          : workStationDetails // ignore: cast_nullable_to_non_nullable
              as WorkStationDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Facility implements _Facility {
  _$_Facility(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'county') this.county,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'fhirOrganisationID') this.fhirOrganisationID,
      @JsonKey(name: 'workStationDetails') this.workStationDetails});

  factory _$_Facility.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'county')
  final String? county;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'fhirOrganisationID')
  final String? fhirOrganisationID;
  @override
  @JsonKey(name: 'workStationDetails')
  final WorkStationDetails? workStationDetails;

  @override
  String toString() {
    return 'Facility(id: $id, name: $name, code: $code, phone: $phone, active: $active, county: $county, description: $description, fhirOrganisationID: $fhirOrganisationID, workStationDetails: $workStationDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Facility &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fhirOrganisationID, fhirOrganisationID) ||
                other.fhirOrganisationID == fhirOrganisationID) &&
            (identical(other.workStationDetails, workStationDetails) ||
                other.workStationDetails == workStationDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, phone, active,
      county, description, fhirOrganisationID, workStationDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityCopyWith<_$_Facility> get copyWith =>
      __$$_FacilityCopyWithImpl<_$_Facility>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityToJson(
      this,
    );
  }
}

abstract class _Facility implements Facility {
  factory _Facility(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'code')
          final int? code,
      @JsonKey(name: 'phone')
          final String? phone,
      @JsonKey(name: 'active')
          final bool? active,
      @JsonKey(name: 'county')
          final String? county,
      @JsonKey(name: 'description')
          final String? description,
      @JsonKey(name: 'fhirOrganisationID')
          final String? fhirOrganisationID,
      @JsonKey(name: 'workStationDetails')
          final WorkStationDetails? workStationDetails}) = _$_Facility;

  factory _Facility.fromJson(Map<String, dynamic> json) = _$_Facility.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'county')
  String? get county;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'fhirOrganisationID')
  String? get fhirOrganisationID;
  @override
  @JsonKey(name: 'workStationDetails')
  WorkStationDetails? get workStationDetails;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityCopyWith<_$_Facility> get copyWith =>
      throw _privateConstructorUsedError;
}
