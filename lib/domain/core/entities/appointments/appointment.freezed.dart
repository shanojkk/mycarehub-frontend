// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
  bool get pendingReschedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'reason')
          String? reason,
      @JsonKey(name: 'date')
          String? date,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          bool pendingReschedule});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reason = freezed,
    Object? date = freezed,
    Object? pendingReschedule = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingReschedule: null == pendingReschedule
          ? _value.pendingReschedule
          : pendingReschedule // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$_AppointmentCopyWith(
          _$_Appointment value, $Res Function(_$_Appointment) then) =
      __$$_AppointmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'reason')
          String? reason,
      @JsonKey(name: 'date')
          String? date,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          bool pendingReschedule});
}

/// @nodoc
class __$$_AppointmentCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$_Appointment>
    implements _$$_AppointmentCopyWith<$Res> {
  __$$_AppointmentCopyWithImpl(
      _$_Appointment _value, $Res Function(_$_Appointment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? reason = freezed,
    Object? date = freezed,
    Object? pendingReschedule = null,
  }) {
    return _then(_$_Appointment(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingReschedule: null == pendingReschedule
          ? _value.pendingReschedule
          : pendingReschedule // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Appointment implements _Appointment {
  _$_Appointment(
      {@JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'reason')
          required this.reason,
      @JsonKey(name: 'date')
          required this.date,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          required this.pendingReschedule});

  factory _$_Appointment.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
  final bool pendingReschedule;

  @override
  String toString() {
    return 'Appointment(id: $id, reason: $reason, date: $date, pendingReschedule: $pendingReschedule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pendingReschedule, pendingReschedule) ||
                other.pendingReschedule == pendingReschedule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, reason, date, pendingReschedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentCopyWith<_$_Appointment> get copyWith =>
      __$$_AppointmentCopyWithImpl<_$_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentToJson(
      this,
    );
  }
}

abstract class _Appointment implements Appointment {
  factory _Appointment(
      {@JsonKey(name: 'id')
          required final String? id,
      @JsonKey(name: 'reason')
          required final String? reason,
      @JsonKey(name: 'date')
          required final String? date,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          required final bool pendingReschedule}) = _$_Appointment;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$_Appointment.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
  bool get pendingReschedule;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentCopyWith<_$_Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}
