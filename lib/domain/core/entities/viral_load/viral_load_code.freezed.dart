// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadCode _$ViralLoadCodeFromJson(Map<String, dynamic> json) {
  return _ViralLoadCode.fromJson(json);
}

/// @nodoc
mixin _$ViralLoadCode {
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadCodeCopyWith<ViralLoadCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadCodeCopyWith<$Res> {
  factory $ViralLoadCodeCopyWith(
          ViralLoadCode value, $Res Function(ViralLoadCode) then) =
      _$ViralLoadCodeCopyWithImpl<$Res, ViralLoadCode>;
  @useResult
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class _$ViralLoadCodeCopyWithImpl<$Res, $Val extends ViralLoadCode>
    implements $ViralLoadCodeCopyWith<$Res> {
  _$ViralLoadCodeCopyWithImpl(this._value, this._then);

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
abstract class _$$_ViralLoadCodeCopyWith<$Res>
    implements $ViralLoadCodeCopyWith<$Res> {
  factory _$$_ViralLoadCodeCopyWith(
          _$_ViralLoadCode value, $Res Function(_$_ViralLoadCode) then) =
      __$$_ViralLoadCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Text') String? text});
}

/// @nodoc
class __$$_ViralLoadCodeCopyWithImpl<$Res>
    extends _$ViralLoadCodeCopyWithImpl<$Res, _$_ViralLoadCode>
    implements _$$_ViralLoadCodeCopyWith<$Res> {
  __$$_ViralLoadCodeCopyWithImpl(
      _$_ViralLoadCode _value, $Res Function(_$_ViralLoadCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ViralLoadCode(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadCode implements _ViralLoadCode {
  _$_ViralLoadCode({@JsonKey(name: 'Text') this.text});

  factory _$_ViralLoadCode.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadCodeFromJson(json);

  @override
  @JsonKey(name: 'Text')
  final String? text;

  @override
  String toString() {
    return 'ViralLoadCode(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViralLoadCode &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViralLoadCodeCopyWith<_$_ViralLoadCode> get copyWith =>
      __$$_ViralLoadCodeCopyWithImpl<_$_ViralLoadCode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadCodeToJson(
      this,
    );
  }
}

abstract class _ViralLoadCode implements ViralLoadCode {
  factory _ViralLoadCode({@JsonKey(name: 'Text') final String? text}) =
      _$_ViralLoadCode;

  factory _ViralLoadCode.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadCode.fromJson;

  @override
  @JsonKey(name: 'Text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_ViralLoadCodeCopyWith<_$_ViralLoadCode> get copyWith =>
      throw _privateConstructorUsedError;
}
