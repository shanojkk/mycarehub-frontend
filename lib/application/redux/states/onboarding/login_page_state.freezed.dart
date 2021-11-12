// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginPageState _$LoginPageStateFromJson(Map<String, dynamic> json) {
  return _LoginPageState.fromJson(json);
}

/// @nodoc
class _$LoginPageStateTearOff {
  const _$LoginPageStateTearOff();

  _LoginPageState call(
      {String? phoneNumber, String? pinCode, bool invalidCredentials = false}) {
    return _LoginPageState(
      phoneNumber: phoneNumber,
      pinCode: pinCode,
      invalidCredentials: invalidCredentials,
    );
  }

  LoginPageState fromJson(Map<String, Object> json) {
    return LoginPageState.fromJson(json);
  }
}

/// @nodoc
const $LoginPageState = _$LoginPageStateTearOff();

/// @nodoc
mixin _$LoginPageState {
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;
  bool get invalidCredentials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res>;
  $Res call({String? phoneNumber, String? pinCode, bool invalidCredentials});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  final LoginPageState _value;
  // ignore: unused_field
  final $Res Function(LoginPageState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
    Object? invalidCredentials = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoginPageStateCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$LoginPageStateCopyWith(
          _LoginPageState value, $Res Function(_LoginPageState) then) =
      __$LoginPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String? phoneNumber, String? pinCode, bool invalidCredentials});
}

/// @nodoc
class __$LoginPageStateCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res>
    implements _$LoginPageStateCopyWith<$Res> {
  __$LoginPageStateCopyWithImpl(
      _LoginPageState _value, $Res Function(_LoginPageState) _then)
      : super(_value, (v) => _then(v as _LoginPageState));

  @override
  _LoginPageState get _value => super._value as _LoginPageState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
    Object? invalidCredentials = freezed,
  }) {
    return _then(_LoginPageState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginPageState implements _LoginPageState {
  _$_LoginPageState(
      {this.phoneNumber, this.pinCode, this.invalidCredentials = false});

  factory _$_LoginPageState.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginPageStateFromJson(json);

  @override
  final String? phoneNumber;
  @override
  final String? pinCode;
  @JsonKey(defaultValue: false)
  @override
  final bool invalidCredentials;

  @override
  String toString() {
    return 'LoginPageState(phoneNumber: $phoneNumber, pinCode: $pinCode, invalidCredentials: $invalidCredentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginPageState &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.pinCode, pinCode) ||
                const DeepCollectionEquality()
                    .equals(other.pinCode, pinCode)) &&
            (identical(other.invalidCredentials, invalidCredentials) ||
                const DeepCollectionEquality()
                    .equals(other.invalidCredentials, invalidCredentials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(pinCode) ^
      const DeepCollectionEquality().hash(invalidCredentials);

  @JsonKey(ignore: true)
  @override
  _$LoginPageStateCopyWith<_LoginPageState> get copyWith =>
      __$LoginPageStateCopyWithImpl<_LoginPageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginPageStateToJson(this);
  }
}

abstract class _LoginPageState implements LoginPageState {
  factory _LoginPageState(
      {String? phoneNumber,
      String? pinCode,
      bool invalidCredentials}) = _$_LoginPageState;

  factory _LoginPageState.fromJson(Map<String, dynamic> json) =
      _$_LoginPageState.fromJson;

  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get pinCode => throw _privateConstructorUsedError;
  @override
  bool get invalidCredentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginPageStateCopyWith<_LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
