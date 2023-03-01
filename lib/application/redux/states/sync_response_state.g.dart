// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_response_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SyncResponse _$$_SyncResponseFromJson(Map<String, dynamic> json) =>
    _$_SyncResponse(
      presence: json['presence'] == null
          ? null
          : SyncPresence.fromJson(json['presence'] as Map<String, dynamic>),
      rooms: json['rooms'] == null
          ? null
          : SyncRoomResponse.fromJson(json['rooms'] as Map<String, dynamic>),
      nextBatch: json['next_batch'] as String?,
    );

Map<String, dynamic> _$$_SyncResponseToJson(_$_SyncResponse instance) =>
    <String, dynamic>{
      'presence': instance.presence,
      'rooms': instance.rooms,
      'next_batch': instance.nextBatch,
    };

_$_SyncPresence _$$_SyncPresenceFromJson(Map<String, dynamic> json) =>
    _$_SyncPresence(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SyncPresenceToJson(_$_SyncPresence instance) =>
    <String, dynamic>{
      'events': instance.events,
    };

_$_SyncRoomResponse _$$_SyncRoomResponseFromJson(Map<String, dynamic> json) =>
    _$_SyncRoomResponse(
      joinedRooms: (json['join'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Room.fromJson(e as Map<String, dynamic>)),
      ),
      invitedRooms: (json['invite'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Room.fromJson(e as Map<String, dynamic>)),
      ),
      knockedRooms: (json['knock'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Room.fromJson(e as Map<String, dynamic>)),
      ),
      leftRooms: (json['leave'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Room.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_SyncRoomResponseToJson(_$_SyncRoomResponse instance) =>
    <String, dynamic>{
      'join': instance.joinedRooms,
      'invite': instance.invitedRooms,
      'knock': instance.knockedRooms,
      'leave': instance.leftRooms,
    };
