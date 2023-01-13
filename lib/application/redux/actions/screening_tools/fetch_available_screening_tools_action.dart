import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/utils.dart';

import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/available_screening_tools.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class FetchAvailableScreeningToolsAction extends ReduxAction<AppState> {
  FetchAvailableScreeningToolsAction({required this.context});

  final BuildContext context;

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
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': state.clientState!.id,
    };
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final Response response =
        await client.query(getAvailableScreeningToolQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchAvailableScreeningToolsErrorString,
          state: state,
          query: getAvailableScreeningToolQuery,
          response: response,
          exception: errors,
          variables: variables,
        );

        throw UserException(
          getErrorMessage('fetching available screening tools'),
        );
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final List<dynamic>? availableScreeningTools =
          data?['getAvailableScreeningToolQuestions'] as List<dynamic>?;

      final List<ScreeningTool> screeningToolsList = <ScreeningTool>[];

      if (availableScreeningTools != null &&
          availableScreeningTools.isNotEmpty) {
        for (final dynamic screeningTool in availableScreeningTools) {
          final Map<String, dynamic>? tool =
              screeningTool as Map<String, dynamic>?;

          final ScreeningToolsType toolType =
              screeningToolsTypeFromString(tool?['toolType'] as String);

          screeningToolsList.add(
            ScreeningTool(
              title: getScreeningToolTitle(toolType),
              description: getScreeningToolDescription(toolType),
              toolType: toolType,
            ),
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

  String getScreeningToolTitle(ScreeningToolsType toolsType) {
    switch (toolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return violenceTitle;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return contraceptiveTitle;

      case ScreeningToolsType.TB_ASSESSMENT:
        return tuberculosisTitle;

      default:
        return alcoholSubstanceUseTitle;
    }
  }

  String getScreeningToolDescription(ScreeningToolsType toolsType) {
    switch (toolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return violenceDescription;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return contraceptiveDescription;

      case ScreeningToolsType.TB_ASSESSMENT:
        return tuberculosisDescription;

      default:
        return alcoholSubstanceUseTitle;
    }
  }

  ScreeningToolsType screeningToolsTypeFromString(String toolType) {
    switch (toolType) {
      case 'VIOLENCE_ASSESSMENT':
        return ScreeningToolsType.VIOLENCE_ASSESSMENT;
      case 'CONTRACEPTIVE_ASSESSMENT':
        return ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT;
      case 'TB_ASSESSMENT':
        return ScreeningToolsType.TB_ASSESSMENT;
      default:
        return ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT;
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == UserException) {
      return error;
    }
    return error;
  }
}
