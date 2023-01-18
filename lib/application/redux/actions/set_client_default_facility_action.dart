import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_facility_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class SetClientDefaultFacilityAction extends ReduxAction<AppState> {
  SetClientDefaultFacilityAction({
    required this.client,
    this.onFailure,
    required this.facility,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final Facility facility;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setDefaultFacilityFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setDefaultFacilityFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facility.id,
      'userID': state.clientState?.clientProfile?.user?.userId
    };

    final Response response = await client.query(
      setClientDefaultFacilityMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: errorSelectingDefaultFacility,
          query: setClientDefaultFacilityMutation,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        throw UserException(getErrorMessage('selecting facility'));
      }
      if ((body['data'] as Map<String, dynamic>)['setClientDefaultFacility'] ==
          true) {
        dispatch(
          UpdateFacilityStateAction(
            currentFacility: facility,
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
    return null;
  }
}
