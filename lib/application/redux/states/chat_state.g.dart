// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatState _$$_ChatStateFromJson(Map<String, dynamic> json) => _$_ChatState(
      userProfile: json['userProfile'] == null
          ? null
          : User.fromJson(json['userProfile'] as Map<String, dynamic>),
      groupInfoMembers: (json['groupInfoMembers'] as List<dynamic>?)
          ?.map((e) => RoomUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchMemberResults: (json['searchMemberResults'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      bannedUserIDs: (json['bannedUserIDs'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      lastSyncTime: json['lastSyncTime'] as String?,
      syncResponse: json['syncResponse'] == null
          ? null
          : SyncResponse.fromJson(json['syncResponse'] as Map<String, dynamic>),
      syncState: json['syncState'] == null
          ? null
          : SyncState.fromJson(json['syncState'] as Map<String, dynamic>),
      selectedRoom: json['selectedRoom'] as String?,
    );

Map<String, dynamic> _$$_ChatStateToJson(_$_ChatState instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'groupInfoMembers': instance.groupInfoMembers,
      'searchMemberResults': instance.searchMemberResults,
      'messages': instance.messages,
      'bannedUserIDs': instance.bannedUserIDs,
      'lastSyncTime': instance.lastSyncTime,
      'syncResponse': instance.syncResponse,
      'syncState': instance.syncState,
      'selectedRoom': instance.selectedRoom,
    };
