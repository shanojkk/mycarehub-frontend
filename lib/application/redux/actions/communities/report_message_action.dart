import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class ReportMessageACtion extends ReduxAction<AppState> {
  ReportMessageACtion({
    required this.roomID,
    required this.eventID,
    required this.client,
    this.reason,
    this.onSuccess,
    this.onError,
  });

  // The room to report the message
  final String roomID;

  // The user to kick
  final String eventID;

  // Reason for kicking the user
  final String? reason;

  final Function()? onSuccess;

  final Function()? onError;

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(reportMessageFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(reportMessageFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await ChatAPI.reportMessage(
      client: client,
      roomID: roomID,
      eventID: eventID,
      reason: reason,
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
