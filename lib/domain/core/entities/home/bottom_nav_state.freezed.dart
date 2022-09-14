// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottom_nav_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BottomNavigationState _$BottomNavigationStateFromJson(
    Map<String, dynamic> json) {
  return _BottomNavigationState.fromJson(json);
}

/// @nodoc
mixin _$BottomNavigationState {
  int get currentBottomNavIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BottomNavigationStateCopyWith<BottomNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationStateCopyWith<$Res> {
  factory $BottomNavigationStateCopyWith(BottomNavigationState value,
          $Res Function(BottomNavigationState) then) =
      _$BottomNavigationStateCopyWithImpl<$Res>;
  $Res call({int currentBottomNavIndex});
}

/// @nodoc
class _$BottomNavigationStateCopyWithImpl<$Res>
    implements $BottomNavigationStateCopyWith<$Res> {
  _$BottomNavigationStateCopyWithImpl(this._value, this._then);

  final BottomNavigationState _value;
  // ignore: unused_field
  final $Res Function(BottomNavigationState) _then;

  @override
  $Res call({
    Object? currentBottomNavIndex = freezed,
  }) {
    return _then(_value.copyWith(
      currentBottomNavIndex: currentBottomNavIndex == freezed
          ? _value.currentBottomNavIndex
          : currentBottomNavIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BottomNavigationStateCopyWith<$Res>
    implements $BottomNavigationStateCopyWith<$Res> {
  factory _$$_BottomNavigationStateCopyWith(_$_BottomNavigationState value,
          $Res Function(_$_BottomNavigationState) then) =
      __$$_BottomNavigationStateCopyWithImpl<$Res>;
  @override
  $Res call({int currentBottomNavIndex});
}

/// @nodoc
class __$$_BottomNavigationStateCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res>
    implements _$$_BottomNavigationStateCopyWith<$Res> {
  __$$_BottomNavigationStateCopyWithImpl(_$_BottomNavigationState _value,
      $Res Function(_$_BottomNavigationState) _then)
      : super(_value, (v) => _then(v as _$_BottomNavigationState));

  @override
  _$_BottomNavigationState get _value =>
      super._value as _$_BottomNavigationState;

  @override
  $Res call({
    Object? currentBottomNavIndex = freezed,
  }) {
    return _then(_$_BottomNavigationState(
      currentBottomNavIndex: currentBottomNavIndex == freezed
          ? _value.currentBottomNavIndex
          : currentBottomNavIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BottomNavigationState implements _BottomNavigationState {
  _$_BottomNavigationState({required this.currentBottomNavIndex});

  factory _$_BottomNavigationState.fromJson(Map<String, dynamic> json) =>
      _$$_BottomNavigationStateFromJson(json);

  @override
  final int currentBottomNavIndex;

  @override
  String toString() {
    return 'BottomNavigationState(currentBottomNavIndex: $currentBottomNavIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BottomNavigationState &&
            const DeepCollectionEquality()
                .equals(other.currentBottomNavIndex, currentBottomNavIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentBottomNavIndex));

  @JsonKey(ignore: true)
  @override
  _$$_BottomNavigationStateCopyWith<_$_BottomNavigationState> get copyWith =>
      __$$_BottomNavigationStateCopyWithImpl<_$_BottomNavigationState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BottomNavigationStateToJson(
      this,
    );
  }
}

abstract class _BottomNavigationState implements BottomNavigationState {
  factory _BottomNavigationState({required final int currentBottomNavIndex}) =
      _$_BottomNavigationState;

  factory _BottomNavigationState.fromJson(Map<String, dynamic> json) =
      _$_BottomNavigationState.fromJson;

  @override
  int get currentBottomNavIndex;
  @override
  @JsonKey(ignore: true)
  _$$_BottomNavigationStateCopyWith<_$_BottomNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
