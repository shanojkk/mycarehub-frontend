import 'dart:async';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/surveys/fetch_available_surveys_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/surveys/survey.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class VerifySurveySubmissionAction extends ReduxAction<AppState> {
  VerifySurveySubmissionAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifySurveySubmissionFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(verifySurveySubmissionFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Survey selectedSurvey =
        state.miscState!.selectedSurvey ?? Survey.initial();
    final Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'projectID': selectedSurvey.projectID,
        'formID': selectedSurvey.formID,
        'submitterID': selectedSurvey.linkID
      },
    };

    final Response response =
        await client.query(verifySurveySubmissionMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);
    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: verifySurveySubmissionErrorString,
          state: state,
          query: verifySurveySubmissionMutation,
          response: response,
          exception: errors,
          variables: variables,
        );

        throw UserException(
          getErrorMessage('verifying survey submission'),
        );
      }

      dispatch(FetchAvailableSurveysAction(client: client));
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
