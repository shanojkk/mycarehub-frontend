// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_pin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPINState _$ResetPINStateFromJson(Map<String, dynamic> json) {
  return _ResetPINState.fromJson(json);
}

/// @nodoc
mixin _$ResetPINState {
  String? get phone =>
      throw _privateConstructorUsedError; //If the user has set their PIN
  bool? get isPINSet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPINStateCopyWith<ResetPINState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPINStateCopyWith<$Res> {
  factory $ResetPINStateCopyWith(
          ResetPINState value, $Res Function(ResetPINState) then) =
      _$ResetPINStateCopyWithImpl<$Res, ResetPINState>;
  @useResult
  $Res call({String? phone, bool? isPINSet});
}

/// @nodoc
class _$ResetPINStateCopyWithImpl<$Res, $Val extends ResetPINState>
    implements $ResetPINStateCopyWith<$Res> {
  _$ResetPINStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? isPINSet = freezed,
  }) {
    return _then(_value.copyWith(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPINSet: freezed == isPINSet
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPINStateCopyWith<$Res>
    implements $ResetPINStateCopyWith<$Res> {
  factory _$$_ResetPINStateCopyWith(
          _$_ResetPINState value, $Res Function(_$_ResetPINState) then) =
      __$$_ResetPINStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? phone, bool? isPINSet});
}

/// @nodoc
class __$$_ResetPINStateCopyWithImpl<$Res>
    extends _$ResetPINStateCopyWithImpl<$Res, _$_ResetPINState>
    implements _$$_ResetPINStateCopyWith<$Res> {
  __$$_ResetPINStateCopyWithImpl(
      _$_ResetPINState _value, $Res Function(_$_ResetPINState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? isPINSet = freezed,
  }) {
    return _then(_$_ResetPINState(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPINSet: freezed == isPINSet
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPINState implements _ResetPINState {
  _$_ResetPINState({this.phone, this.isPINSet});

  factory _$_ResetPINState.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPINStateFromJson(json);

  @override
  final String? phone;
//If the user has set their PIN
  @override
  final bool? isPINSet;

  @override
  String toString() {
    return 'ResetPINState(phone: $phone, isPINSet: $isPINSet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPINState &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isPINSet, isPINSet) ||
                other.isPINSet == isPINSet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, isPINSet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPINStateCopyWith<_$_ResetPINState> get copyWith =>
      __$$_ResetPINStateCopyWithImpl<_$_ResetPINState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPINStateToJson(
      this,
    );
  }
}

abstract class _ResetPINState implements ResetPINState {
  factory _ResetPINState({final String? phone, final bool? isPINSet}) =
      _$_ResetPINState;

  factory _ResetPINState.fromJson(Map<String, dynamic> json) =
      _$_ResetPINState.fromJson;

  @override
  String? get phone;
  @override //If the user has set their PIN
  bool? get isPINSet;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPINStateCopyWith<_$_ResetPINState> get copyWith =>
      throw _privateConstructorUsedError;
}
