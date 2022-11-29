import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class CaregiverConsentWidget extends StatelessWidget {
  const CaregiverConsentWidget({
    required this.name,
    this.bodyWidget,
    required this.text,
  });

  final String name;
  final Widget? bodyWidget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.14),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.3),
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: veryBoldSize18Text(
              AppColors.blackColor,
            ),
          ),
          if (bodyWidget != null) ...<Widget>[
            smallVerticalSizedBox,
            bodyWidget!,
          ],
          smallVerticalSizedBox,
          Text(
            text,
            style: normalSize14Text(AppColors.greyTextColor),
          ),
        ],
      ),
    );
  }
}
