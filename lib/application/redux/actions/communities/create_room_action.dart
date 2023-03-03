import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class CreateRoomAction extends ReduxAction<AppState> {
  CreateRoomAction({
    required this.roomName,
    required this.topic,
    required this.client,
    this.onSuccess,
  });

  final String? roomName;
  final String? topic;
  final Function(String roomID)? onSuccess;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createRoomFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(createRoomFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> decodedResponse = await ChatAPI.createRoom(
      client: client,
      roomName: roomName ?? '',
      topic: topic ?? '',
    );

    if (decodedResponse['room_id'] != null) {
      onSuccess?.call(decodedResponse['room_id']?.toString() ?? '');

      return state;
    }

    return null;
  }
}
