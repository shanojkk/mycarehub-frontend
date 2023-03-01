// Package imports:

// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/application/redux/states/sync_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/client/utils.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/user.dart';

part 'chat_state.freezed.dart';
part 'chat_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatState with _$ChatState {
  factory ChatState({
    @JsonKey(name: 'userProfile') User? userProfile,
    @JsonKey(name: 'groupInfoMembers') List<RoomUser>? groupInfoMembers,
    @JsonKey(name: 'searchMemberResults') List<User>? searchMemberResults,
    @JsonKey(name: 'messages') List<Message>? messages,
    @Uint8ListConverter()
    @JsonKey(name: 'images')
        List<Map<String, Uint8List?>?>? images,

    // Final string lastSyncTime for chats
    @JsonKey(name: 'lastSyncTime') String? lastSyncTime,

    // Specific for rooms
    @JsonKey(name: 'syncResponse') SyncResponse? syncResponse,

    // Specific for the sync observer settings
    @JsonKey(name: 'syncState') SyncState? syncState,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);

  factory ChatState.initial() => ChatState(
        userProfile: User.initial(),
        groupInfoMembers: <RoomUser>[],
        searchMemberResults: <User>[],
        messages: <Message>[],
        images: <Map<String, Uint8List?>?>[],
        lastSyncTime: UNKNOWN,
        syncResponse: SyncResponse.initial(),
        syncState: SyncState.initial(),
      );
}
