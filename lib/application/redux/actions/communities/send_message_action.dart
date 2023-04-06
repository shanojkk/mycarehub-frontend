import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SendMessageAction extends ReduxAction<AppState> {
  SendMessageAction({
    required this.roomID,
    required this.message,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  final String roomID;
  final String message;
  final Function()? onSuccess;
  final Function()? onError;

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
    final Response response = await ChatAPI.sendMessage(
      client: client,
      roomID: roomID,
      message: message,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      onSuccess?.call();

      return state;
    } else {
      onError?.call();
      return null;
    }
  }
}
