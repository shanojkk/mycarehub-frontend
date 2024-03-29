// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataDetails _$MedicalDataDetailsFromJson(Map<String, dynamic> json) {
  return _MedicalDataDetails.fromJson(json);
}

/// @nodoc
mixin _$MedicalDataDetails {
  @JsonKey(name: 'ValueString')
  String? get valueString => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  MedicalDataCode? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  MedicalDataCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'MedicationCodeableConcept')
  MedicationCodeableConcept? get medicationCodeableConcept =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataDetailsCopyWith<MedicalDataDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataDetailsCopyWith<$Res> {
  factory $MedicalDataDetailsCopyWith(
          MedicalDataDetails value, $Res Function(MedicalDataDetails) then) =
      _$MedicalDataDetailsCopyWithImpl<$Res, MedicalDataDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ValueString')
          String? valueString,
      @JsonKey(name: 'Code')
          MedicalDataCode? code,
      @JsonKey(name: 'Category')
          MedicalDataCategory? category,
      @JsonKey(name: 'MedicationCodeableConcept')
          MedicationCodeableConcept? medicationCodeableConcept});

  $MedicalDataCodeCopyWith<$Res>? get code;
  $MedicalDataCategoryCopyWith<$Res>? get category;
  $MedicationCodeableConceptCopyWith<$Res>? get medicationCodeableConcept;
}

/// @nodoc
class _$MedicalDataDetailsCopyWithImpl<$Res, $Val extends MedicalDataDetails>
    implements $MedicalDataDetailsCopyWith<$Res> {
  _$MedicalDataDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueString = freezed,
    Object? code = freezed,
    Object? category = freezed,
    Object? medicationCodeableConcept = freezed,
  }) {
    return _then(_value.copyWith(
      valueString: freezed == valueString
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as MedicalDataCode?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MedicalDataCategory?,
      medicationCodeableConcept: freezed == medicationCodeableConcept
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as MedicationCodeableConcept?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicalDataCodeCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $MedicalDataCodeCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicalDataCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $MedicalDataCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicationCodeableConceptCopyWith<$Res>? get medicationCodeableConcept {
    if (_value.medicationCodeableConcept == null) {
      return null;
    }

    return $MedicationCodeableConceptCopyWith<$Res>(
        _value.medicationCodeableConcept!, (value) {
      return _then(_value.copyWith(medicationCodeableConcept: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicalDataDetailsCopyWith<$Res>
    implements $MedicalDataDetailsCopyWith<$Res> {
  factory _$$_MedicalDataDetailsCopyWith(_$_MedicalDataDetails value,
          $Res Function(_$_MedicalDataDetails) then) =
      __$$_MedicalDataDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ValueString')
          String? valueString,
      @JsonKey(name: 'Code')
          MedicalDataCode? code,
      @JsonKey(name: 'Category')
          MedicalDataCategory? category,
      @JsonKey(name: 'MedicationCodeableConcept')
          MedicationCodeableConcept? medicationCodeableConcept});

  @override
  $MedicalDataCodeCopyWith<$Res>? get code;
  @override
  $MedicalDataCategoryCopyWith<$Res>? get category;
  @override
  $MedicationCodeableConceptCopyWith<$Res>? get medicationCodeableConcept;
}

/// @nodoc
class __$$_MedicalDataDetailsCopyWithImpl<$Res>
    extends _$MedicalDataDetailsCopyWithImpl<$Res, _$_MedicalDataDetails>
    implements _$$_MedicalDataDetailsCopyWith<$Res> {
  __$$_MedicalDataDetailsCopyWithImpl(
      _$_MedicalDataDetails _value, $Res Function(_$_MedicalDataDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueString = freezed,
    Object? code = freezed,
    Object? category = freezed,
    Object? medicationCodeableConcept = freezed,
  }) {
    return _then(_$_MedicalDataDetails(
      valueString: freezed == valueString
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as MedicalDataCode?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MedicalDataCategory?,
      medicationCodeableConcept: freezed == medicationCodeableConcept
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as MedicationCodeableConcept?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataDetails implements _MedicalDataDetails {
  _$_MedicalDataDetails(
      {@JsonKey(name: 'ValueString')
          this.valueString,
      @JsonKey(name: 'Code')
          this.code,
      @JsonKey(name: 'Category')
          this.category,
      @JsonKey(name: 'MedicationCodeableConcept')
          this.medicationCodeableConcept});

  factory _$_MedicalDataDetails.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataDetailsFromJson(json);

  @override
  @JsonKey(name: 'ValueString')
  final String? valueString;
  @override
  @JsonKey(name: 'Code')
  final MedicalDataCode? code;
  @override
  @JsonKey(name: 'Category')
  final MedicalDataCategory? category;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  final MedicationCodeableConcept? medicationCodeableConcept;

  @override
  String toString() {
    return 'MedicalDataDetails(valueString: $valueString, code: $code, category: $category, medicationCodeableConcept: $medicationCodeableConcept)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicalDataDetails &&
            (identical(other.valueString, valueString) ||
                other.valueString == valueString) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.medicationCodeableConcept,
                    medicationCodeableConcept) ||
                other.medicationCodeableConcept == medicationCodeableConcept));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, valueString, code, category, medicationCodeableConcept);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicalDataDetailsCopyWith<_$_MedicalDataDetails> get copyWith =>
      __$$_MedicalDataDetailsCopyWithImpl<_$_MedicalDataDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataDetailsToJson(
      this,
    );
  }
}

abstract class _MedicalDataDetails implements MedicalDataDetails {
  factory _MedicalDataDetails(
          {@JsonKey(name: 'ValueString')
              final String? valueString,
          @JsonKey(name: 'Code')
              final MedicalDataCode? code,
          @JsonKey(name: 'Category')
              final MedicalDataCategory? category,
          @JsonKey(name: 'MedicationCodeableConcept')
              final MedicationCodeableConcept? medicationCodeableConcept}) =
      _$_MedicalDataDetails;

  factory _MedicalDataDetails.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataDetails.fromJson;

  @override
  @JsonKey(name: 'ValueString')
  String? get valueString;
  @override
  @JsonKey(name: 'Code')
  MedicalDataCode? get code;
  @override
  @JsonKey(name: 'Category')
  MedicalDataCategory? get category;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  MedicationCodeableConcept? get medicationCodeableConcept;
  @override
  @JsonKey(ignore: true)
  _$$_MedicalDataDetailsCopyWith<_$_MedicalDataDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
