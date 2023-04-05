import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/message.dart';

part 'event_report.freezed.dart';
part 'event_report.g.dart';

/// An object representing a reported event in a Matrix room.
@freezed
class EventReport with _$EventReport {
  /// Create an [EventReport] object.
  factory EventReport({
    /// The unique ID of the reported event.
    @JsonKey(name: 'id') int? reportID,

    /// The timestamp of when the event was received.
    @JsonKey(name: 'received_ts') int? reportDate,

    /// The ID of the room where the reported event occurred.
    @JsonKey(name: 'room_id') String? roomID,

    /// The ID of the reported event.
    @JsonKey(name: 'event_id') String? eventID,

    /// The ID of the user who reported the event.
    @JsonKey(name: 'user_id') String? userID,

    /// The score assigned to the reported event.
    @JsonKey(name: 'score') int? score,

    /// The reason given for reporting the event.
    @JsonKey(name: 'reason') String? reason,

    /// The ID of the user who sent the reported event.
    @JsonKey(name: 'sender') String? sender,

    /// The canonical alias of the room where the reported event occurred.
    @JsonKey(name: 'canonical_alias') String? canonicalAlias,

    /// The name of the room where the reported event occurred.
    @JsonKey(name: 'name') String? name,

    /// The reported event in full detail.
    @JsonKey(name: 'event_json') Message? reportedMessage,
  }) = _EventReport;

  /// Create an [EventReport] object from a JSON map.
  factory EventReport.fromJson(Map<String, dynamic> json) =>
      _$EventReportFromJson(json);

  /// Create an initial, empty [EventReport] object.
  factory EventReport.initial() => EventReport(
        reportID: 0,
        reportDate: 0,
        roomID: UNKNOWN,
        eventID: UNKNOWN,
        userID: UNKNOWN,
        score: 0,
        reason: UNKNOWN,
        sender: UNKNOWN,
        canonicalAlias: UNKNOWN,
        name: UNKNOWN,
        reportedMessage: Message.initial(),
      );
}
