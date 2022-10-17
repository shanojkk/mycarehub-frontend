// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facility_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityState _$FacilityStateFromJson(Map<String, dynamic> json) {
  return _FacilityState.fromJson(json);
}

/// @nodoc
mixin _$FacilityState {
  List<Facility?>? get facilities => throw _privateConstructorUsedError;
  Facility? get currentFacility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityStateCopyWith<FacilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityStateCopyWith<$Res> {
  factory $FacilityStateCopyWith(
          FacilityState value, $Res Function(FacilityState) then) =
      _$FacilityStateCopyWithImpl<$Res>;
  $Res call({List<Facility?>? facilities, Facility? currentFacility});

  $FacilityCopyWith<$Res>? get currentFacility;
}

/// @nodoc
class _$FacilityStateCopyWithImpl<$Res>
    implements $FacilityStateCopyWith<$Res> {
  _$FacilityStateCopyWithImpl(this._value, this._then);

  final FacilityState _value;
  // ignore: unused_field
  final $Res Function(FacilityState) _then;

  @override
  $Res call({
    Object? facilities = freezed,
    Object? currentFacility = freezed,
  }) {
    return _then(_value.copyWith(
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility?>?,
      currentFacility: currentFacility == freezed
          ? _value.currentFacility
          : currentFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ));
  }

  @override
  $FacilityCopyWith<$Res>? get currentFacility {
    if (_value.currentFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.currentFacility!, (value) {
      return _then(_value.copyWith(currentFacility: value));
    });
  }
}

/// @nodoc
abstract class _$$_FacilityStateCopyWith<$Res>
    implements $FacilityStateCopyWith<$Res> {
  factory _$$_FacilityStateCopyWith(
          _$_FacilityState value, $Res Function(_$_FacilityState) then) =
      __$$_FacilityStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Facility?>? facilities, Facility? currentFacility});

  @override
  $FacilityCopyWith<$Res>? get currentFacility;
}

/// @nodoc
class __$$_FacilityStateCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res>
    implements _$$_FacilityStateCopyWith<$Res> {
  __$$_FacilityStateCopyWithImpl(
      _$_FacilityState _value, $Res Function(_$_FacilityState) _then)
      : super(_value, (v) => _then(v as _$_FacilityState));

  @override
  _$_FacilityState get _value => super._value as _$_FacilityState;

  @override
  $Res call({
    Object? facilities = freezed,
    Object? currentFacility = freezed,
  }) {
    return _then(_$_FacilityState(
      facilities: facilities == freezed
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility?>?,
      currentFacility: currentFacility == freezed
          ? _value.currentFacility
          : currentFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityState implements _FacilityState {
  _$_FacilityState({final List<Facility?>? facilities, this.currentFacility})
      : _facilities = facilities;

  factory _$_FacilityState.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityStateFromJson(json);

  final List<Facility?>? _facilities;
  @override
  List<Facility?>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Facility? currentFacility;

  @override
  String toString() {
    return 'FacilityState(facilities: $facilities, currentFacility: $currentFacility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityState &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            const DeepCollectionEquality()
                .equals(other.currentFacility, currentFacility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_facilities),
      const DeepCollectionEquality().hash(currentFacility));

  @JsonKey(ignore: true)
  @override
  _$$_FacilityStateCopyWith<_$_FacilityState> get copyWith =>
      __$$_FacilityStateCopyWithImpl<_$_FacilityState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityStateToJson(
      this,
    );
  }
}

abstract class _FacilityState implements FacilityState {
  factory _FacilityState(
      {final List<Facility?>? facilities,
      final Facility? currentFacility}) = _$_FacilityState;

  factory _FacilityState.fromJson(Map<String, dynamic> json) =
      _$_FacilityState.fromJson;

  @override
  List<Facility?>? get facilities;
  @override
  Facility? get currentFacility;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityStateCopyWith<_$_FacilityState> get copyWith =>
      throw _privateConstructorUsedError;
}
