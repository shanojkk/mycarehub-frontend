import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SendMessageAction extends ReduxAction<AppState> {
  SendMessageAction({
    required this.roomID,
    required this.message,
    required this.client,
    this.onSuccess,
  });

  final String roomID;
  final String message;
  final Function(String roomID)? onSuccess;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sendMessageFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(sendMessageFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> data = await ChatAPI.sendMessage(
      client: client,
      roomID: roomID,
      message: message,
    );

    if (client.parseError(data) != null) {
      // Throw an error here
      return null;
    }

    if (data['event_id'] != null) {
      onSuccess?.call(data['event_id']?.toString() ?? '');
    }

    return null;
  }
}
