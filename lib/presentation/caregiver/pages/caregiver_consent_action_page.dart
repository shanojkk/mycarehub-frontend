import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/remove_caregiver_dialog.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';

class CaregiverConsentActionsPage extends StatefulWidget {
  @override
  State<CaregiverConsentActionsPage> createState() =>
      _CaregiverConsentActionsPageState();
}

class _CaregiverConsentActionsPageState
    extends State<CaregiverConsentActionsPage> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    const String userName = 'Jane Doe';

    return Scaffold(
      appBar: const CustomAppBar(
        title: userName,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                mediumVerticalSizedBox,
                Center(
                  child: SvgPicture.asset(consentImage),
                ),
                mediumVerticalSizedBox,
                Text(
                  userName,
                  style: veryBoldSize20Text(),
                ),
                smallVerticalSizedBox,
                Text(
                  '+254712345678',
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
                mediumVerticalSizedBox,
                Text(
                  accepted
                      ? getConsentActionRemoveDescription(userName)
                      : getConsentActionDescription(userName),
                  style: normalSize14Text(AppColors.greyTextColor),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                if (accepted)
                  SizedBox(
                    width: double.infinity,
                    child: MyAfyaHubPrimaryButton(
                      text: removeCaregiverString,
                      buttonKey: removeCaregiverButtonKey,
                      buttonColor: AppColors.warningRedColor,
                      borderColor: Colors.transparent,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RemoveCaregiverDialog(
                              name: userName,
                            );
                          },
                        );
                      },
                    ),
                  )
                else ...<Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: MyAfyaHubPrimaryButton(
                      text: acceptString,
                      buttonKey: acceptButtonKey,
                      onPressed: () => setState(
                        () => accepted = true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyAfyaHubPrimaryButton(
                      text: doNotAcceptString,
                      buttonKey: doNotAcceptButtonKey,
                      textColor: AppColors.lightRedTextColor,
                      buttonColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      borderColor: Colors.transparent,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
