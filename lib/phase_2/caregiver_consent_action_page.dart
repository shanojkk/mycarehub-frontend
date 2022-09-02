import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';

class CaregiverConsentActionsPage extends StatelessWidget {
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
                  getConsentActionDescription(userName),
                  style: normalSize14Text(AppColors.greyTextColor),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                const SizedBox(
                  width: double.infinity,
                  child: MyAfyaHubPrimaryButton(
                    text: 'I Accept',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: MyAfyaHubPrimaryButton(
                    text: 'I DO NOT Accept',
                    textColor: AppColors.lightRedTextColor,
                    buttonColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    borderColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
