import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/set_backoff_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/sync_params.dart';

class SyncAction extends ReduxAction<AppState> {
  SyncAction({required this.syncParams});

  final SyncParams? syncParams;

  @override
  void after() {
    super.after();
    if (syncParams?.forceFull ?? false) {
      dispatch(WaitAction<AppState>.remove(syncingEventsFlag));
    }
  }

  @override
  void before() {
    if (syncParams?.forceFull ?? false) {
      dispatch(WaitAction<AppState>.add(syncingEventsFlag));
    }
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    // Fetch the access token from state if not present in the params
    final String accessToken = syncParams?.accessToken ??
        (state.chatState?.userProfile?.accessToken ?? '');

    String? since = state.chatState?.syncResponse?.nextBatch;

    if (syncParams?.forceFull ?? false) {
      since = null;
    }

    final bool isFullSync =
        (syncParams?.forceFull ?? false) || (syncParams?.fullSync ?? false);

    final Map<String, dynamic> resp = await synchronizeEvents(
      SyncParams(
        accessToken: accessToken,
        fullState: syncParams?.fullState,
        fullSync: isFullSync,
        since: since,
        forceFull: syncParams?.forceFull,
        client: syncParams!.client,
      ),
    );

    if (resp.containsKey('error')) {
      final int currentBackoff = state.chatState?.syncState?.backOff ?? 0;
      final int newBackoff = currentBackoff != 0 ? currentBackoff + 1 : 5;

      dispatch(SetBackoffAction(backoff: newBackoff));
    }

    final SyncResponse response = SyncResponse.fromJson(resp);

    final Map<String, Room>? serverJoinedRooms = response.rooms?.joinedRooms;
    final Map<String, Room>? serverInvitedRooms = response.rooms?.invitedRooms;

    // Run initial room status
    if ((syncParams?.fullSync ?? false) || (syncParams?.forceFull ?? false)) {
      // For full sync
      final Map<String, Room>? parsedJoinedRooms =
          enrichRooms(serverJoinedRooms);
      final Map<String, Room>? parsedInvitedRooms =
          enrichRooms(serverInvitedRooms, invite: true);

      final SyncResponse? newSyncData = response.copyWith.rooms?.call(
        joinedRooms: parsedJoinedRooms,
        invitedRooms: parsedInvitedRooms,
      );

      dispatch(UpdateChatStateAction(syncResponse: newSyncData));

      if (kDebugMode) {
        print('[SyncAction] *** full sync completed ***');
      }

      return state;
    } else {
      // For room updates
      final Map<String, Room>? stateJoinedRooms =
          state.chatState?.syncResponse?.rooms?.joinedRooms;
      final Map<String, Room>? stateInvitedRooms =
          state.chatState?.syncResponse?.rooms?.invitedRooms;

      final Map<String, Room>? updatedJoinedRooms = updateRoomData(
        fromServer: serverJoinedRooms,
        fromState: stateJoinedRooms,
      );
      final Map<String, Room>? updatedInvitedRooms = updateRoomData(
        fromServer: serverInvitedRooms,
        fromState: stateInvitedRooms,
        invite: true,
      );

      // Mutate the current rooms we have
      if (updatedJoinedRooms != null) {
        stateJoinedRooms?.addAll(updatedJoinedRooms);
      }
      if (updatedInvitedRooms != null) {
        stateInvitedRooms?.addAll(updatedInvitedRooms);
      }

      final SyncResponse? updatedSyncData = response.copyWith.rooms?.call(
        joinedRooms: stateJoinedRooms,
        invitedRooms: stateInvitedRooms,
      );

      dispatch(UpdateChatStateAction(syncResponse: updatedSyncData));

      return state;
    }
  }
}
