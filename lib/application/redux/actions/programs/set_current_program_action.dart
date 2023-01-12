import 'dart:async';

import 'package:pro_health_360/application/redux/actions/update_client_profile_action.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class SetCurrentProgramAction extends ReduxAction<AppState> {
  SetCurrentProgramAction({
    required this.client,
    this.onFailure,
    required this.programId,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final String programId;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setCurrentProgramFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setCurrentProgramFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'programID': programId,
    };

    final Response response = await client.query(
      setClientProgramMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: errorSelectingDefaultProgram,
          query: setClientProgramMutation,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        throw UserException(getErrorMessage('selecting current program'));
      }

      if ((body['data'] as Map<String, dynamic>).isNotEmpty) {
        final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
        final ClientState clientState = ClientState.fromJson(
          data['setClientProgram'] as Map<String, dynamic>,
        );

        dispatch(UpdateClientStateAction(clientState: clientState));
      }
    } else {
      throw UserException(processedResponse.message);
    }
    return null;
  }
}
