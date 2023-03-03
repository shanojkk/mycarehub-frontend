import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/user.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class FetchRoomMembersAction extends ReduxAction<AppState> {
  FetchRoomMembersAction({required this.roomID, required this.client});

  final String roomID;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchRoomMembersFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchRoomMembersFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final List<RoomUser> usersList =
        await ChatAPI.fetchRoomMembers(roomID: roomID, client: client);

    final AppState? newState =
        state.copyWith.chatState?.call(groupInfoMembers: usersList);

    return newState;
  }
}
