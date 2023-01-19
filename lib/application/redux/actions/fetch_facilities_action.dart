import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_facility_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchFacilitiesAction extends ReduxAction<AppState> {
  FetchFacilitiesAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchFacilitiesFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchFacilitiesFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String? clientID = state.clientState?.clientProfile?.id;

    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': 1,
      },
    };

    /// fetch the data from the api
    final Response response = await client.query(
      getClientFacilitiesQuery,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> payLoad = client.toMap(response);
      final String? error = parseError(payLoad);

      if (error != null) {
        Sentry.captureException(UserException(error));
        throw UserException(getErrorMessage('fetching facilities'));
      }

      final List<Facility> facilities = <Facility>[];
      final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;

      final Map<String, dynamic> facilitiesMap =
          data['getClientFacilities'] as Map<String, dynamic>;

      final List<dynamic> facilitiesData =
          facilitiesMap['Facilities'] as List<dynamic>;

      for (final dynamic facilityItem in facilitiesData) {
        facilities.add(Facility.fromJson(facilityItem as Map<String, dynamic>));
      }

      dispatch(UpdateFacilityStateAction(facilities: facilities));
      if (facilities.length < 2) {
        dispatch(
          UpdateFacilityStateAction(
            currentFacility:
                facilities.isNotEmpty ? facilities.first : Facility.initial(),
          ),
        );
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return state;
  }
}
