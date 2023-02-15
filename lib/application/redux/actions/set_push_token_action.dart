import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/src/response.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_credentials_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SetPushToken extends ReduxAction<AppState> {
  SetPushToken({
    required this.client,
    required this.token,
  });

  final IGraphQlClient client;
  final String token;

  @override
  Future<AppState?> reduce() async {
    if (state.credentials?.isSignedIn ?? false) {
      final String tokenFromState = state.credentials?.pushToken ?? UNKNOWN;
      if (tokenFromState.compareTo(token) == 0) return null;

      final Map<String, dynamic> variables = <String, dynamic>{'token': token};
      final Response response =
          await client.query(setPushTokenMutation, variables);

      final ProcessedResponse processed = processHttpResponse(response);

      if (processed.ok) {
        final Map<String, dynamic> responseBody = client.toMap(response);

        final String? errors = client.parseError(responseBody);

        if (errors != null) {
          reportErrorToSentry(
            hint: failedToSetPushTokenHint,
            state: state,
            response: response,
            query: setPushTokenMutation,
            variables: variables,
            exception: errors,
          );
        }
        dispatch(
          UpdateCredentialsAction(pushToken: token),
        );
        return null;
      } else {
        reportErrorToSentry(
          hint: failedToSetPushTokenHint,
          state: state,
          response: response,
          query: setPushTokenMutation,
          variables: variables,
          exception: UserException(getErrorMessage()),
        );
      }

      return null;
    }

    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
