import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ProgramCardWidget extends StatelessWidget {
  const ProgramCardWidget({
    required this.programName,
    required this.buttonText,
    required this.organizationName,
    this.onButtonCallback,
    this.buttonWidget,
  });

  final String programName;
  final String organizationName;
  final String buttonText;
  final VoidCallback? onButtonCallback;
  final Widget? buttonWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            programName,
            style: veryBoldSize17Text(AppColors.primaryColor),
          ),
          smallVerticalSizedBox,
          Text(
            organizationName,
            style: normalSize15Text(AppColors.primaryColor),
          ),
          mediumVerticalSizedBox,
          SizedBox(
            height: 48,
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              buttonKey: Key(buttonText),
              onPressed: onButtonCallback,
              customChild: buttonWidget ??
                  Text(buttonText, style: veryBoldSize15Text(whiteColor)),
            ),
          )
        ],
      ),
    );
  }
}
