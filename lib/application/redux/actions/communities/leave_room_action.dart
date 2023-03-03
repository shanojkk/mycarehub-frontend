import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/sync_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/sync_params.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class LeaveRoomAction extends ReduxAction<AppState> {
  LeaveRoomAction({
    required this.roomID,
    required this.client,
    this.onSuccess,
  });

  // The room to ban the user from
  final String roomID;

  final Function()? onSuccess;

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(leaveRoomFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(leaveRoomFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Response response =
        await ChatAPI.leaveRoom(client: client, roomID: roomID);

    if (response.statusCode == 408) {
      /// handle errors here

    }

    final Map<String, dynamic> decodedResponse =
        json.decode(response.body) as Map<String, dynamic>;

    if (decodedResponse['errcode'] != null) {
      // Handle errors here
      return null;
    }

    /// Remove room from state here
    final Map<String, Room>? joinedRoomsFromState =
        state.chatState?.syncResponse?.rooms?.joinedRooms;
    joinedRoomsFromState
        ?.removeWhere((String key, Room value) => key == roomID);

    final AppState? newState = state.copyWith.chatState?.syncResponse?.rooms
        ?.call(joinedRooms: joinedRoomsFromState);

    /// Run a full sync here
    dispatch(
      SyncAction(
        syncParams: SyncParams(
          fullState: true,
          fullSync: true,
          forceFull: true,
          client: client,
        ),
      ),
    );

    if (onSuccess != null) onSuccess?.call();

    return newState;
  }
}
