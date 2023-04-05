import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class FetchEventReportAction extends ReduxAction<AppState> {
  FetchEventReportAction({
    required this.reportID,
    required this.client,
    this.onError,
    this.onSuccess,
  });

  final String reportID;
  final IGraphQlClient client;
  final Function()? onError;
  final Function()? onSuccess;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchEventReport));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchEventReport));
  }

  @override
  Future<AppState?> reduce() async {
    // Fetch state ban events
    final Response response =
        await ChatAPI.fetchMessageReport(client: client, reportID: reportID);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Response resp = processedResponse.response;

      final Map<String, dynamic> decodedResponse =
          json.decode(resp.body) as Map<String, dynamic>;

      final EventReport report = EventReport.fromJson(decodedResponse);

      final AppState? newState =
          state.copyWith.chatState?.call(selectedFlaggedMessage: report);

      return newState;
    } else {
      onError?.call();

      return null;
    }
  }
}
