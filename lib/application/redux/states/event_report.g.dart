// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventReport _$$_EventReportFromJson(Map<String, dynamic> json) =>
    _$_EventReport(
      reportID: json['id'] as int?,
      reportDate: json['received_ts'] as int?,
      roomID: json['room_id'] as String?,
      eventID: json['event_id'] as String?,
      userID: json['user_id'] as String?,
      score: json['score'] as int?,
      reason: json['reason'] as String?,
      sender: json['sender'] as String?,
      canonicalAlias: json['canonical_alias'] as String?,
      name: json['name'] as String?,
      reportedMessage: json['event_json'] == null
          ? null
          : Message.fromJson(json['event_json'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EventReportToJson(_$_EventReport instance) =>
    <String, dynamic>{
      'id': instance.reportID,
      'received_ts': instance.reportDate,
      'room_id': instance.roomID,
      'event_id': instance.eventID,
      'user_id': instance.userID,
      'score': instance.score,
      'reason': instance.reason,
      'sender': instance.sender,
      'canonical_alias': instance.canonicalAlias,
      'name': instance.name,
      'event_json': instance.reportedMessage,
    };
