import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class ReadNotificationsAction extends ReduxAction<AppState> {
  ReadNotificationsAction({
    required this.client,
    required this.ids,
  });

  final IGraphQlClient client;
  final List<String?> ids;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchNotificationsFlag));
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchNotificationsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Response result = await client.query(
      readNotificationsMutation,
      <String, dynamic>{
        'ids': ids,
      },
    );

    final ProcessedResponse processedResponse = processHttpResponse(result);
    client.close();

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(result);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: readNotificationsErrorString,
          state: state,
          query: readNotificationsMutation,
          response: result,
          exception: errors,
        );

        throw UserException(getErrorMessage('fetching notifications'));
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final bool? readNotifications = data?['readNotifications'] as bool?;

      if (readNotifications == null || !readNotifications) {
        reportErrorToSentry(
          hint: readNotificationsErrorString,
          state: state,
          query: readNotificationsMutation,
          response: result,
          exception: errors,
        );

        throw UserException(getErrorMessage('fetching notifications'));
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
