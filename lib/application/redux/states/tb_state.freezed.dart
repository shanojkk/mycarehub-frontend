// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tb_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TBState _$TBStateFromJson(Map<String, dynamic> json) {
  return _TBState.fromJson(json);
}

/// @nodoc
mixin _$TBState {
  ScreeningTool? get screeningTool => throw _privateConstructorUsedError;
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;
  bool? get errorAnsweringQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TBStateCopyWith<TBState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TBStateCopyWith<$Res> {
  factory $TBStateCopyWith(TBState value, $Res Function(TBState) then) =
      _$TBStateCopyWithImpl<$Res, TBState>;
  @useResult
  $Res call(
      {ScreeningTool? screeningTool,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions,
      bool? errorAnsweringQuestions});

  $ScreeningToolCopyWith<$Res>? get screeningTool;
}

/// @nodoc
class _$TBStateCopyWithImpl<$Res, $Val extends TBState>
    implements $TBStateCopyWith<$Res> {
  _$TBStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screeningTool = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
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
      timeoutFetchingQuestions: freezed == timeoutFetchingQuestions
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: freezed == errorAnsweringQuestions
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TBStateCopyWith<$Res> implements $TBStateCopyWith<$Res> {
  factory _$$_TBStateCopyWith(
          _$_TBState value, $Res Function(_$_TBState) then) =
      __$$_TBStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreeningTool? screeningTool,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions,
      bool? errorAnsweringQuestions});

  @override
  $ScreeningToolCopyWith<$Res>? get screeningTool;
}

/// @nodoc
class __$$_TBStateCopyWithImpl<$Res>
    extends _$TBStateCopyWithImpl<$Res, _$_TBState>
    implements _$$_TBStateCopyWith<$Res> {
  __$$_TBStateCopyWithImpl(_$_TBState _value, $Res Function(_$_TBState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screeningTool = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
  }) {
    return _then(_$_TBState(
      screeningTool: freezed == screeningTool
          ? _value.screeningTool
          : screeningTool // ignore: cast_nullable_to_non_nullable
              as ScreeningTool?,
      errorFetchingQuestions: freezed == errorFetchingQuestions
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: freezed == timeoutFetchingQuestions
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorAnsweringQuestions: freezed == errorAnsweringQuestions
          ? _value.errorAnsweringQuestions
          : errorAnsweringQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TBState implements _TBState {
  _$_TBState(
      {this.screeningTool,
      this.errorFetchingQuestions,
      this.timeoutFetchingQuestions,
      this.errorAnsweringQuestions});

  factory _$_TBState.fromJson(Map<String, dynamic> json) =>
      _$$_TBStateFromJson(json);

  @override
  final ScreeningTool? screeningTool;
  @override
  final bool? errorFetchingQuestions;
  @override
  final bool? timeoutFetchingQuestions;
  @override
  final bool? errorAnsweringQuestions;

  @override
  String toString() {
    return 'TBState(screeningTool: $screeningTool, errorFetchingQuestions: $errorFetchingQuestions, timeoutFetchingQuestions: $timeoutFetchingQuestions, errorAnsweringQuestions: $errorAnsweringQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TBState &&
            (identical(other.screeningTool, screeningTool) ||
                other.screeningTool == screeningTool) &&
            (identical(other.errorFetchingQuestions, errorFetchingQuestions) ||
                other.errorFetchingQuestions == errorFetchingQuestions) &&
            (identical(
                    other.timeoutFetchingQuestions, timeoutFetchingQuestions) ||
                other.timeoutFetchingQuestions == timeoutFetchingQuestions) &&
            (identical(
                    other.errorAnsweringQuestions, errorAnsweringQuestions) ||
                other.errorAnsweringQuestions == errorAnsweringQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      screeningTool,
      errorFetchingQuestions,
      timeoutFetchingQuestions,
      errorAnsweringQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TBStateCopyWith<_$_TBState> get copyWith =>
      __$$_TBStateCopyWithImpl<_$_TBState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TBStateToJson(
      this,
    );
  }
}

abstract class _TBState implements TBState {
  factory _TBState(
      {final ScreeningTool? screeningTool,
      final bool? errorFetchingQuestions,
      final bool? timeoutFetchingQuestions,
      final bool? errorAnsweringQuestions}) = _$_TBState;

  factory _TBState.fromJson(Map<String, dynamic> json) = _$_TBState.fromJson;

  @override
  ScreeningTool? get screeningTool;
  @override
  bool? get errorFetchingQuestions;
  @override
  bool? get timeoutFetchingQuestions;
  @override
  bool? get errorAnsweringQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_TBStateCopyWith<_$_TBState> get copyWith =>
      throw _privateConstructorUsedError;
}
