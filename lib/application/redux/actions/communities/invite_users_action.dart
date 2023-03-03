import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class InviteUserAction extends ReduxAction<AppState> {
  InviteUserAction({
    required this.roomID,
    required this.userID,
    required this.client,
    this.onSuccess,
  });

  final String roomID;
  final String userID;
  final Function()? onSuccess;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(inviteMembersFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(inviteMembersFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await ChatAPI.inviteUsers(
      client: client,
      roomID: roomID,
      userID: userID,
    );

    if (<int>[200, 201, 202].contains(response.statusCode)) {
      onSuccess?.call();
      return state;
    }
    return null;
  }
}
