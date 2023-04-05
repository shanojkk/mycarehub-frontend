// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventReport _$EventReportFromJson(Map<String, dynamic> json) {
  return _EventReport.fromJson(json);
}

/// @nodoc
mixin _$EventReport {
  /// The unique ID of the reported event.
  @JsonKey(name: 'id')
  int? get reportID => throw _privateConstructorUsedError;

  /// The timestamp of when the event was received.
  @JsonKey(name: 'received_ts')
  int? get reportDate => throw _privateConstructorUsedError;

  /// The ID of the room where the reported event occurred.
  @JsonKey(name: 'room_id')
  String? get roomID => throw _privateConstructorUsedError;

  /// The ID of the reported event.
  @JsonKey(name: 'event_id')
  String? get eventID => throw _privateConstructorUsedError;

  /// The ID of the user who reported the event.
  @JsonKey(name: 'user_id')
  String? get userID => throw _privateConstructorUsedError;

  /// The score assigned to the reported event.
  @JsonKey(name: 'score')
  int? get score => throw _privateConstructorUsedError;

  /// The reason given for reporting the event.
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;

  /// The ID of the user who sent the reported event.
  @JsonKey(name: 'sender')
  String? get sender => throw _privateConstructorUsedError;

  /// The canonical alias of the room where the reported event occurred.
  @JsonKey(name: 'canonical_alias')
  String? get canonicalAlias => throw _privateConstructorUsedError;

  /// The name of the room where the reported event occurred.
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  /// The reported event in full detail.
  @JsonKey(name: 'event_json')
  Message? get reportedMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventReportCopyWith<EventReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventReportCopyWith<$Res> {
  factory $EventReportCopyWith(
          EventReport value, $Res Function(EventReport) then) =
      _$EventReportCopyWithImpl<$Res, EventReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? reportID,
      @JsonKey(name: 'received_ts') int? reportDate,
      @JsonKey(name: 'room_id') String? roomID,
      @JsonKey(name: 'event_id') String? eventID,
      @JsonKey(name: 'user_id') String? userID,
      @JsonKey(name: 'score') int? score,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'sender') String? sender,
      @JsonKey(name: 'canonical_alias') String? canonicalAlias,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'event_json') Message? reportedMessage});

  $MessageCopyWith<$Res>? get reportedMessage;
}

/// @nodoc
class _$EventReportCopyWithImpl<$Res, $Val extends EventReport>
    implements $EventReportCopyWith<$Res> {
  _$EventReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportID = freezed,
    Object? reportDate = freezed,
    Object? roomID = freezed,
    Object? eventID = freezed,
    Object? userID = freezed,
    Object? score = freezed,
    Object? reason = freezed,
    Object? sender = freezed,
    Object? canonicalAlias = freezed,
    Object? name = freezed,
    Object? reportedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      reportID: freezed == reportID
          ? _value.reportID
          : reportID // ignore: cast_nullable_to_non_nullable
              as int?,
      reportDate: freezed == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as int?,
      roomID: freezed == roomID
          ? _value.roomID
          : roomID // ignore: cast_nullable_to_non_nullable
              as String?,
      eventID: freezed == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      canonicalAlias: freezed == canonicalAlias
          ? _value.canonicalAlias
          : canonicalAlias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedMessage: freezed == reportedMessage
          ? _value.reportedMessage
          : reportedMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res>? get reportedMessage {
    if (_value.reportedMessage == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.reportedMessage!, (value) {
      return _then(_value.copyWith(reportedMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventReportCopyWith<$Res>
    implements $EventReportCopyWith<$Res> {
  factory _$$_EventReportCopyWith(
          _$_EventReport value, $Res Function(_$_EventReport) then) =
      __$$_EventReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? reportID,
      @JsonKey(name: 'received_ts') int? reportDate,
      @JsonKey(name: 'room_id') String? roomID,
      @JsonKey(name: 'event_id') String? eventID,
      @JsonKey(name: 'user_id') String? userID,
      @JsonKey(name: 'score') int? score,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'sender') String? sender,
      @JsonKey(name: 'canonical_alias') String? canonicalAlias,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'event_json') Message? reportedMessage});

  @override
  $MessageCopyWith<$Res>? get reportedMessage;
}

/// @nodoc
class __$$_EventReportCopyWithImpl<$Res>
    extends _$EventReportCopyWithImpl<$Res, _$_EventReport>
    implements _$$_EventReportCopyWith<$Res> {
  __$$_EventReportCopyWithImpl(
      _$_EventReport _value, $Res Function(_$_EventReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportID = freezed,
    Object? reportDate = freezed,
    Object? roomID = freezed,
    Object? eventID = freezed,
    Object? userID = freezed,
    Object? score = freezed,
    Object? reason = freezed,
    Object? sender = freezed,
    Object? canonicalAlias = freezed,
    Object? name = freezed,
    Object? reportedMessage = freezed,
  }) {
    return _then(_$_EventReport(
      reportID: freezed == reportID
          ? _value.reportID
          : reportID // ignore: cast_nullable_to_non_nullable
              as int?,
      reportDate: freezed == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as int?,
      roomID: freezed == roomID
          ? _value.roomID
          : roomID // ignore: cast_nullable_to_non_nullable
              as String?,
      eventID: freezed == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      canonicalAlias: freezed == canonicalAlias
          ? _value.canonicalAlias
          : canonicalAlias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedMessage: freezed == reportedMessage
          ? _value.reportedMessage
          : reportedMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventReport with DiagnosticableTreeMixin implements _EventReport {
  _$_EventReport(
      {@JsonKey(name: 'id') this.reportID,
      @JsonKey(name: 'received_ts') this.reportDate,
      @JsonKey(name: 'room_id') this.roomID,
      @JsonKey(name: 'event_id') this.eventID,
      @JsonKey(name: 'user_id') this.userID,
      @JsonKey(name: 'score') this.score,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'sender') this.sender,
      @JsonKey(name: 'canonical_alias') this.canonicalAlias,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'event_json') this.reportedMessage});

  factory _$_EventReport.fromJson(Map<String, dynamic> json) =>
      _$$_EventReportFromJson(json);

  /// The unique ID of the reported event.
  @override
  @JsonKey(name: 'id')
  final int? reportID;

  /// The timestamp of when the event was received.
  @override
  @JsonKey(name: 'received_ts')
  final int? reportDate;

  /// The ID of the room where the reported event occurred.
  @override
  @JsonKey(name: 'room_id')
  final String? roomID;

  /// The ID of the reported event.
  @override
  @JsonKey(name: 'event_id')
  final String? eventID;

  /// The ID of the user who reported the event.
  @override
  @JsonKey(name: 'user_id')
  final String? userID;

  /// The score assigned to the reported event.
  @override
  @JsonKey(name: 'score')
  final int? score;

  /// The reason given for reporting the event.
  @override
  @JsonKey(name: 'reason')
  final String? reason;

  /// The ID of the user who sent the reported event.
  @override
  @JsonKey(name: 'sender')
  final String? sender;

  /// The canonical alias of the room where the reported event occurred.
  @override
  @JsonKey(name: 'canonical_alias')
  final String? canonicalAlias;

  /// The name of the room where the reported event occurred.
  @override
  @JsonKey(name: 'name')
  final String? name;

  /// The reported event in full detail.
  @override
  @JsonKey(name: 'event_json')
  final Message? reportedMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventReport(reportID: $reportID, reportDate: $reportDate, roomID: $roomID, eventID: $eventID, userID: $userID, score: $score, reason: $reason, sender: $sender, canonicalAlias: $canonicalAlias, name: $name, reportedMessage: $reportedMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventReport'))
      ..add(DiagnosticsProperty('reportID', reportID))
      ..add(DiagnosticsProperty('reportDate', reportDate))
      ..add(DiagnosticsProperty('roomID', roomID))
      ..add(DiagnosticsProperty('eventID', eventID))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('reason', reason))
      ..add(DiagnosticsProperty('sender', sender))
      ..add(DiagnosticsProperty('canonicalAlias', canonicalAlias))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('reportedMessage', reportedMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventReport &&
            (identical(other.reportID, reportID) ||
                other.reportID == reportID) &&
            (identical(other.reportDate, reportDate) ||
                other.reportDate == reportDate) &&
            (identical(other.roomID, roomID) || other.roomID == roomID) &&
            (identical(other.eventID, eventID) || other.eventID == eventID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.canonicalAlias, canonicalAlias) ||
                other.canonicalAlias == canonicalAlias) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reportedMessage, reportedMessage) ||
                other.reportedMessage == reportedMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reportID,
      reportDate,
      roomID,
      eventID,
      userID,
      score,
      reason,
      sender,
      canonicalAlias,
      name,
      reportedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventReportCopyWith<_$_EventReport> get copyWith =>
      __$$_EventReportCopyWithImpl<_$_EventReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventReportToJson(
      this,
    );
  }
}

abstract class _EventReport implements EventReport {
  factory _EventReport(
          {@JsonKey(name: 'id') final int? reportID,
          @JsonKey(name: 'received_ts') final int? reportDate,
          @JsonKey(name: 'room_id') final String? roomID,
          @JsonKey(name: 'event_id') final String? eventID,
          @JsonKey(name: 'user_id') final String? userID,
          @JsonKey(name: 'score') final int? score,
          @JsonKey(name: 'reason') final String? reason,
          @JsonKey(name: 'sender') final String? sender,
          @JsonKey(name: 'canonical_alias') final String? canonicalAlias,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'event_json') final Message? reportedMessage}) =
      _$_EventReport;

  factory _EventReport.fromJson(Map<String, dynamic> json) =
      _$_EventReport.fromJson;

  @override

  /// The unique ID of the reported event.
  @JsonKey(name: 'id')
  int? get reportID;
  @override

  /// The timestamp of when the event was received.
  @JsonKey(name: 'received_ts')
  int? get reportDate;
  @override

  /// The ID of the room where the reported event occurred.
  @JsonKey(name: 'room_id')
  String? get roomID;
  @override

  /// The ID of the reported event.
  @JsonKey(name: 'event_id')
  String? get eventID;
  @override

  /// The ID of the user who reported the event.
  @JsonKey(name: 'user_id')
  String? get userID;
  @override

  /// The score assigned to the reported event.
  @JsonKey(name: 'score')
  int? get score;
  @override

  /// The reason given for reporting the event.
  @JsonKey(name: 'reason')
  String? get reason;
  @override

  /// The ID of the user who sent the reported event.
  @JsonKey(name: 'sender')
  String? get sender;
  @override

  /// The canonical alias of the room where the reported event occurred.
  @JsonKey(name: 'canonical_alias')
  String? get canonicalAlias;
  @override

  /// The name of the room where the reported event occurred.
  @JsonKey(name: 'name')
  String? get name;
  @override

  /// The reported event in full detail.
  @JsonKey(name: 'event_json')
  Message? get reportedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_EventReportCopyWith<_$_EventReport> get copyWith =>
      throw _privateConstructorUsedError;
}
