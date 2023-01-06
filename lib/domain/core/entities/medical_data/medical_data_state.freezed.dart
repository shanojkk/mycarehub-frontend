// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataState _$MedicalDataStateFromJson(Map<String, dynamic> json) {
  return _MedicalDataState.fromJson(json);
}

/// @nodoc
mixin _$MedicalDataState {
  MedicalData? get medicalData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataStateCopyWith<MedicalDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataStateCopyWith<$Res> {
  factory $MedicalDataStateCopyWith(
          MedicalDataState value, $Res Function(MedicalDataState) then) =
      _$MedicalDataStateCopyWithImpl<$Res, MedicalDataState>;
  @useResult
  $Res call({MedicalData? medicalData});

  $MedicalDataCopyWith<$Res>? get medicalData;
}

/// @nodoc
class _$MedicalDataStateCopyWithImpl<$Res, $Val extends MedicalDataState>
    implements $MedicalDataStateCopyWith<$Res> {
  _$MedicalDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicalData = freezed,
  }) {
    return _then(_value.copyWith(
      medicalData: freezed == medicalData
          ? _value.medicalData
          : medicalData // ignore: cast_nullable_to_non_nullable
              as MedicalData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicalDataCopyWith<$Res>? get medicalData {
    if (_value.medicalData == null) {
      return null;
    }

    return $MedicalDataCopyWith<$Res>(_value.medicalData!, (value) {
      return _then(_value.copyWith(medicalData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicalDataStateCopyWith<$Res>
    implements $MedicalDataStateCopyWith<$Res> {
  factory _$$_MedicalDataStateCopyWith(
          _$_MedicalDataState value, $Res Function(_$_MedicalDataState) then) =
      __$$_MedicalDataStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MedicalData? medicalData});

  @override
  $MedicalDataCopyWith<$Res>? get medicalData;
}

/// @nodoc
class __$$_MedicalDataStateCopyWithImpl<$Res>
    extends _$MedicalDataStateCopyWithImpl<$Res, _$_MedicalDataState>
    implements _$$_MedicalDataStateCopyWith<$Res> {
  __$$_MedicalDataStateCopyWithImpl(
      _$_MedicalDataState _value, $Res Function(_$_MedicalDataState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicalData = freezed,
  }) {
    return _then(_$_MedicalDataState(
      medicalData: freezed == medicalData
          ? _value.medicalData
          : medicalData // ignore: cast_nullable_to_non_nullable
              as MedicalData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataState implements _MedicalDataState {
  _$_MedicalDataState({this.medicalData});

  factory _$_MedicalDataState.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataStateFromJson(json);

  @override
  final MedicalData? medicalData;

  @override
  String toString() {
    return 'MedicalDataState(medicalData: $medicalData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicalDataState &&
            (identical(other.medicalData, medicalData) ||
                other.medicalData == medicalData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, medicalData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicalDataStateCopyWith<_$_MedicalDataState> get copyWith =>
      __$$_MedicalDataStateCopyWithImpl<_$_MedicalDataState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataStateToJson(
      this,
    );
  }
}

abstract class _MedicalDataState implements MedicalDataState {
  factory _MedicalDataState({final MedicalData? medicalData}) =
      _$_MedicalDataState;

  factory _MedicalDataState.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataState.fromJson;

  @override
  MedicalData? get medicalData;
  @override
  @JsonKey(ignore: true)
  _$$_MedicalDataStateCopyWith<_$_MedicalDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
