// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_node_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadNodeData _$ViralLoadNodeDataFromJson(Map<String, dynamic> json) {
  return _ViralLoadNodeData.fromJson(json);
}

/// @nodoc
mixin _$ViralLoadNodeData {
  @JsonKey(name: 'Status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueString')
  String? get valueString => throw _privateConstructorUsedError;
  @JsonKey(name: 'EffectiveInstant')
  String? get effectiveInstant => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  ViralLoadCode? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadNodeDataCopyWith<ViralLoadNodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadNodeDataCopyWith<$Res> {
  factory $ViralLoadNodeDataCopyWith(
          ViralLoadNodeData value, $Res Function(ViralLoadNodeData) then) =
      _$ViralLoadNodeDataCopyWithImpl<$Res, ViralLoadNodeData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Status') String? status,
      @JsonKey(name: 'ValueString') String? valueString,
      @JsonKey(name: 'EffectiveInstant') String? effectiveInstant,
      @JsonKey(name: 'Code') ViralLoadCode? code});

  $ViralLoadCodeCopyWith<$Res>? get code;
}

/// @nodoc
class _$ViralLoadNodeDataCopyWithImpl<$Res, $Val extends ViralLoadNodeData>
    implements $ViralLoadNodeDataCopyWith<$Res> {
  _$ViralLoadNodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? valueString = freezed,
    Object? effectiveInstant = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      valueString: freezed == valueString
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveInstant: freezed == effectiveInstant
          ? _value.effectiveInstant
          : effectiveInstant // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as ViralLoadCode?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViralLoadCodeCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $ViralLoadCodeCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViralLoadNodeDataCopyWith<$Res>
    implements $ViralLoadNodeDataCopyWith<$Res> {
  factory _$$_ViralLoadNodeDataCopyWith(_$_ViralLoadNodeData value,
          $Res Function(_$_ViralLoadNodeData) then) =
      __$$_ViralLoadNodeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Status') String? status,
      @JsonKey(name: 'ValueString') String? valueString,
      @JsonKey(name: 'EffectiveInstant') String? effectiveInstant,
      @JsonKey(name: 'Code') ViralLoadCode? code});

  @override
  $ViralLoadCodeCopyWith<$Res>? get code;
}

/// @nodoc
class __$$_ViralLoadNodeDataCopyWithImpl<$Res>
    extends _$ViralLoadNodeDataCopyWithImpl<$Res, _$_ViralLoadNodeData>
    implements _$$_ViralLoadNodeDataCopyWith<$Res> {
  __$$_ViralLoadNodeDataCopyWithImpl(
      _$_ViralLoadNodeData _value, $Res Function(_$_ViralLoadNodeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? valueString = freezed,
    Object? effectiveInstant = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_ViralLoadNodeData(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      valueString: freezed == valueString
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveInstant: freezed == effectiveInstant
          ? _value.effectiveInstant
          : effectiveInstant // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as ViralLoadCode?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadNodeData implements _ViralLoadNodeData {
  _$_ViralLoadNodeData(
      {@JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'ValueString') this.valueString,
      @JsonKey(name: 'EffectiveInstant') this.effectiveInstant,
      @JsonKey(name: 'Code') this.code});

  factory _$_ViralLoadNodeData.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadNodeDataFromJson(json);

  @override
  @JsonKey(name: 'Status')
  final String? status;
  @override
  @JsonKey(name: 'ValueString')
  final String? valueString;
  @override
  @JsonKey(name: 'EffectiveInstant')
  final String? effectiveInstant;
  @override
  @JsonKey(name: 'Code')
  final ViralLoadCode? code;

  @override
  String toString() {
    return 'ViralLoadNodeData(status: $status, valueString: $valueString, effectiveInstant: $effectiveInstant, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViralLoadNodeData &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.valueString, valueString) ||
                other.valueString == valueString) &&
            (identical(other.effectiveInstant, effectiveInstant) ||
                other.effectiveInstant == effectiveInstant) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, valueString, effectiveInstant, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViralLoadNodeDataCopyWith<_$_ViralLoadNodeData> get copyWith =>
      __$$_ViralLoadNodeDataCopyWithImpl<_$_ViralLoadNodeData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadNodeDataToJson(
      this,
    );
  }
}

abstract class _ViralLoadNodeData implements ViralLoadNodeData {
  factory _ViralLoadNodeData(
      {@JsonKey(name: 'Status') final String? status,
      @JsonKey(name: 'ValueString') final String? valueString,
      @JsonKey(name: 'EffectiveInstant') final String? effectiveInstant,
      @JsonKey(name: 'Code') final ViralLoadCode? code}) = _$_ViralLoadNodeData;

  factory _ViralLoadNodeData.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadNodeData.fromJson;

  @override
  @JsonKey(name: 'Status')
  String? get status;
  @override
  @JsonKey(name: 'ValueString')
  String? get valueString;
  @override
  @JsonKey(name: 'EffectiveInstant')
  String? get effectiveInstant;
  @override
  @JsonKey(name: 'Code')
  ViralLoadCode? get code;
  @override
  @JsonKey(ignore: true)
  _$$_ViralLoadNodeDataCopyWith<_$_ViralLoadNodeData> get copyWith =>
      throw _privateConstructorUsedError;
}
