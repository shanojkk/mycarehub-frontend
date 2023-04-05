import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_flagged_messages_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class DeleteMessageReportAction extends ReduxAction<AppState> {
  DeleteMessageReportAction({
    required this.client,
    required this.roomID,
    this.onError,
    this.onSuccess,
  });

  final String roomID;

  final IGraphQlClient client;
  final Function()? onError;
  final Function()? onSuccess;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(deleteMessageEventReport));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(deleteMessageEventReport));
  }

  @override
  Future<AppState?> reduce() async {
    final int reportID = state.chatState?.selectedFlaggedMessage?.reportID ?? 0;

    // Fetch state ban events
    final Response response = await ChatAPI.deleteMessageReport(
      client: client,
      reportID: reportID.toString(),
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      onSuccess?.call();

      dispatch(FetchFlaggedMessagesAction(client: client, roomID: roomID));

      return state;
    } else {
      onError?.call();

      return null;
    }
  }
}
