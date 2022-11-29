// Dart imports:
import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';

class SendOTPAction extends ReduxAction<AppState> {
  SendOTPAction({
    required this.context,
    required this.phoneNumber,
  });

  final BuildContext context;
// The phone number to resend this OTP to
  final String phoneNumber;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sendOTPFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(sendOTPFlag));
  }

  @override
  Future<AppState?> reduce() async {
    if (phoneNumber != UNKNOWN) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.consumer.name,
      };

      //Incase of send/resend otp error it is cleared
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: false));

      final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
      final String sendOTPEndpoint = AppWrapperBase.of(context)!
          .customContext!
          .sendRecoverAccountOtpEndpoint;

      final Response httpResponse = await client.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      final Map<String, dynamic> payLoad = client.toMap(httpResponse);

      final String? error = parseError(payLoad);

      if (error != null) {
        reportErrorToSentry(
          hint: 'Error while sending OTP',
          query: sendOTPEndpoint,
          variables: variables,
          response: httpResponse,
          state: state,
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));

        return null;
      }

      if (processedResponse.ok) {
        // Return OTP sent as string
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final Map<String, dynamic>? data =
            parsed['data'] as Map<String, dynamic>?;

        final String otp = data?['sendOTP'] as String;

        // save the OTP to state
        dispatch(UpdateOnboardingStateAction(otp: otp));

        return state;
      } else {
        // exception thrown if the backend could not send an OTP
        showFeedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ??
              defaultUserFriendlyMessage, // safety-net
          imageAssetPath: errorIconUrl,
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));

        reportErrorToSentry(
          hint: 'Error while sending OTP',
          query: sendOTPEndpoint,
          variables: variables,
          state: state,
        );
      }
    } else {
      // In case user's phone number is not found
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }

    return null;
  }
}
