// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      id: json['id'] as String?,
      reason: json['reason'] as String?,
      date: json['date'] as String?,
      pendingReschedule: json['hasRescheduledAppointment'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'date': instance.date,
      'hasRescheduledAppointment': instance.pendingReschedule,
    };
