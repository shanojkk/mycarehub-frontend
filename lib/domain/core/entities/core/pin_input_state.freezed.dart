// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pin_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PINInputState _$PINInputStateFromJson(Map<String, dynamic> json) {
  return _PINInputState.fromJson(json);
}

/// @nodoc
mixin _$PINInputState {
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  int? get pinInputTries => throw _privateConstructorUsedError;
  String? get maxTryTime => throw _privateConstructorUsedError;
  bool? get pinVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PINInputStateCopyWith<PINInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PINInputStateCopyWith<$Res> {
  factory $PINInputStateCopyWith(
          PINInputState value, $Res Function(PINInputState) then) =
      _$PINInputStateCopyWithImpl<$Res, PINInputState>;
  @useResult
  $Res call(
      {String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified});
}

/// @nodoc
class _$PINInputStateCopyWithImpl<$Res, $Val extends PINInputState>
    implements $PINInputStateCopyWith<$Res> {
  _$PINInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthPagePINInputTime = freezed,
    Object? pinInputTries = freezed,
    Object? maxTryTime = freezed,
    Object? pinVerified = freezed,
  }) {
    return _then(_value.copyWith(
      healthPagePINInputTime: freezed == healthPagePINInputTime
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinInputTries: freezed == pinInputTries
          ? _value.pinInputTries
          : pinInputTries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: freezed == maxTryTime
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinVerified: freezed == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PINInputStateCopyWith<$Res>
    implements $PINInputStateCopyWith<$Res> {
  factory _$$_PINInputStateCopyWith(
          _$_PINInputState value, $Res Function(_$_PINInputState) then) =
      __$$_PINInputStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified});
}

/// @nodoc
class __$$_PINInputStateCopyWithImpl<$Res>
    extends _$PINInputStateCopyWithImpl<$Res, _$_PINInputState>
    implements _$$_PINInputStateCopyWith<$Res> {
  __$$_PINInputStateCopyWithImpl(
      _$_PINInputState _value, $Res Function(_$_PINInputState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthPagePINInputTime = freezed,
    Object? pinInputTries = freezed,
    Object? maxTryTime = freezed,
    Object? pinVerified = freezed,
  }) {
    return _then(_$_PINInputState(
      healthPagePINInputTime: freezed == healthPagePINInputTime
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinInputTries: freezed == pinInputTries
          ? _value.pinInputTries
          : pinInputTries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: freezed == maxTryTime
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinVerified: freezed == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PINInputState implements _PINInputState {
  _$_PINInputState(
      {this.healthPagePINInputTime,
      this.pinInputTries,
      this.maxTryTime,
      this.pinVerified});

  factory _$_PINInputState.fromJson(Map<String, dynamic> json) =>
      _$$_PINInputStateFromJson(json);

  @override
  final String? healthPagePINInputTime;
  @override
  final int? pinInputTries;
  @override
  final String? maxTryTime;
  @override
  final bool? pinVerified;

  @override
  String toString() {
    return 'PINInputState(healthPagePINInputTime: $healthPagePINInputTime, pinInputTries: $pinInputTries, maxTryTime: $maxTryTime, pinVerified: $pinVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PINInputState &&
            (identical(other.healthPagePINInputTime, healthPagePINInputTime) ||
                other.healthPagePINInputTime == healthPagePINInputTime) &&
            (identical(other.pinInputTries, pinInputTries) ||
                other.pinInputTries == pinInputTries) &&
            (identical(other.maxTryTime, maxTryTime) ||
                other.maxTryTime == maxTryTime) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, healthPagePINInputTime,
      pinInputTries, maxTryTime, pinVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PINInputStateCopyWith<_$_PINInputState> get copyWith =>
      __$$_PINInputStateCopyWithImpl<_$_PINInputState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PINInputStateToJson(
      this,
    );
  }
}

abstract class _PINInputState implements PINInputState {
  factory _PINInputState(
      {final String? healthPagePINInputTime,
      final int? pinInputTries,
      final String? maxTryTime,
      final bool? pinVerified}) = _$_PINInputState;

  factory _PINInputState.fromJson(Map<String, dynamic> json) =
      _$_PINInputState.fromJson;

  @override
  String? get healthPagePINInputTime;
  @override
  int? get pinInputTries;
  @override
  String? get maxTryTime;
  @override
  bool? get pinVerified;
  @override
  @JsonKey(ignore: true)
  _$$_PINInputStateCopyWith<_$_PINInputState> get copyWith =>
      throw _privateConstructorUsedError;
}
