// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/domain/core/value_objects/exception_tag.dart';
import 'package:sghi_core/shared_themes/constants.dart';

/// [CreatePINAction] is a Redux Action whose job is to update a users PIN from an old one,
///  to the new provided one
///
/// Otherwise delightfully notify user of any Error that might occur during update PIN process
///
/// should initiate change PIN process

class CreatePINAction extends ReduxAction<AppState> {
  CreatePINAction({required this.context});

  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createPinFlag));
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    dispatch(WaitAction<AppState>.add(createPinFlag));
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState!.user!.userId;
    final String newPIN = state.onboardingState?.pin ?? UNKNOWN;
    final String confirmPIN = state.onboardingState?.confirmPIN ?? UNKNOWN;

    final String? otp = state.onboardingState?.otp;

    final bool isResetPIN = state.onboardingState?.currentOnboardingStage ==
        CurrentOnboardingStage.ResetPIN;
    final bool isChangingPIN = state.onboardingState?.currentOnboardingStage ==
        CurrentOnboardingStage.PINExpired;

    /// This value is used to indicate whether the user is resetting their PIN
    /// or changing it after it has expired
    ///
    ///  We call REST for both cases hence why this boolean is important
    final bool isResetOrChangePIN = isResetPIN || isChangingPIN;

    final String? phone = state.onboardingState?.phoneNumber;

    // check if the new PIN matches the confirmed PIN entered by the user
    if ((newPIN != UNKNOWN && confirmPIN != UNKNOWN) && newPIN == confirmPIN) {
      // initializing of the reset_pin mutation
      final Map<String, String?> resetPinVariables = <String, String?>{
        'phonenumber': phone,
        'flavour': Flavour.consumer.name,
        'pin': newPIN,
        'otp': otp,
      };

      // initializing of the updateUserPin mutation
      final Map<String, String?> updateUserPinVariables = <String, String?>{
        'userID': userID,
        'pin': newPIN,
        'confirmPIN': confirmPIN,
        'flavour': Flavour.consumer.name,
      };

      final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
      final String resetPinEndpoint =
          AppWrapperBase.of(context)!.customContext!.updateUserPinEndpoint;

      final http.Response result = isResetOrChangePIN
          ? await client.callRESTAPI(
              endpoint: resetPinEndpoint,
              method: httpPOST,
              variables: resetPinVariables,
            )
          : await client.query(
              setUserPINMutation,
              setUserPINMutationVariables(updateUserPinVariables),
            );

      final Map<String, dynamic> body = client.toMap(result);

      client.close();

      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;

      if (client.parseError(body) != null || responseMap['errors'] != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: const Text(somethingWentWrongText),
              duration: const Duration(seconds: kShortSnackBarDuration),
              action:
                  dismissSnackBar(closeString, AppColors.whiteColor, context),
            ),
          );

        throw MyAfyaException(
          cause: createPINTag,
          message: somethingWentWrongText,
        );
      }

      final Map<String, dynamic>? data =
          responseMap['data'] as Map<String, dynamic>?;

      if (data?['setUserPIN'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(pinSuccessString),
            duration: Duration(seconds: 2),
          ),
        );

        dispatch(
          UpdateOnboardingStateAction(
            hasSetPin: true,
          ),
        );
        dispatch(
          UpdateUserProfileAction(
            hasSetPin: true,
            pinChangeRequired: false,
            pinUpdateRequired: false,
          ),
        );

        final OnboardingPathInfo navConfig = onboardingPath(appState: state);

        final CurrentOnboardingStage? onboardingStage =
            state.onboardingState!.currentOnboardingStage;

        await AnalyticsService().logEvent(
          name: createPINEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': navConfig.nextRoute,
            'current_onboarding_workflow': describeEnum(onboardingStage!),
          },
        );

        Navigator.pushReplacementNamed(context, navConfig.nextRoute);
      } else if (data?['resetPIN'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isResetPIN ? pinResetSuccessString : pinChangeSuccessString,
            ),
            duration: const Duration(seconds: 2),
          ),
        );

        dispatch(UpdateOnboardingStateAction(hasSetPin: true));

        final OnboardingPathInfo navConfig = onboardingPath(appState: state);

        final CurrentOnboardingStage? onboardingStage =
            state.onboardingState!.currentOnboardingStage;

        await AnalyticsService().logEvent(
          name: resetPINEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': navConfig.nextRoute,
            'current_onboarding_workflow': describeEnum(onboardingStage!),
          },
        );

        Navigator.pushReplacementNamed(context, navConfig.nextRoute);
      }
    } else {
      // scaffold that handles a mismatch in the just entered PINs by the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(pinMustMatchString),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text((error as MyAfyaException).message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, AppColors.whiteColor, context),
          ),
        );
      return error;
    }
    return error;
  }
}
