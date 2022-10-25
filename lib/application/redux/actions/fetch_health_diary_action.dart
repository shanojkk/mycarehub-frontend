import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_health_diary_state.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class FetchHealthDiaryAction extends ReduxAction<AppState> {
  FetchHealthDiaryAction({
    required this.client,
    this.filter,
    this.shared,
  });

  final IGraphQlClient client;
  final String? filter;
  // if required to only fetch shared diary entries
  final bool? shared;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchHealthDiaryFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(
      UpdateHealthDiaryStateActon(
        errorFetchingDiaryEntries: false,
        timeoutFetchingEntries: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchHealthDiaryFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String? clientID = state.clientState!.id;
    final String? moodType =
        (filter == MoodTypeFilter.ALL.value) ? null : filter;

    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID,
      'moodType': moodType,
      'shared': shared
    };

    /// fetch the data from the api
    final Response response = await client.query(
      getHealthDiaryEntriesQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchHealthDiaryErrorString,
        query: getHealthDiaryEntriesQuery,
        variables: variables,
        response: response,
        state: state,
      );

      if (error == 'timeout') {
        dispatch(UpdateHealthDiaryStateActon(timeoutFetchingEntries: true));
        return null;
      }

      dispatch(UpdateHealthDiaryStateActon(errorFetchingDiaryEntries: true));
      return null;
    }

    final HealthDiaryEdge healthDiaryContent = HealthDiaryEdge.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (healthDiaryContent.entries != null) {
      final List<HealthDiaryEntry>? entries = healthDiaryContent.entries;

      dispatch(UpdateHealthDiaryStateActon(diaryEntries: entries));
    }

    return state;
  }
}
