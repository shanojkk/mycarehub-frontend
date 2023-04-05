import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/application/redux/states/sync_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/user.dart';

part 'chat_state.freezed.dart';
part 'chat_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatState with _$ChatState {
  factory ChatState({
    @JsonKey(name: 'userProfile') User? userProfile,

    /// Stores a group's members
    @JsonKey(name: 'groupInfoMembers') List<RoomUser>? groupInfoMembers,

    /// Stores results for searching members
    @JsonKey(name: 'searchMemberResults') List<User>? searchMemberResults,

    // A list of banned users
    @JsonKey(name: 'bannedUserIDs') List<String?>? bannedUserIDs,

    /// A list for flagged message events
    @JsonKey(name: 'flagged_message_events')
        List<EventReport?>? flaggedMessageEvents,

    // Final string lastSyncTime for chats
    @JsonKey(name: 'lastSyncTime') String? lastSyncTime,

    // Specific for rooms
    @JsonKey(name: 'syncResponse') SyncResponse? syncResponse,

    // Specific for the sync observer settings
    @JsonKey(name: 'syncState') SyncState? syncState,

    // The currently selected room
    @JsonKey(name: 'selectedRoom') String? selectedRoom,

    /// The flagged message being viewed
    @JsonKey(name: 'selected_flagged_message')
        EventReport? selectedFlaggedMessage,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);

  factory ChatState.initial() => ChatState(
        userProfile: User.initial(),
        groupInfoMembers: <RoomUser>[],
        searchMemberResults: <User>[],
        bannedUserIDs: <String>[],
        flaggedMessageEvents: <EventReport>[],
        lastSyncTime: UNKNOWN,
        syncResponse: SyncResponse.initial(),
        syncState: SyncState.initial(),
        selectedRoom: UNKNOWN,
        selectedFlaggedMessage: EventReport.initial(),
      );
}
