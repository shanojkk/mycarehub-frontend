import 'dart:async';

import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/alcohol_substance_use_state.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/contraceptive_state.dart';
import 'package:pro_health_360/application/redux/states/tb_state.dart';
import 'package:pro_health_360/application/redux/states/violence_state.dart';

class FetchScreeningToolsQuestionsAction extends ReduxAction<AppState> {
  FetchScreeningToolsQuestionsAction({
    required this.screeningToolId,
    required this.client,
    required this.screeningToolName,
  });

  final IGraphQlClient client;
  final String screeningToolId;
  final String screeningToolName;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchingQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchingQuestionsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'id': screeningToolId
    };
    final Response response = await client.query(
      getScreeningToolsQuestionsQuery,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(UserException(errors));
        throw UserException(getErrorMessage('fetching questions'));
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if ((data?['getScreeningToolByID'] as Map<String, dynamic>).isNotEmpty) {
        final ScreeningTool screeningTool = ScreeningTool.fromJson(
          data!['getScreeningToolByID'] as Map<String, dynamic>,
        );

        if (screeningTool.questionnaire?.screeningQuestions?.isNotEmpty ??
            false) {
          dispatch(
            updateScreeningToolsQuestions(
              screeningTool: screeningTool,
              toolName: screeningTool.questionnaire?.name ?? '',
            ),
          );
        }
      }
    } else {
      dispatch(
        updateErrorScreeningToolsQuestions(toolName: screeningToolName),
      );
      throw UserException(processedResponse.message);
    }

    return null;
  }

  ReduxAction<AppState> updateErrorScreeningToolsQuestions({
    required String toolName,
  }) {
    switch (toolName) {
      case 'Violence Assessment':
        return UpdateScreeningToolsState(
          violenceState: ViolenceState(errorFetchingQuestions: true),
        );

      case 'TB Assessment':
        return UpdateScreeningToolsState(
          tbState: TBState(errorFetchingQuestions: true),
        );
      case 'Alcohol and Substance Assessment':
        return UpdateScreeningToolsState(
          alcoholSubstanceUseState:
              AlcoholSubstanceUseState(errorFetchingQuestions: true),
        );
      default:
        return UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(errorFetchingQuestions: true),
        );
    }
  }

  ReduxAction<AppState> updateScreeningToolsQuestions({
    required String toolName,
    required ScreeningTool screeningTool,
  }) {
    switch (toolName) {
      case 'Violence Assessment':
        return UpdateScreeningToolsState(
          violenceState: ViolenceState(
            screeningTool: screeningTool,
          ),
        );

      case 'TB Assessment':
        return UpdateScreeningToolsState(
          tbState: TBState(
            screeningTool: screeningTool,
          ),
        );
      case 'Alcohol and Substance Assessment':
        return UpdateScreeningToolsState(
          alcoholSubstanceUseState: AlcoholSubstanceUseState(
            screeningTool: screeningTool,
          ),
        );
      default:
        return UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(
            screeningTool: screeningTool,
          ),
        );
    }
  }
}
