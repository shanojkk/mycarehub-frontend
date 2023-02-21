// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users nickname,
///
/// Otherwise delightfully notify user of any Error that might occur during the process
///
/// Should navigate is by default set to true unless when the action does not navigate to home page

class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.flag,
    required this.client,
    this.shouldNavigate = true,
    this.onError,
    this.onSuccess,
  });

  final void Function(String)? onError;
  final void Function()? onSuccess;
  final IGraphQlClient client;
  final String flag;
  final bool shouldNavigate;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(flag));
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(flag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.clientState?.clientProfile?.user?.userId;
    final String nickname = state.onboardingState?.nickName ?? '';

    // initializing of the SetNicknameAction mutation
    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'nickname': nickname,
    };

    final http.Response result = await client.query(
      setNickNameMutation,
      variables,
    );

    final ProcessedResponse processed = processHttpResponse(result);

    if (processed.ok) {
      final Map<String, dynamic> body = client.toMap(result);
      client.close();
      final String? errors = client.parseError(body);

      if (errors != null) {
        if (errors.contains('71')) {
          onError?.call(usernameTakenText);
          return null;
        }

        onError?.call(somethingWentWrongText);
        reportErrorToSentry(
          hint: 'Error while setting nickname',
          query: setNickNameMutation,
          variables: variables,
          response: result,
          state: state,
        );

        return null;
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data?['setNickName'] == true) {
        dispatch(UpdateOnboardingStateAction(hasSetNickName: true));
        dispatch(UpdateUserProfileAction(nickName: nickname));
        dispatch(UpdateUserProfileAction(hasSetNickname: true));

        final OnboardingPathInfo path = onboardingPath(appState: state);
        final CurrentOnboardingStage? onboardingStage =
            state.onboardingState!.currentOnboardingStage;

        onSuccess?.call();

        await AnalyticsService().logEvent(
          name: completeOnboardingEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': path.nextRoute,
            'current_onboarding_workflow': describeEnum(onboardingStage!),
          },
        );

        await AnalyticsService().logEvent(
          name: setNicknameEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': path.nextRoute,
            'current_onboarding_workflow': describeEnum(onboardingStage),
          },
        );

        if (shouldNavigate) {
          final OnboardingPathInfo path = onboardingPath(appState: state);

          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              path.nextRoute,
              (Route<dynamic> route) => false,
              arguments: path.arguments,
            ),
          );
        }
      } else {
        onError?.call(errorSettingNicknameText);
        return null;
      }
    } else {
      throw UserException(getErrorMessage());
    }

    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
