// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendOTPResponse _$SendOTPResponseFromJson(Map<String, dynamic> json) {
  return _SendOTPResponse.fromJson(json);
}

/// @nodoc
mixin _$SendOTPResponse {
  @JsonKey(name: 'otp')
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendOTPResponseCopyWith<SendOTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOTPResponseCopyWith<$Res> {
  factory $SendOTPResponseCopyWith(
          SendOTPResponse value, $Res Function(SendOTPResponse) then) =
      _$SendOTPResponseCopyWithImpl<$Res, SendOTPResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'otp') String? otp,
      @JsonKey(name: 'phoneNumber') String? phoneNumber});
}

/// @nodoc
class _$SendOTPResponseCopyWithImpl<$Res, $Val extends SendOTPResponse>
    implements $SendOTPResponseCopyWith<$Res> {
  _$SendOTPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendOTPResponseCopyWith<$Res>
    implements $SendOTPResponseCopyWith<$Res> {
  factory _$$_SendOTPResponseCopyWith(
          _$_SendOTPResponse value, $Res Function(_$_SendOTPResponse) then) =
      __$$_SendOTPResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'otp') String? otp,
      @JsonKey(name: 'phoneNumber') String? phoneNumber});
}

/// @nodoc
class __$$_SendOTPResponseCopyWithImpl<$Res>
    extends _$SendOTPResponseCopyWithImpl<$Res, _$_SendOTPResponse>
    implements _$$_SendOTPResponseCopyWith<$Res> {
  __$$_SendOTPResponseCopyWithImpl(
      _$_SendOTPResponse _value, $Res Function(_$_SendOTPResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_SendOTPResponse(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendOTPResponse implements _SendOTPResponse {
  _$_SendOTPResponse(
      {@JsonKey(name: 'otp') this.otp,
      @JsonKey(name: 'phoneNumber') this.phoneNumber});

  factory _$_SendOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SendOTPResponseFromJson(json);

  @override
  @JsonKey(name: 'otp')
  final String? otp;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;

  @override
  String toString() {
    return 'SendOTPResponse(otp: $otp, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendOTPResponse &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, otp, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendOTPResponseCopyWith<_$_SendOTPResponse> get copyWith =>
      __$$_SendOTPResponseCopyWithImpl<_$_SendOTPResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendOTPResponseToJson(
      this,
    );
  }
}

abstract class _SendOTPResponse implements SendOTPResponse {
  factory _SendOTPResponse(
          {@JsonKey(name: 'otp') final String? otp,
          @JsonKey(name: 'phoneNumber') final String? phoneNumber}) =
      _$_SendOTPResponse;

  factory _SendOTPResponse.fromJson(Map<String, dynamic> json) =
      _$_SendOTPResponse.fromJson;

  @override
  @JsonKey(name: 'otp')
  String? get otp;
  @override
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_SendOTPResponseCopyWith<_$_SendOTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
