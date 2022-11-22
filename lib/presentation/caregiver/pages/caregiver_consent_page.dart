import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/caregiver_consent_widget.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/consent_status_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';

class CaregiverConsentPage extends StatelessWidget {
  const CaregiverConsentPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: caregiverConsentText,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: SvgPicture.asset(caregiverConsentImage),
                ),
                mediumVerticalSizedBox,
                Text(
                  caregiverAssignedText,
                  textAlign: TextAlign.center,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
                mediumVerticalSizedBox,
                CaregiverConsentWidget(
                  name: 'John Doe',
                  bodyWidget: ConsentStatusWidget(),
                  text: caregiverConsentReviewText,
                ),
                size15VerticalSizedBox,
                const CaregiverConsentWidget(
                  name: 'John Doe',
                  text: caregiverConsentReviewText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
