import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/caregiver/update_caregiver_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/caregiver/managed_client.dart';
import 'package:pro_health_360/domain/core/entities/caregiver/managed_client_response.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchManagedClientsAction extends ReduxAction<AppState> {
  FetchManagedClientsAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchManagedClientsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(
      UpdateCaregiverProfileAction(
        managedClients: <ManagedClient>[],
        selectedClientId: UNKNOWN,
        errorFetchingClients: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchManagedClientsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String caregiverID = state.caregiverState?.user?.userId ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'caregiverID': caregiverID,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': 1,
      },
    };

    /// fetch the data from the api
    final Response response = await client.query(
      getCaregiverManagedClientsQuery,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> payLoad = client.toMap(response);
      final String? error = parseError(payLoad);

      if (error != null) {
        Sentry.captureException(UserException(error));
        dispatch(
          UpdateCaregiverProfileAction(
            errorFetchingClients: true,
          ),
        );
        return state;
      }

      final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;

      final ManagedClientsResponse managedClientsResponse =
          ManagedClientsResponse.fromJson(data);

      final List<ManagedClient>? managedClients =
          managedClientsResponse.managedClients?.clients;

      dispatch(UpdateCaregiverProfileAction(managedClients: managedClients));
      if ((managedClients?.length ?? 0) < 1) {
        dispatch(
          UpdateCaregiverProfileAction(managedClients: <ManagedClient>[]),
        );
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          ),
        );
      }
    } else {
      Sentry.captureException(
        const UserException('error fetching caregiver clients'),
      );
      dispatch(
        UpdateCaregiverProfileAction(
          errorFetchingClients: true,
        ),
      );
    }

    return state;
  }
}
