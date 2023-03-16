// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contraceptive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContraceptiveState _$ContraceptiveStateFromJson(Map<String, dynamic> json) {
  return _ContraceptiveState.fromJson(json);
}

/// @nodoc
mixin _$ContraceptiveState {
  ScreeningTool? get screeningTool => throw _privateConstructorUsedError;
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  bool? get errorAnsweringQuestions => throw _privateConstructorUsedError;
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContraceptiveStateCopyWith<ContraceptiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContraceptiveStateCopyWith<$Res> {
  factory $ContraceptiveStateCopyWith(
          ContraceptiveState value, $Res Function(ContraceptiveState) then) =
      _$ContraceptiveStateCopyWithImpl<$Res, ContraceptiveState>;
  @useResult
  $Res call(
      {ScreeningTool? screeningTool,
      bool? errorFetchingQuestions,
      bool? errorAnsweringQuestions,
      bool? timeoutFetchingQuestions});

  $ScreeningToolCopyWith<$Res>? get screeningTool;
}

/// @nodoc
class _$ContraceptiveStateCopyWithImpl<$Res, $Val extends ContraceptiveState>
    implements $ContraceptiveStateCopyWith<$Res> {
  _$ContraceptiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screeningTool = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      screeningTool: freezed == screeningTool
          ? _value.screeningTool
          : screeningTool // ignore: cast_nullable_to_non_nullable
              as ScreeningTool?,
      errorFetchingQuestions: freezed == errorFetchingQuestions
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: freezed == errorAnsweringQuestions
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: freezed == timeoutFetchingQuestions
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningToolCopyWith<$Res>? get screeningTool {
    if (_value.screeningTool == null) {
      return null;
    }

    return $ScreeningToolCopyWith<$Res>(_value.screeningTool!, (value) {
      return _then(_value.copyWith(screeningTool: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContraceptiveStateCopyWith<$Res>
    implements $ContraceptiveStateCopyWith<$Res> {
  factory _$$_ContraceptiveStateCopyWith(_$_ContraceptiveState value,
          $Res Function(_$_ContraceptiveState) then) =
      __$$_ContraceptiveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreeningTool? screeningTool,
      bool? errorFetchingQuestions,
      bool? errorAnsweringQuestions,
      bool? timeoutFetchingQuestions});

  @override
  $ScreeningToolCopyWith<$Res>? get screeningTool;
}

/// @nodoc
class __$$_ContraceptiveStateCopyWithImpl<$Res>
    extends _$ContraceptiveStateCopyWithImpl<$Res, _$_ContraceptiveState>
    implements _$$_ContraceptiveStateCopyWith<$Res> {
  __$$_ContraceptiveStateCopyWithImpl(
      _$_ContraceptiveState _value, $Res Function(_$_ContraceptiveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screeningTool = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
  }) {
    return _then(_$_ContraceptiveState(
      screeningTool: freezed == screeningTool
          ? _value.screeningTool
          : screeningTool // ignore: cast_nullable_to_non_nullable
              as ScreeningTool?,
      errorFetchingQuestions: freezed == errorFetchingQuestions
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: freezed == errorAnsweringQuestions
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: freezed == timeoutFetchingQuestions
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContraceptiveState implements _ContraceptiveState {
  _$_ContraceptiveState(
      {this.screeningTool,
      this.errorFetchingQuestions,
      this.errorAnsweringQuestions,
      this.timeoutFetchingQuestions});

  factory _$_ContraceptiveState.fromJson(Map<String, dynamic> json) =>
      _$$_ContraceptiveStateFromJson(json);

  @override
  final ScreeningTool? screeningTool;
  @override
  final bool? errorFetchingQuestions;
  @override
  final bool? errorAnsweringQuestions;
  @override
  final bool? timeoutFetchingQuestions;

  @override
  String toString() {
    return 'ContraceptiveState(screeningTool: $screeningTool, errorFetchingQuestions: $errorFetchingQuestions, errorAnsweringQuestions: $errorAnsweringQuestions, timeoutFetchingQuestions: $timeoutFetchingQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContraceptiveState &&
            (identical(other.screeningTool, screeningTool) ||
                other.screeningTool == screeningTool) &&
            (identical(other.errorFetchingQuestions, errorFetchingQuestions) ||
                other.errorFetchingQuestions == errorFetchingQuestions) &&
            (identical(
                    other.errorAnsweringQuestions, errorAnsweringQuestions) ||
                other.errorAnsweringQuestions == errorAnsweringQuestions) &&
            (identical(
                    other.timeoutFetchingQuestions, timeoutFetchingQuestions) ||
                other.timeoutFetchingQuestions == timeoutFetchingQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      screeningTool,
      errorFetchingQuestions,
      errorAnsweringQuestions,
      timeoutFetchingQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContraceptiveStateCopyWith<_$_ContraceptiveState> get copyWith =>
      __$$_ContraceptiveStateCopyWithImpl<_$_ContraceptiveState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContraceptiveStateToJson(
      this,
    );
  }
}

abstract class _ContraceptiveState implements ContraceptiveState {
  factory _ContraceptiveState(
      {final ScreeningTool? screeningTool,
      final bool? errorFetchingQuestions,
      final bool? errorAnsweringQuestions,
      final bool? timeoutFetchingQuestions}) = _$_ContraceptiveState;

  factory _ContraceptiveState.fromJson(Map<String, dynamic> json) =
      _$_ContraceptiveState.fromJson;

  @override
  ScreeningTool? get screeningTool;
  @override
  bool? get errorFetchingQuestions;
  @override
  bool? get errorAnsweringQuestions;
  @override
  bool? get timeoutFetchingQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_ContraceptiveStateCopyWith<_$_ContraceptiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
