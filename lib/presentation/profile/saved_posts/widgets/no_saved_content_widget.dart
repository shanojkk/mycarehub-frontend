// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class NoSavedContentWidget extends StatelessWidget {
  const NoSavedContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              SvgPicture.asset(
                contentZeroStateImageUrl,
                height: 286.0,
                width: 286.0,
              ),
              mediumVerticalSizedBox,
              const Text(
                youHaveNoSaveItemsText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              smallVerticalSizedBox,
              const Text(
                pleaseBePatientWhileWePrepareYourSaveItemsText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              mediumVerticalSizedBox,
              SizedBox(
                height: 48,
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: okThanksButtonKey,
                  text: okThanksText,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
