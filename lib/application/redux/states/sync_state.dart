// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

part 'sync_state.freezed.dart';
part 'sync_state.g.dart';

@freezed
class SyncState with _$SyncState {
  factory SyncState({
    /// Milliseconds
    @JsonKey(name: 'syncInterval') int? syncInterval,

    /// Milliseconds
    @JsonKey(name: 'syncPollTimeout') int? syncPollTimeout,

    /// Last timestamp for actual new info
    @JsonKey(name: 'lastUpdate') int? lastUpdate,

    /// last attempt to sync
    @JsonKey(name: 'lastAttempt') int? lastAttempt,

    /// Since we last checked for new info
    @JsonKey(name: 'lastSince') String? lastSince,

    /// A timer we will use to poll
    @JsonKey(name: 'syncObserver', ignore: true) Timer? syncObserver,

    // Backoff value
    @JsonKey(name: 'backOff') int? backOff,
  }) = _SyncState;

  factory SyncState.fromJson(Map<String, dynamic> json) =>
      _$SyncStateFromJson(json);

  factory SyncState.initial() => SyncState(
        syncInterval: 5000,
        syncPollTimeout: 5000,
        lastUpdate: 0,
        lastAttempt: 0,
        lastSince: UNKNOWN,
        backOff: 0,
      );
}
