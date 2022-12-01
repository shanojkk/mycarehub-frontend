import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/onboarding/consent_confirmation/widgets/consent_confirmation_dialog.dart';

class ConsentConfirmationPage extends StatelessWidget {
  const ConsentConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: optOutOfMyCareHubString),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: SvgPicture.asset(
                  consentConfirmationImage,
                  width: 200,
                ),
              ),
              largeVerticalSizedBox,
              Text(
                optOutOfMyCareHubTitleString,
                style: veryBoldSize20Text(AppColors.primaryColor),
              ),
              mediumVerticalSizedBox,
              Text(
                youAreChoosingToOptOut,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              Text(
                yourProfileWillBeDeleted,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              verySmallVerticalSizedBox,
              Text(
                youWillNotLogin,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              verySmallVerticalSizedBox,
              Text(
                youWillNeedToRegisterString,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              verySmallVerticalSizedBox,
              Text(
                yourHealthRecordWillBeAnonymizedString,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              MyAfyaHubNoBorderButton(
                onPressed: () async {
                  await launchEmailUrl(adminEmail);
                },
                text: adminEmail,
              ),
              largeVerticalSizedBox,
              Text(
                areYouStillSureString,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              veryLargeVerticalSizedBox,
              StoreConnector<AppState, AppStateViewModel>(
                converter: (Store<AppState> store) =>
                    AppStateViewModel.fromStore(store),
                builder: (BuildContext context, AppStateViewModel vm) {
                  return vm.wait!.isWaitingFor(optOutFlag)
                      ? const Padding(
                          padding: EdgeInsets.all(40.0),
                          child: PlatformLoader(),
                        )
                      : Column(
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: MyAfyaHubPrimaryButton(
                                buttonKey: abortConsentButtonKey,
                                text: noGoBack,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            smallVerticalSizedBox,
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: MyAfyaHubPrimaryButton(
                                buttonKey: continueConsentButtonKey,
                                text: yesContinue,
                                buttonColor:
                                    AppColors.primaryColor.withOpacity(0.1),
                                textColor: AppColors.lightRedTextColor,
                                borderColor: Colors.transparent,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ConsentConfirmationDialog();
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
