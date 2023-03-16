// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlcoholSubstanceUseState _$AlcoholSubstanceUseStateFromJson(
    Map<String, dynamic> json) {
  return _AlcoholSubstanceUseState.fromJson(json);
}

/// @nodoc
mixin _$AlcoholSubstanceUseState {
  ScreeningTool? get screeningTool => throw _privateConstructorUsedError;
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;
  bool? get errorAnsweringQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlcoholSubstanceUseStateCopyWith<AlcoholSubstanceUseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlcoholSubstanceUseStateCopyWith<$Res> {
  factory $AlcoholSubstanceUseStateCopyWith(AlcoholSubstanceUseState value,
          $Res Function(AlcoholSubstanceUseState) then) =
      _$AlcoholSubstanceUseStateCopyWithImpl<$Res, AlcoholSubstanceUseState>;
  @useResult
  $Res call(
      {ScreeningTool? screeningTool,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions,
      bool? errorAnsweringQuestions});

  $ScreeningToolCopyWith<$Res>? get screeningTool;
}

/// @nodoc
class _$AlcoholSubstanceUseStateCopyWithImpl<$Res,
        $Val extends AlcoholSubstanceUseState>
    implements $AlcoholSubstanceUseStateCopyWith<$Res> {
  _$AlcoholSubstanceUseStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_AlcoholSubstanceUseStateCopyWith<$Res>
    implements $AlcoholSubstanceUseStateCopyWith<$Res> {
  factory _$$_AlcoholSubstanceUseStateCopyWith(
          _$_AlcoholSubstanceUseState value,
          $Res Function(_$_AlcoholSubstanceUseState) then) =
      __$$_AlcoholSubstanceUseStateCopyWithImpl<$Res>;
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
class __$$_AlcoholSubstanceUseStateCopyWithImpl<$Res>
    extends _$AlcoholSubstanceUseStateCopyWithImpl<$Res,
        _$_AlcoholSubstanceUseState>
    implements _$$_AlcoholSubstanceUseStateCopyWith<$Res> {
  __$$_AlcoholSubstanceUseStateCopyWithImpl(_$_AlcoholSubstanceUseState _value,
      $Res Function(_$_AlcoholSubstanceUseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screeningTool = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
    Object? errorAnsweringQuestions = freezed,
  }) {
    return _then(_$_AlcoholSubstanceUseState(
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
class _$_AlcoholSubstanceUseState implements _AlcoholSubstanceUseState {
  _$_AlcoholSubstanceUseState(
      {this.screeningTool,
      this.errorFetchingQuestions,
      this.timeoutFetchingQuestions,
      this.errorAnsweringQuestions});

  factory _$_AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$$_AlcoholSubstanceUseStateFromJson(json);

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
    return 'AlcoholSubstanceUseState(screeningTool: $screeningTool, errorFetchingQuestions: $errorFetchingQuestions, timeoutFetchingQuestions: $timeoutFetchingQuestions, errorAnsweringQuestions: $errorAnsweringQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlcoholSubstanceUseState &&
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
  _$$_AlcoholSubstanceUseStateCopyWith<_$_AlcoholSubstanceUseState>
      get copyWith => __$$_AlcoholSubstanceUseStateCopyWithImpl<
          _$_AlcoholSubstanceUseState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlcoholSubstanceUseStateToJson(
      this,
    );
  }
}

abstract class _AlcoholSubstanceUseState implements AlcoholSubstanceUseState {
  factory _AlcoholSubstanceUseState(
      {final ScreeningTool? screeningTool,
      final bool? errorFetchingQuestions,
      final bool? timeoutFetchingQuestions,
      final bool? errorAnsweringQuestions}) = _$_AlcoholSubstanceUseState;

  factory _AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =
      _$_AlcoholSubstanceUseState.fromJson;

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
  _$$_AlcoholSubstanceUseStateCopyWith<_$_AlcoholSubstanceUseState>
      get copyWith => throw _privateConstructorUsedError;
}
