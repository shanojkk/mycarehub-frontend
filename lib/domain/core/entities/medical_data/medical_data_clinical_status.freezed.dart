// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medical_data_clinical_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDataCode _$MedicalDataCodeFromJson(Map<String, dynamic> json) {
  return _MedicalDataCode.fromJson(json);
}

/// @nodoc
mixin _$MedicalDataCode {
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDataCodeCopyWith<MedicalDataCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDataCodeCopyWith<$Res> {
  factory $MedicalDataCodeCopyWith(
          MedicalDataCode value, $Res Function(MedicalDataCode) then) =
      _$MedicalDataCodeCopyWithImpl<$Res, MedicalDataCode>;
  @useResult
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$MedicalDataCodeCopyWithImpl<$Res, $Val extends MedicalDataCode>
    implements $MedicalDataCodeCopyWith<$Res> {
  _$MedicalDataCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicalDataCodeCopyWith<$Res>
    implements $MedicalDataCodeCopyWith<$Res> {
  factory _$$_MedicalDataCodeCopyWith(
          _$_MedicalDataCode value, $Res Function(_$_MedicalDataCode) then) =
      __$$_MedicalDataCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$$_MedicalDataCodeCopyWithImpl<$Res>
    extends _$MedicalDataCodeCopyWithImpl<$Res, _$_MedicalDataCode>
    implements _$$_MedicalDataCodeCopyWith<$Res> {
  __$$_MedicalDataCodeCopyWithImpl(
      _$_MedicalDataCode _value, $Res Function(_$_MedicalDataCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_MedicalDataCode(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicalDataCode implements _MedicalDataCode {
  _$_MedicalDataCode({@JsonKey(name: 'Text') this.text});

  factory _$_MedicalDataCode.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDataCodeFromJson(json);

  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'MedicalDataCode(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicalDataCode &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicalDataCodeCopyWith<_$_MedicalDataCode> get copyWith =>
      __$$_MedicalDataCodeCopyWithImpl<_$_MedicalDataCode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDataCodeToJson(
      this,
    );
  }
}

abstract class _MedicalDataCode implements MedicalDataCode {
  factory _MedicalDataCode({@JsonKey(name: 'Text') final String? text}) =
      _$_MedicalDataCode;

  factory _MedicalDataCode.fromJson(Map<String, dynamic> json) =
      _$_MedicalDataCode.fromJson;

  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_MedicalDataCodeCopyWith<_$_MedicalDataCode> get copyWith =>
      throw _privateConstructorUsedError;
}
