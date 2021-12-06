// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:user_feed/user_feed.dart';

/// [ResetPinAction] is a Redux Action whose job is to reset an expired pin.
///
/// should proceed to home page once the change is successful
class ResetPinAction extends ReduxAction<AppState> {
  ResetPinAction({
    required this.context,
  });

  final BuildContext context;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: resetPinFlag);
  }

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: resetPinFlag, show: false);
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    /// [pin] variable is retrieving the PIN the user input in the [PhoneLogin] page from state
    /// [phoneNumber] variable is retrieving the Phone Number the user input in the [PhoneLogin] page from state
    final String? pin = state.onboardingState?.phoneLogin?.pinCode;
    final String? otp = state.onboardingState?.verifyPhoneState?.otp;
    final String? phoneNumber = state.onboardingState?.phoneLogin?.phoneNumber;

    /// Check to verify the PIN is `not null` and contains four digits and OTP is not also null
    if (pin != null &&
        pin != UNKNOWN &&
        pin.isNotEmpty &&
        phoneNumber != null &&
        otp != null &&
        otp != UNKNOWN &&
        otp.isNotEmpty) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.CONSUMER.name,
        'pin': pin,
        'otp': otp,
      };

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final String resetPinEndpoint =
          AppWrapperBase.of(context)!.customContext!.resetPinEndpoint;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: resetPinEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse, context);

      if (processedResponse.ok == true) {
        final bool isSuccessful = jsonDecode(httpResponse.body) as bool;

        if (isSuccessful) {
          dispatch(UpdateOnboardingStateAction(isResetPin: false));

          dispatch(
            BottomNavAction(currentBottomNavIndex: BottomNavIndex.home.index),
          );

          Navigator.of(context).pushReplacementNamed(BWRoutes.phoneLogin);
        }
        return state;
      } else {
        showFeedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ?? UNKNOWN, // safety-net
          imageAssetPath: errorIconUrl,
        );

        throw SILException(
          error: processedResponse.response,
          cause: 'reset_pin_error',
          message: processedResponse.message,
        );
      }
    } else {
      showFeedbackBottomSheet(
        context: context,
        modalContent: fourDigitPin,
        imageAssetPath: infoIconUrl,
      );
      // exception thrown incase the provided PIN is less than four digits
      throw SILException(cause: 'pin_too_short', message: fourDigitPin);
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorLoggingIn);
    }

    return error;
  }
}
