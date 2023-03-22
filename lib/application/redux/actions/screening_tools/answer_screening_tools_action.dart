import 'dart:async';

import 'package:pro_health_360/domain/core/entities/core/screening_tool_answer.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool_answers_list.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/alcohol_substance_use_state.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/contraceptive_state.dart';
import 'package:pro_health_360/application/redux/states/tb_state.dart';
import 'package:pro_health_360/application/redux/states/violence_state.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class AnswerScreeningToolsAction extends ReduxAction<AppState> {
  AnswerScreeningToolsAction({
    required this.client,
    required this.responses,
    required this.screeningToolId,
    required this.screeningToolsType,
  });

  final IGraphQlClient client;
  final String screeningToolId;
  final ScreeningToolAnswersList responses;
  final ScreeningToolsType screeningToolsType;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(answerScreeningQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(answerScreeningQuestionsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final List<Map<String, dynamic>> responsesList = <Map<String, dynamic>>[];
    for (final ScreeningToolAnswer? answer in responses.answersList!) {
      responsesList.add(answer!.toJson());
    }
    final Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'clientID': state.clientState?.clientProfile?.id,
        'screeningToolID': screeningToolId,
        'questionResponses': responsesList,
      }
    };
    final Response response = await client.query(
      answerScreeningToolQuestionMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(UserException(errors));

        throw UserException(getErrorMessage('posting answers'));
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data?['respondToScreeningTool'] == true) {
        dispatch(
          NavigateAction<AppState>.pushNamed(
            AppRoutes.successfulAssessmentSubmissionPage,
          ),
        );
        // log event
        await AnalyticsService().logEvent(
          name: successfulToolAssessmentEvent,
          eventType: AnalyticsEventType.INTERACTION,
          parameters: <String, dynamic>{
            'screeningToolType': screeningToolsType.name
          },
        );
      } else {
        dispatch(updateErrorAnsweringQuestions(type: screeningToolsType));
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }

  ReduxAction<AppState> updateErrorAnsweringQuestions({
    required ScreeningToolsType type,
  }) {
    switch (type) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return UpdateScreeningToolsState(
          violenceState: ViolenceState(errorAnsweringQuestions: true),
        );
      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return UpdateScreeningToolsState(
          contraceptiveState: ContraceptiveState(errorAnsweringQuestions: true),
        );

      case ScreeningToolsType.TB_ASSESSMENT:
        return UpdateScreeningToolsState(
          tbState: TBState(errorAnsweringQuestions: true),
        );
      default:
        return UpdateScreeningToolsState(
          alcoholSubstanceUseState:
              AlcoholSubstanceUseState(errorAnsweringQuestions: true),
        );
    }
  }
}
