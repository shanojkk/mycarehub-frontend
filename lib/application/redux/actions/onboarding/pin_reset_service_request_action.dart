import 'dart:async';

import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PINResetServiceRequestAction extends ReduxAction<AppState> {
  PINResetServiceRequestAction({
    required this.client,
    required this.pinResetServiceRequestEndpoint,
    this.onError,
    this.onSuccess,
    required this.cccNumber,
  });

  final String cccNumber;
  final IGraphQlClient client;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;
  final String pinResetServiceRequestEndpoint;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(pinResetServiceRequestFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(pinResetServiceRequestFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String userName = state.onboardingState?.userName ?? '';
    final Map<String, dynamic> variables = <String, dynamic>{
      'cccNumber': cccNumber,
      'username': userName,
      'flavour': Flavour.consumer.name,
    };
    final Response response = await client.callRESTAPI(
      endpoint: pinResetServiceRequestEndpoint,
      method: httpPOST,
      variables: variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);
    final ProcessedResponse processedResponse = processHttpResponse(response);
    if (processedResponse.ok) {
      final bool? status = payLoad['status'] as bool?;
      if (status != null && status) {
        onSuccess?.call();
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.pinRequestSentPage,
            (Route<dynamic> route) => false,
          ),
        );

        await AnalyticsService().logEvent(
          name: pinResetServiceRequestEvent,
          eventType: AnalyticsEventType.ONBOARDING,
        );

        return state;
      } else {
        onError?.call();
        Sentry.captureException('PIN service request failed');
        return null;
      }
    }

    final String? error = parseError(payLoad);

    if (error != null) {
      onError?.call();
      reportErrorToSentry(
        hint: error,
        variables: variables,
        response: response,
      );
    }

    return null;
  }
}
