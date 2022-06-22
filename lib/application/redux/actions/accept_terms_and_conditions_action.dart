// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/redux/actions/update_terms_and_conditions_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/accept_terms_and_conditions_response.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/domain/core/value_objects/exception_tag.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

class AcceptTermsAndConditionsAction extends ReduxAction<AppState> {
  AcceptTermsAndConditionsAction({
    required this.context,
    required this.shouldPop,
  });

  final BuildContext context;
  final bool shouldPop;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(acceptTermsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(acceptTermsFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final int acceptedTermsID =
        state.onboardingState!.termsAndConditions!.termsId;
    final String? userID = state.clientState!.user!.userId;

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      acceptTermsAndConditionsMutation,
      getTermsVariables(termsId: acceptedTermsID, userId: userID!),
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap.isEmpty) {
      throw MyAfyaException(
        cause: acceptTermsTag,
        message: somethingWentWrongText,
      );
    }

    final AcceptTermsAndConditionsResponse acceptTermsAndConditionsResponse =
        AcceptTermsAndConditionsResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateTermsAndConditionsAction(
        isAccepted: acceptTermsAndConditionsResponse.acceptTerms,
      ),
    );

    final OnboardingPathInfo navConfig = onboardingPath(appState: state);

    if (shouldPop) {
      Navigator.pop(context);
      return state;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      navConfig.nextRoute,
      (Route<dynamic> route) => false,
      arguments: navConfig.arguments,
    );

    final CurrentOnboardingStage? onboardingStage =
        state.onboardingState?.currentOnboardingStage;

    AnalyticsService().logEvent(
      name: acceptTermsEvent,
      eventType: AnalyticsEventType.ONBOARDING,
      parameters: <String, dynamic>{
        'next_page': navConfig.nextRoute,
        'current_onboarding_workflow': describeEnum(onboardingStage!),
      },
    );

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(
              closeString,
              white,
              context,
            ),
          ),
        );
      return error;
    }
    return error;
  }
}
