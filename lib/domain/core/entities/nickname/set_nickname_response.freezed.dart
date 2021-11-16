// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'set_nickname_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetNicknameResponse _$SetNicknameResponseFromJson(Map<String, dynamic> json) {
  return _SetNicknameResponse.fromJson(json);
}

/// @nodoc
class _$SetNicknameResponseTearOff {
  const _$SetNicknameResponseTearOff();

  _SetNicknameResponse call(
      {@JsonKey(name: 'setNickName') required bool acceptTerms}) {
    return _SetNicknameResponse(
      acceptTerms: acceptTerms,
    );
  }

  SetNicknameResponse fromJson(Map<String, Object> json) {
    return SetNicknameResponse.fromJson(json);
  }
}

/// @nodoc
const $SetNicknameResponse = _$SetNicknameResponseTearOff();

/// @nodoc
mixin _$SetNicknameResponse {
  @JsonKey(name: 'setNickName')
  bool get acceptTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetNicknameResponseCopyWith<SetNicknameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetNicknameResponseCopyWith<$Res> {
  factory $SetNicknameResponseCopyWith(
          SetNicknameResponse value, $Res Function(SetNicknameResponse) then) =
      _$SetNicknameResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'setNickName') bool acceptTerms});
}

/// @nodoc
class _$SetNicknameResponseCopyWithImpl<$Res>
    implements $SetNicknameResponseCopyWith<$Res> {
  _$SetNicknameResponseCopyWithImpl(this._value, this._then);

  final SetNicknameResponse _value;
  // ignore: unused_field
  final $Res Function(SetNicknameResponse) _then;

  @override
  $Res call({
    Object? acceptTerms = freezed,
  }) {
    return _then(_value.copyWith(
      acceptTerms: acceptTerms == freezed
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SetNicknameResponseCopyWith<$Res>
    implements $SetNicknameResponseCopyWith<$Res> {
  factory _$SetNicknameResponseCopyWith(_SetNicknameResponse value,
          $Res Function(_SetNicknameResponse) then) =
      __$SetNicknameResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'setNickName') bool acceptTerms});
}

/// @nodoc
class __$SetNicknameResponseCopyWithImpl<$Res>
    extends _$SetNicknameResponseCopyWithImpl<$Res>
    implements _$SetNicknameResponseCopyWith<$Res> {
  __$SetNicknameResponseCopyWithImpl(
      _SetNicknameResponse _value, $Res Function(_SetNicknameResponse) _then)
      : super(_value, (v) => _then(v as _SetNicknameResponse));

  @override
  _SetNicknameResponse get _value => super._value as _SetNicknameResponse;

  @override
  $Res call({
    Object? acceptTerms = freezed,
  }) {
    return _then(_SetNicknameResponse(
      acceptTerms: acceptTerms == freezed
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetNicknameResponse implements _SetNicknameResponse {
  _$_SetNicknameResponse(
      {@JsonKey(name: 'setNickName') required this.acceptTerms});

  factory _$_SetNicknameResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SetNicknameResponseFromJson(json);

  @override
  @JsonKey(name: 'setNickName')
  final bool acceptTerms;

  @override
  String toString() {
    return 'SetNicknameResponse(acceptTerms: $acceptTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetNicknameResponse &&
            (identical(other.acceptTerms, acceptTerms) ||
                const DeepCollectionEquality()
                    .equals(other.acceptTerms, acceptTerms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(acceptTerms);

  @JsonKey(ignore: true)
  @override
  _$SetNicknameResponseCopyWith<_SetNicknameResponse> get copyWith =>
      __$SetNicknameResponseCopyWithImpl<_SetNicknameResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SetNicknameResponseToJson(this);
  }
}

abstract class _SetNicknameResponse implements SetNicknameResponse {
  factory _SetNicknameResponse(
          {@JsonKey(name: 'setNickName') required bool acceptTerms}) =
      _$_SetNicknameResponse;

  factory _SetNicknameResponse.fromJson(Map<String, dynamic> json) =
      _$_SetNicknameResponse.fromJson;

  @override
  @JsonKey(name: 'setNickName')
  bool get acceptTerms => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SetNicknameResponseCopyWith<_SetNicknameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
