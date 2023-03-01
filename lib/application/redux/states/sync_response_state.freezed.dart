// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sync_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncResponse _$SyncResponseFromJson(Map<String, dynamic> json) {
  return _SyncResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncResponse {
  @JsonKey(name: 'presence')
  SyncPresence? get presence => throw _privateConstructorUsedError;
  @JsonKey(name: 'rooms')
  SyncRoomResponse? get rooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_batch')
  String? get nextBatch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncResponseCopyWith<SyncResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncResponseCopyWith<$Res> {
  factory $SyncResponseCopyWith(
          SyncResponse value, $Res Function(SyncResponse) then) =
      _$SyncResponseCopyWithImpl<$Res, SyncResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'presence') SyncPresence? presence,
      @JsonKey(name: 'rooms') SyncRoomResponse? rooms,
      @JsonKey(name: 'next_batch') String? nextBatch});

  $SyncPresenceCopyWith<$Res>? get presence;
  $SyncRoomResponseCopyWith<$Res>? get rooms;
}

/// @nodoc
class _$SyncResponseCopyWithImpl<$Res, $Val extends SyncResponse>
    implements $SyncResponseCopyWith<$Res> {
  _$SyncResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presence = freezed,
    Object? rooms = freezed,
    Object? nextBatch = freezed,
  }) {
    return _then(_value.copyWith(
      presence: freezed == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as SyncPresence?,
      rooms: freezed == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as SyncRoomResponse?,
      nextBatch: freezed == nextBatch
          ? _value.nextBatch
          : nextBatch // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SyncPresenceCopyWith<$Res>? get presence {
    if (_value.presence == null) {
      return null;
    }

    return $SyncPresenceCopyWith<$Res>(_value.presence!, (value) {
      return _then(_value.copyWith(presence: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SyncRoomResponseCopyWith<$Res>? get rooms {
    if (_value.rooms == null) {
      return null;
    }

    return $SyncRoomResponseCopyWith<$Res>(_value.rooms!, (value) {
      return _then(_value.copyWith(rooms: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SyncResponseCopyWith<$Res>
    implements $SyncResponseCopyWith<$Res> {
  factory _$$_SyncResponseCopyWith(
          _$_SyncResponse value, $Res Function(_$_SyncResponse) then) =
      __$$_SyncResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'presence') SyncPresence? presence,
      @JsonKey(name: 'rooms') SyncRoomResponse? rooms,
      @JsonKey(name: 'next_batch') String? nextBatch});

  @override
  $SyncPresenceCopyWith<$Res>? get presence;
  @override
  $SyncRoomResponseCopyWith<$Res>? get rooms;
}

/// @nodoc
class __$$_SyncResponseCopyWithImpl<$Res>
    extends _$SyncResponseCopyWithImpl<$Res, _$_SyncResponse>
    implements _$$_SyncResponseCopyWith<$Res> {
  __$$_SyncResponseCopyWithImpl(
      _$_SyncResponse _value, $Res Function(_$_SyncResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presence = freezed,
    Object? rooms = freezed,
    Object? nextBatch = freezed,
  }) {
    return _then(_$_SyncResponse(
      presence: freezed == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as SyncPresence?,
      rooms: freezed == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as SyncRoomResponse?,
      nextBatch: freezed == nextBatch
          ? _value.nextBatch
          : nextBatch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyncResponse with DiagnosticableTreeMixin implements _SyncResponse {
  _$_SyncResponse(
      {@JsonKey(name: 'presence') this.presence,
      @JsonKey(name: 'rooms') this.rooms,
      @JsonKey(name: 'next_batch') this.nextBatch});

  factory _$_SyncResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SyncResponseFromJson(json);

  @override
  @JsonKey(name: 'presence')
  final SyncPresence? presence;
  @override
  @JsonKey(name: 'rooms')
  final SyncRoomResponse? rooms;
  @override
  @JsonKey(name: 'next_batch')
  final String? nextBatch;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SyncResponse(presence: $presence, rooms: $rooms, nextBatch: $nextBatch)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SyncResponse'))
      ..add(DiagnosticsProperty('presence', presence))
      ..add(DiagnosticsProperty('rooms', rooms))
      ..add(DiagnosticsProperty('nextBatch', nextBatch));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncResponse &&
            (identical(other.presence, presence) ||
                other.presence == presence) &&
            (identical(other.rooms, rooms) || other.rooms == rooms) &&
            (identical(other.nextBatch, nextBatch) ||
                other.nextBatch == nextBatch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, presence, rooms, nextBatch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyncResponseCopyWith<_$_SyncResponse> get copyWith =>
      __$$_SyncResponseCopyWithImpl<_$_SyncResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyncResponseToJson(
      this,
    );
  }
}

abstract class _SyncResponse implements SyncResponse {
  factory _SyncResponse(
      {@JsonKey(name: 'presence') final SyncPresence? presence,
      @JsonKey(name: 'rooms') final SyncRoomResponse? rooms,
      @JsonKey(name: 'next_batch') final String? nextBatch}) = _$_SyncResponse;

  factory _SyncResponse.fromJson(Map<String, dynamic> json) =
      _$_SyncResponse.fromJson;

  @override
  @JsonKey(name: 'presence')
  SyncPresence? get presence;
  @override
  @JsonKey(name: 'rooms')
  SyncRoomResponse? get rooms;
  @override
  @JsonKey(name: 'next_batch')
  String? get nextBatch;
  @override
  @JsonKey(ignore: true)
  _$$_SyncResponseCopyWith<_$_SyncResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncPresence _$SyncPresenceFromJson(Map<String, dynamic> json) {
  return _SyncPresence.fromJson(json);
}

/// @nodoc
mixin _$SyncPresence {
  @JsonKey(name: 'events')
  List<Message?>? get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncPresenceCopyWith<SyncPresence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncPresenceCopyWith<$Res> {
  factory $SyncPresenceCopyWith(
          SyncPresence value, $Res Function(SyncPresence) then) =
      _$SyncPresenceCopyWithImpl<$Res, SyncPresence>;
  @useResult
  $Res call({@JsonKey(name: 'events') List<Message?>? events});
}

/// @nodoc
class _$SyncPresenceCopyWithImpl<$Res, $Val extends SyncPresence>
    implements $SyncPresenceCopyWith<$Res> {
  _$SyncPresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Message?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SyncPresenceCopyWith<$Res>
    implements $SyncPresenceCopyWith<$Res> {
  factory _$$_SyncPresenceCopyWith(
          _$_SyncPresence value, $Res Function(_$_SyncPresence) then) =
      __$$_SyncPresenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'events') List<Message?>? events});
}

/// @nodoc
class __$$_SyncPresenceCopyWithImpl<$Res>
    extends _$SyncPresenceCopyWithImpl<$Res, _$_SyncPresence>
    implements _$$_SyncPresenceCopyWith<$Res> {
  __$$_SyncPresenceCopyWithImpl(
      _$_SyncPresence _value, $Res Function(_$_SyncPresence) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
  }) {
    return _then(_$_SyncPresence(
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Message?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyncPresence with DiagnosticableTreeMixin implements _SyncPresence {
  _$_SyncPresence({@JsonKey(name: 'events') final List<Message?>? events})
      : _events = events;

  factory _$_SyncPresence.fromJson(Map<String, dynamic> json) =>
      _$$_SyncPresenceFromJson(json);

  final List<Message?>? _events;
  @override
  @JsonKey(name: 'events')
  List<Message?>? get events {
    final value = _events;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SyncPresence(events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SyncPresence'))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncPresence &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyncPresenceCopyWith<_$_SyncPresence> get copyWith =>
      __$$_SyncPresenceCopyWithImpl<_$_SyncPresence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyncPresenceToJson(
      this,
    );
  }
}

abstract class _SyncPresence implements SyncPresence {
  factory _SyncPresence(
          {@JsonKey(name: 'events') final List<Message?>? events}) =
      _$_SyncPresence;

  factory _SyncPresence.fromJson(Map<String, dynamic> json) =
      _$_SyncPresence.fromJson;

  @override
  @JsonKey(name: 'events')
  List<Message?>? get events;
  @override
  @JsonKey(ignore: true)
  _$$_SyncPresenceCopyWith<_$_SyncPresence> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncRoomResponse _$SyncRoomResponseFromJson(Map<String, dynamic> json) {
  return _SyncRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncRoomResponse {
  @JsonKey(name: 'join')
  Map<String, Room>? get joinedRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'invite')
  Map<String, Room>? get invitedRooms =>
      throw _privateConstructorUsedError; // Can be handled later
  @JsonKey(name: 'knock')
  Map<String, Room>? get knockedRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave')
  Map<String, Room>? get leftRooms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncRoomResponseCopyWith<SyncRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncRoomResponseCopyWith<$Res> {
  factory $SyncRoomResponseCopyWith(
          SyncRoomResponse value, $Res Function(SyncRoomResponse) then) =
      _$SyncRoomResponseCopyWithImpl<$Res, SyncRoomResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'join') Map<String, Room>? joinedRooms,
      @JsonKey(name: 'invite') Map<String, Room>? invitedRooms,
      @JsonKey(name: 'knock') Map<String, Room>? knockedRooms,
      @JsonKey(name: 'leave') Map<String, Room>? leftRooms});
}

/// @nodoc
class _$SyncRoomResponseCopyWithImpl<$Res, $Val extends SyncRoomResponse>
    implements $SyncRoomResponseCopyWith<$Res> {
  _$SyncRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedRooms = freezed,
    Object? invitedRooms = freezed,
    Object? knockedRooms = freezed,
    Object? leftRooms = freezed,
  }) {
    return _then(_value.copyWith(
      joinedRooms: freezed == joinedRooms
          ? _value.joinedRooms
          : joinedRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
      invitedRooms: freezed == invitedRooms
          ? _value.invitedRooms
          : invitedRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
      knockedRooms: freezed == knockedRooms
          ? _value.knockedRooms
          : knockedRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
      leftRooms: freezed == leftRooms
          ? _value.leftRooms
          : leftRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SyncRoomResponseCopyWith<$Res>
    implements $SyncRoomResponseCopyWith<$Res> {
  factory _$$_SyncRoomResponseCopyWith(
          _$_SyncRoomResponse value, $Res Function(_$_SyncRoomResponse) then) =
      __$$_SyncRoomResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'join') Map<String, Room>? joinedRooms,
      @JsonKey(name: 'invite') Map<String, Room>? invitedRooms,
      @JsonKey(name: 'knock') Map<String, Room>? knockedRooms,
      @JsonKey(name: 'leave') Map<String, Room>? leftRooms});
}

/// @nodoc
class __$$_SyncRoomResponseCopyWithImpl<$Res>
    extends _$SyncRoomResponseCopyWithImpl<$Res, _$_SyncRoomResponse>
    implements _$$_SyncRoomResponseCopyWith<$Res> {
  __$$_SyncRoomResponseCopyWithImpl(
      _$_SyncRoomResponse _value, $Res Function(_$_SyncRoomResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedRooms = freezed,
    Object? invitedRooms = freezed,
    Object? knockedRooms = freezed,
    Object? leftRooms = freezed,
  }) {
    return _then(_$_SyncRoomResponse(
      joinedRooms: freezed == joinedRooms
          ? _value.joinedRooms
          : joinedRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
      invitedRooms: freezed == invitedRooms
          ? _value.invitedRooms
          : invitedRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
      knockedRooms: freezed == knockedRooms
          ? _value.knockedRooms
          : knockedRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
      leftRooms: freezed == leftRooms
          ? _value.leftRooms
          : leftRooms // ignore: cast_nullable_to_non_nullable
              as Map<String, Room>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyncRoomResponse
    with DiagnosticableTreeMixin
    implements _SyncRoomResponse {
  _$_SyncRoomResponse(
      {@JsonKey(name: 'join') this.joinedRooms,
      @JsonKey(name: 'invite') this.invitedRooms,
      @JsonKey(name: 'knock') this.knockedRooms,
      @JsonKey(name: 'leave') this.leftRooms});

  factory _$_SyncRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SyncRoomResponseFromJson(json);

  @override
  @JsonKey(name: 'join')
  final Map<String, Room>? joinedRooms;
  @override
  @JsonKey(name: 'invite')
  final Map<String, Room>? invitedRooms;
// Can be handled later
  @override
  @JsonKey(name: 'knock')
  final Map<String, Room>? knockedRooms;
  @override
  @JsonKey(name: 'leave')
  final Map<String, Room>? leftRooms;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SyncRoomResponse(joinedRooms: $joinedRooms, invitedRooms: $invitedRooms, knockedRooms: $knockedRooms, leftRooms: $leftRooms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SyncRoomResponse'))
      ..add(DiagnosticsProperty('joinedRooms', joinedRooms))
      ..add(DiagnosticsProperty('invitedRooms', invitedRooms))
      ..add(DiagnosticsProperty('knockedRooms', knockedRooms))
      ..add(DiagnosticsProperty('leftRooms', leftRooms));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncRoomResponse &&
            const DeepCollectionEquality()
                .equals(other.joinedRooms, joinedRooms) &&
            const DeepCollectionEquality()
                .equals(other.invitedRooms, invitedRooms) &&
            const DeepCollectionEquality()
                .equals(other.knockedRooms, knockedRooms) &&
            const DeepCollectionEquality().equals(other.leftRooms, leftRooms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(joinedRooms),
      const DeepCollectionEquality().hash(invitedRooms),
      const DeepCollectionEquality().hash(knockedRooms),
      const DeepCollectionEquality().hash(leftRooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyncRoomResponseCopyWith<_$_SyncRoomResponse> get copyWith =>
      __$$_SyncRoomResponseCopyWithImpl<_$_SyncRoomResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyncRoomResponseToJson(
      this,
    );
  }
}

abstract class _SyncRoomResponse implements SyncRoomResponse {
  factory _SyncRoomResponse(
          {@JsonKey(name: 'join') final Map<String, Room>? joinedRooms,
          @JsonKey(name: 'invite') final Map<String, Room>? invitedRooms,
          @JsonKey(name: 'knock') final Map<String, Room>? knockedRooms,
          @JsonKey(name: 'leave') final Map<String, Room>? leftRooms}) =
      _$_SyncRoomResponse;

  factory _SyncRoomResponse.fromJson(Map<String, dynamic> json) =
      _$_SyncRoomResponse.fromJson;

  @override
  @JsonKey(name: 'join')
  Map<String, Room>? get joinedRooms;
  @override
  @JsonKey(name: 'invite')
  Map<String, Room>? get invitedRooms;
  @override // Can be handled later
  @JsonKey(name: 'knock')
  Map<String, Room>? get knockedRooms;
  @override
  @JsonKey(name: 'leave')
  Map<String, Room>? get leftRooms;
  @override
  @JsonKey(ignore: true)
  _$$_SyncRoomResponseCopyWith<_$_SyncRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
