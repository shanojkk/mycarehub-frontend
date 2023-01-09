import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class PhoneLoginErrorWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? userName;

  const PhoneLoginErrorWidget({required this.formKey, this.userName});

  @override
  Widget build(BuildContext context) {
    return LoginErrorWidget(
      title: invalidCredentialSting,
      message: invalidCredentialsErrorMsg,
      actionText: resetPINString,
      actionKey: resetPINButtonKey,
      actionCallback: () {
        final bool? isFormValid = formKey.currentState?.validate();

        if (isFormValid != null &&
            isFormValid &&
            userName != null &&
            userName != UNKNOWN) {
          StoreProvider.dispatch<AppState>(
            context,
            UpdateOnboardingStateAction(invalidCredentials: false),
          );
          Navigator.of(context).pushReplacementNamed(AppRoutes.forgotPINPage);
        }
      },
    );
  }
}
