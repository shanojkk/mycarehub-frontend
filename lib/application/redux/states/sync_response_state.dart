// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';

part 'sync_response_state.freezed.dart';
part 'sync_response_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SyncResponse with _$SyncResponse {
  factory SyncResponse({
    @JsonKey(name: 'presence') SyncPresence? presence,
    @JsonKey(name: 'rooms') SyncRoomResponse? rooms,
    @JsonKey(name: 'next_batch') String? nextBatch,
  }) = _SyncResponse;

  factory SyncResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncResponseFromJson(json);

  factory SyncResponse.initial() => SyncResponse(
        presence: SyncPresence.initial(),
        rooms: SyncRoomResponse.initial(),
        nextBatch: UNKNOWN,
      );
}

@freezed
class SyncPresence with _$SyncPresence {
  factory SyncPresence({
    @JsonKey(name: 'events') List<Message?>? events,
  }) = _SyncPresence;

  factory SyncPresence.fromJson(Map<String, dynamic> json) =>
      _$SyncPresenceFromJson(json);

  factory SyncPresence.initial() => SyncPresence(events: <Message>[]);
}

@Freezed(makeCollectionsUnmodifiable: false)
class SyncRoomResponse with _$SyncRoomResponse {
  factory SyncRoomResponse({
    @JsonKey(name: 'join') Map<String, Room>? joinedRooms,
    @JsonKey(name: 'invite') Map<String, Room>? invitedRooms,

    // Can be handled later
    @JsonKey(name: 'knock') Map<String, Room>? knockedRooms,
    @JsonKey(name: 'leave') Map<String, Room>? leftRooms,
  }) = _SyncRoomResponse;

  factory SyncRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncRoomResponseFromJson(json);

  factory SyncRoomResponse.initial() => SyncRoomResponse(
        joinedRooms: <String, Room>{},
        invitedRooms: <String, Room>{},
        knockedRooms: <String, Room>{},
        leftRooms: <String, Room>{},
      );
}
