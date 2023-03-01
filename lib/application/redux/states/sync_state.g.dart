// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SyncState _$$_SyncStateFromJson(Map<String, dynamic> json) => _$_SyncState(
      syncInterval: json['syncInterval'] as int?,
      syncPollTimeout: json['syncPollTimeout'] as int?,
      lastUpdate: json['lastUpdate'] as int?,
      lastAttempt: json['lastAttempt'] as int?,
      lastSince: json['lastSince'] as String?,
      backOff: json['backOff'] as int?,
    );

Map<String, dynamic> _$$_SyncStateToJson(_$_SyncState instance) =>
    <String, dynamic>{
      'syncInterval': instance.syncInterval,
      'syncPollTimeout': instance.syncPollTimeout,
      'lastUpdate': instance.lastUpdate,
      'lastAttempt': instance.lastAttempt,
      'lastSince': instance.lastSince,
      'backOff': instance.backOff,
    };
