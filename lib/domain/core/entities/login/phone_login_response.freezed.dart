// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLoginResponse _$PhoneLoginResponseFromJson(Map<String, dynamic> json) {
  return _PhoneLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$PhoneLoginResponse {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'response')
  UserResponse? get userResponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginResponseCopyWith<PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginResponseCopyWith<$Res> {
  factory $PhoneLoginResponseCopyWith(
          PhoneLoginResponse value, $Res Function(PhoneLoginResponse) then) =
      _$PhoneLoginResponseCopyWithImpl<$Res, PhoneLoginResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'response') UserResponse? userResponse});

  $UserResponseCopyWith<$Res>? get userResponse;
}

/// @nodoc
class _$PhoneLoginResponseCopyWithImpl<$Res, $Val extends PhoneLoginResponse>
    implements $PhoneLoginResponseCopyWith<$Res> {
  _$PhoneLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? userResponse = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userResponse: freezed == userResponse
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get userResponse {
    if (_value.userResponse == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.userResponse!, (value) {
      return _then(_value.copyWith(userResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PhoneLoginResponseCopyWith<$Res>
    implements $PhoneLoginResponseCopyWith<$Res> {
  factory _$$_PhoneLoginResponseCopyWith(_$_PhoneLoginResponse value,
          $Res Function(_$_PhoneLoginResponse) then) =
      __$$_PhoneLoginResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'response') UserResponse? userResponse});

  @override
  $UserResponseCopyWith<$Res>? get userResponse;
}

/// @nodoc
class __$$_PhoneLoginResponseCopyWithImpl<$Res>
    extends _$PhoneLoginResponseCopyWithImpl<$Res, _$_PhoneLoginResponse>
    implements _$$_PhoneLoginResponseCopyWith<$Res> {
  __$$_PhoneLoginResponseCopyWithImpl(
      _$_PhoneLoginResponse _value, $Res Function(_$_PhoneLoginResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? userResponse = freezed,
  }) {
    return _then(_$_PhoneLoginResponse(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userResponse: freezed == userResponse
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLoginResponse implements _PhoneLoginResponse {
  _$_PhoneLoginResponse(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'response') this.userResponse});

  factory _$_PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneLoginResponseFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'response')
  final UserResponse? userResponse;

  @override
  String toString() {
    return 'PhoneLoginResponse(code: $code, message: $message, userResponse: $userResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneLoginResponse &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userResponse, userResponse) ||
                other.userResponse == userResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, userResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneLoginResponseCopyWith<_$_PhoneLoginResponse> get copyWith =>
      __$$_PhoneLoginResponseCopyWithImpl<_$_PhoneLoginResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneLoginResponseToJson(
      this,
    );
  }
}

abstract class _PhoneLoginResponse implements PhoneLoginResponse {
  factory _PhoneLoginResponse(
          {@JsonKey(name: 'code') final int? code,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'response') final UserResponse? userResponse}) =
      _$_PhoneLoginResponse;

  factory _PhoneLoginResponse.fromJson(Map<String, dynamic> json) =
      _$_PhoneLoginResponse.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'response')
  UserResponse? get userResponse;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneLoginResponseCopyWith<_$_PhoneLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
