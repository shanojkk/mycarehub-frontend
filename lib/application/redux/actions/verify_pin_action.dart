import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/bottom_nav_action.dart';
import 'package:pro_health_360/application/redux/actions/update_pin_input_details_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class VerifyPINAction extends ReduxAction<AppState> {
  VerifyPINAction({
    required this.inputPIN,
    required this.httpClient,
    required this.endpoint,
  });

  final String inputPIN;
  final IGraphQlClient httpClient;
  final String endpoint;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(verifyPINFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifyPINFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final int tries = state.miscState?.pinInputTries ?? 0;
    final String? userID = state.clientState?.user?.userId;

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.consumer.name,
      'pin': inputPIN,
    };

    /// fetch the data from the api
    final Response response = await httpClient.query(
      verifyPinQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = httpClient.toMap(response);
    final String? error = httpClient.parseError(responseMap);

    if (error != null) {
      if (error.contains('wrong PIN')) {
        dispatch(
          UpdatePINInputDetailsAction(
            pinInputTries: tries + 1,
            pinVerified: false,
          ),
        );
        return state;
      } else {
        reportErrorToSentry(
          hint: 'Error while verifying user PIN',
          query: verifyPinQuery,
          variables: variables,
          response: response,
          state: state,
        );
        throw const UserException(somethingWentWrongText);
      }
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['verifyPIN'] != null) {
      final bool pinVerified = data?['verifyPIN'] as bool;
      if (pinVerified) {
        dispatch(
          UpdatePINInputDetailsAction(
            pinInputTries: 0,
            pinVerified: pinVerified,
            healthPagePINInputTime: DateTime.now().toString(),
            maxTryTime: '',
          ),
        );

        dispatch(BottomNavAction(currentBottomNavIndex: 2));

        dispatch(
          NavigateAction<AppState>.pushReplacementNamed(AppRoutes.myHealthPage),
        );
      }
    }
    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
