// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentState _$AppointmentStateFromJson(Map<String, dynamic> json) {
  return _AppointmentState.fromJson(json);
}

/// @nodoc
mixin _$AppointmentState {
  @JsonKey(name: 'appointments')
  List<Appointment>? get appointments => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  bool? get hasNextPage => throw _privateConstructorUsedError;
  bool? get errorFetchingAppointments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentStateCopyWith<AppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentStateCopyWith<$Res> {
  factory $AppointmentStateCopyWith(
          AppointmentState value, $Res Function(AppointmentState) then) =
      _$AppointmentStateCopyWithImpl<$Res, AppointmentState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'appointments') List<Appointment>? appointments,
      int? currentPage,
      bool? hasNextPage,
      bool? errorFetchingAppointments});
}

/// @nodoc
class _$AppointmentStateCopyWithImpl<$Res, $Val extends AppointmentState>
    implements $AppointmentStateCopyWith<$Res> {
  _$AppointmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointments = freezed,
    Object? currentPage = freezed,
    Object? hasNextPage = freezed,
    Object? errorFetchingAppointments = freezed,
  }) {
    return _then(_value.copyWith(
      appointments: freezed == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorFetchingAppointments: freezed == errorFetchingAppointments
          ? _value.errorFetchingAppointments
          : errorFetchingAppointments // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentStateCopyWith<$Res>
    implements $AppointmentStateCopyWith<$Res> {
  factory _$$_AppointmentStateCopyWith(
          _$_AppointmentState value, $Res Function(_$_AppointmentState) then) =
      __$$_AppointmentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'appointments') List<Appointment>? appointments,
      int? currentPage,
      bool? hasNextPage,
      bool? errorFetchingAppointments});
}

/// @nodoc
class __$$_AppointmentStateCopyWithImpl<$Res>
    extends _$AppointmentStateCopyWithImpl<$Res, _$_AppointmentState>
    implements _$$_AppointmentStateCopyWith<$Res> {
  __$$_AppointmentStateCopyWithImpl(
      _$_AppointmentState _value, $Res Function(_$_AppointmentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointments = freezed,
    Object? currentPage = freezed,
    Object? hasNextPage = freezed,
    Object? errorFetchingAppointments = freezed,
  }) {
    return _then(_$_AppointmentState(
      appointments: freezed == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorFetchingAppointments: freezed == errorFetchingAppointments
          ? _value.errorFetchingAppointments
          : errorFetchingAppointments // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentState implements _AppointmentState {
  _$_AppointmentState(
      {@JsonKey(name: 'appointments') final List<Appointment>? appointments,
      this.currentPage,
      this.hasNextPage,
      this.errorFetchingAppointments})
      : _appointments = appointments;

  factory _$_AppointmentState.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentStateFromJson(json);

  final List<Appointment>? _appointments;
  @override
  @JsonKey(name: 'appointments')
  List<Appointment>? get appointments {
    final value = _appointments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? currentPage;
  @override
  final bool? hasNextPage;
  @override
  final bool? errorFetchingAppointments;

  @override
  String toString() {
    return 'AppointmentState(appointments: $appointments, currentPage: $currentPage, hasNextPage: $hasNextPage, errorFetchingAppointments: $errorFetchingAppointments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentState &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.errorFetchingAppointments,
                    errorFetchingAppointments) ||
                other.errorFetchingAppointments == errorFetchingAppointments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_appointments),
      currentPage,
      hasNextPage,
      errorFetchingAppointments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentStateCopyWith<_$_AppointmentState> get copyWith =>
      __$$_AppointmentStateCopyWithImpl<_$_AppointmentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentStateToJson(
      this,
    );
  }
}

abstract class _AppointmentState implements AppointmentState {
  factory _AppointmentState(
      {@JsonKey(name: 'appointments') final List<Appointment>? appointments,
      final int? currentPage,
      final bool? hasNextPage,
      final bool? errorFetchingAppointments}) = _$_AppointmentState;

  factory _AppointmentState.fromJson(Map<String, dynamic> json) =
      _$_AppointmentState.fromJson;

  @override
  @JsonKey(name: 'appointments')
  List<Appointment>? get appointments;
  @override
  int? get currentPage;
  @override
  bool? get hasNextPage;
  @override
  bool? get errorFetchingAppointments;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentStateCopyWith<_$_AppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}
