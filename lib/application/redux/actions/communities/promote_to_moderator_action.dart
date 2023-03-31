import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_room_members_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class PromoteToModeratorAction extends ReduxAction<AppState> {
  PromoteToModeratorAction({
    required this.roomID,
    required this.userID,
    required this.client,
    this.onSuccess,
  });

  // The room to ban the user from
  final String roomID;

  // The user to kick
  final String userID;

  final Function()? onSuccess;

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(promoteToModFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(promoteToModFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await ChatAPI.promoteToModerator(
      client: client,
      roomID: roomID,
      userID: userID,
    );

    if (response.statusCode == 408) {
      /// handle errors here

    }

    final Map<String, dynamic> decodedResponse =
        json.decode(response.body) as Map<String, dynamic>;

    if (decodedResponse['errcode'] != null) {
      // TODO(abiud):  Handle errors here
      return null;
    }

    if (decodedResponse.containsKey('event_id')) {
      /// Process
      if (onSuccess != null) onSuccess?.call();
      store.dispatch(FetchRoomMembersAction(roomID: roomID, client: client));

      return state;
    }

    return null;
  }
}
