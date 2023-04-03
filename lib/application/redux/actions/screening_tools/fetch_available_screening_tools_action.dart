import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/available_screening_tools.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';

class FetchAvailableScreeningToolsAction extends ReduxAction<AppState> {
  FetchAvailableScreeningToolsAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAvailableScreeningToolsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchAvailableScreeningToolsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response =
        await client.query(getAvailableScreeningToolQuery, <String, dynamic>{});

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(UserException(errors));

        throw UserException(
          getErrorMessage('fetching available screening tools'),
        );
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final List<dynamic>? availableScreeningTools =
          data?['getAvailableScreeningTools'] as List<dynamic>?;

      final List<ScreeningTool> screeningToolsList = <ScreeningTool>[];

      if (availableScreeningTools != null &&
          availableScreeningTools.isNotEmpty) {
        for (final dynamic screeningTool in availableScreeningTools) {
          screeningToolsList.add(
            ScreeningTool.fromJson(screeningTool as Map<String, dynamic>),
          );
        }

        dispatch(
          UpdateScreeningToolsState(
            availableScreeningTools: AvailableScreeningTools(
              availableScreeningTools: screeningToolsList,
            ),
          ),
        );
      } else {
        dispatch(
          UpdateScreeningToolsState(
            availableScreeningTools: AvailableScreeningTools(
              errorFetchingQuestions: true,
            ),
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
