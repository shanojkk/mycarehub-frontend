import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
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

    final bool isFullSync = syncParams?.forceFull ?? false;

    final SyncResponse response = await synchronizeEvents(
      SyncParams(
        accessToken: accessToken,
        fullState: syncParams?.fullState,
        fullSync: isFullSync,
        since: since,
        forceFull: syncParams?.forceFull,
        client: syncParams!.client,
      ),
    );

    final Map<String, Room>? serverJoinedRooms = response.rooms?.joinedRooms;
    final Map<String, Room>? serverInvitedRooms = response.rooms?.invitedRooms;

    // Run initial room status
    if ((syncParams?.fullSync ?? false) || (syncParams?.forceFull ?? false)) {
      // For full sync
      final Map<String, Room>? parsedJoinedRooms =
          parseSyncRooms(serverJoinedRooms);
      final Map<String, Room>? parsedInvitedRooms =
          parseSyncRooms(serverInvitedRooms, invite: true);

      final SyncResponse? newSyncData = response.copyWith.rooms?.call(
        joinedRooms: parsedJoinedRooms,
        invitedRooms: parsedInvitedRooms,
      );

      dispatch(UpdateChatStateAction(syncResponse: newSyncData));

      return state;
    } else {
      // For room updates
      final Map<String, Room>? stateJoinedRooms =
          state.chatState?.syncResponse?.rooms?.joinedRooms;
      final Map<String, Room>? stateInvitedRooms =
          state.chatState?.syncResponse?.rooms?.invitedRooms;

      final Map<String, Room>? updatedJoinedRooms = updateRoomData(
        serverJoinedRooms,
        stateJoinedRooms,
      );
      final Map<String, Room>? updatedInvitedRooms = updateRoomData(
        serverInvitedRooms,
        stateInvitedRooms,
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
