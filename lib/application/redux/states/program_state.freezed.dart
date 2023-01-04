// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgramState _$ProgramStateFromJson(Map<String, dynamic> json) {
  return _ProgramState.fromJson(json);
}

/// @nodoc
mixin _$ProgramState {
  List<Program?>? get programs => throw _privateConstructorUsedError;
  Program? get currentProgram => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramStateCopyWith<ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramStateCopyWith<$Res> {
  factory $ProgramStateCopyWith(
          ProgramState value, $Res Function(ProgramState) then) =
      _$ProgramStateCopyWithImpl<$Res, ProgramState>;
  @useResult
  $Res call({List<Program?>? programs, Program? currentProgram});

  $ProgramCopyWith<$Res>? get currentProgram;
}

/// @nodoc
class _$ProgramStateCopyWithImpl<$Res, $Val extends ProgramState>
    implements $ProgramStateCopyWith<$Res> {
  _$ProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programs = freezed,
    Object? currentProgram = freezed,
  }) {
    return _then(_value.copyWith(
      programs: freezed == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program?>?,
      currentProgram: freezed == currentProgram
          ? _value.currentProgram
          : currentProgram // ignore: cast_nullable_to_non_nullable
              as Program?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgramCopyWith<$Res>? get currentProgram {
    if (_value.currentProgram == null) {
      return null;
    }

    return $ProgramCopyWith<$Res>(_value.currentProgram!, (value) {
      return _then(_value.copyWith(currentProgram: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProgramStateCopyWith<$Res>
    implements $ProgramStateCopyWith<$Res> {
  factory _$$_ProgramStateCopyWith(
          _$_ProgramState value, $Res Function(_$_ProgramState) then) =
      __$$_ProgramStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Program?>? programs, Program? currentProgram});

  @override
  $ProgramCopyWith<$Res>? get currentProgram;
}

/// @nodoc
class __$$_ProgramStateCopyWithImpl<$Res>
    extends _$ProgramStateCopyWithImpl<$Res, _$_ProgramState>
    implements _$$_ProgramStateCopyWith<$Res> {
  __$$_ProgramStateCopyWithImpl(
      _$_ProgramState _value, $Res Function(_$_ProgramState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programs = freezed,
    Object? currentProgram = freezed,
  }) {
    return _then(_$_ProgramState(
      programs: freezed == programs
          ? _value._programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program?>?,
      currentProgram: freezed == currentProgram
          ? _value.currentProgram
          : currentProgram // ignore: cast_nullable_to_non_nullable
              as Program?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgramState implements _ProgramState {
  _$_ProgramState({final List<Program?>? programs, this.currentProgram})
      : _programs = programs;

  factory _$_ProgramState.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramStateFromJson(json);

  final List<Program?>? _programs;
  @override
  List<Program?>? get programs {
    final value = _programs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Program? currentProgram;

  @override
  String toString() {
    return 'ProgramState(programs: $programs, currentProgram: $currentProgram)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramState &&
            const DeepCollectionEquality().equals(other._programs, _programs) &&
            (identical(other.currentProgram, currentProgram) ||
                other.currentProgram == currentProgram));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_programs), currentProgram);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramStateCopyWith<_$_ProgramState> get copyWith =>
      __$$_ProgramStateCopyWithImpl<_$_ProgramState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramStateToJson(
      this,
    );
  }
}

abstract class _ProgramState implements ProgramState {
  factory _ProgramState(
      {final List<Program?>? programs,
      final Program? currentProgram}) = _$_ProgramState;

  factory _ProgramState.fromJson(Map<String, dynamic> json) =
      _$_ProgramState.fromJson;

  @override
  List<Program?>? get programs;
  @override
  Program? get currentProgram;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramStateCopyWith<_$_ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}
