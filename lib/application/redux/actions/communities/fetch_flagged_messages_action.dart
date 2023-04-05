import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class FetchFlaggedMessagesAction extends ReduxAction<AppState> {
  FetchFlaggedMessagesAction({
    required this.roomID,
    required this.client,
    this.onError,
  });

  final String roomID;
  final IGraphQlClient client;
  final Function()? onError;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchFlaggedMessagesFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchFlaggedMessagesFlag));
  }

  @override
  Future<AppState?> reduce() async {
    // Fetch reported events
    final Response response =
        await ChatAPI.fetchReportedEvents(roomID: roomID, client: client);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Response resp = processedResponse.response;

      final Map<String, dynamic> decodedResponse =
          json.decode(resp.body) as Map<String, dynamic>;

      final List<dynamic> chunk =
          decodedResponse['event_reports'] as List<dynamic>;

      final List<EventReport> reportedEvents = chunk.map((dynamic event) {
        return EventReport.fromJson(event as Map<String, dynamic>);
      }).toList();

      final AppState? newState =
          state.copyWith.chatState?.call(flaggedMessageEvents: reportedEvents);

      return newState;
    } else {
      onError?.call();

      return null;
    }
  }
}
