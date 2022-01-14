// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/responses/security_question_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:user_feed/user_feed.dart';

/// [VerifySecurityQuestionAction] is a Redux Action whose job is to verify responses for recorded
///  security questions responses if pin reset is true.
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class VerifySecurityQuestionAction extends ReduxAction<AppState> {
  VerifySecurityQuestionAction({
    required this.context,
    required this.phoneNumber,
  });

  final BuildContext context;
  final String phoneNumber;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: verifySecurityQuestionsFlag);
  }

  @override
  void after() {
    toggleLoadingIndicator(
      context: context,
      flag: verifySecurityQuestionsFlag,
      show: false,
    );
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final List<SecurityQuestionResponse> securityQuestionsResponses =
        state.onboardingState!.securityQuestionResponses!;

    final List<Map<String, dynamic>> _variables = <Map<String, dynamic>>[];

    for (int i = 0; i < securityQuestionsResponses.length; i++) {
      _variables.add(<String, dynamic>{
        'questionID':
            securityQuestionsResponses[i].securityQuestionID.toString(),
        'flavour': Flavour.CONSUMER.name,
        'response': securityQuestionsResponses[i].response.toString(),
        'phoneNumber': phoneNumber,
      });
    }

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final String verifySecurityQuestions = AppWrapperBase.of(context)!
        .customContext!
        .verifySecurityQuestionsEndpoint!;

    final http.Response result = await _client.callRESTAPI(
      endpoint: verifySecurityQuestions,
      method: httpPOST,
      variables: <String, dynamic>{
        'verifySecurityQuestionsInput': _variables,
      },
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      dispatch(
        UpdateOnboardingStateAction(
          hasVerifiedSecurityQuestions: false,
        ),
      );
      throw SILException(
        cause: verifySecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['verifySecurityQuestionResponses'] != null) {
      dispatch(
        UpdateOnboardingStateAction(
          hasVerifiedSecurityQuestions:
              responseMap['data']['verifySecurityQuestionResponses'] as bool,
        ),
      );

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.createPin,
        arguments: phoneNumber,
      );
    }
    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      reportErrorToSentry(
        context,
        error,
        hint: 'Verify Security Questions',
      );
      return error;
    }
    return error;
  }
}
