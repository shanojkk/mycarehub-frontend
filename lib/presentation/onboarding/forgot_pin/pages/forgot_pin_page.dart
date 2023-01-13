// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ForgotPINPage extends StatelessWidget {
  const ForgotPINPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              veryLargeVerticalSizedBox,
              SvgPicture.asset(
                forgotPINImageSvgPath,
                width: 260,
              ),
              largeVerticalSizedBox,
              Text(
                forgotYourPINString,
                style: heavySize20Text(),
                textAlign: TextAlign.center,
              ),
              smallVerticalSizedBox,
              Text(
                forgotPINPageMessageString,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              mediumVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: resetPINButtonKey,
                  text: resetMyPINString,
                  onPressed: () {
                    StoreProvider.dispatch(
                      context,
                      UpdateOnboardingStateAction(
                        currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
                      ),
                    );
                    final OnboardingPathInfo config = onboardingPath(
                      appState: StoreProvider.state<AppState>(context),
                    );

                    Navigator.of(context)
                        .pushReplacementNamed(config.nextRoute);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
