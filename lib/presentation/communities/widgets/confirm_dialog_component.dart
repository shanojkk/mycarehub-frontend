import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class ConfirmDialogComponent extends StatelessWidget {
  const ConfirmDialogComponent({
    super.key,
    required this.onConfirm,
    required this.title,
    this.description = '',
    this.confirmKey,
    this.cancelKey,
  });

  final Function()? onConfirm;

  final String title;
  final String description;
  final Key? confirmKey;
  final Key? cancelKey;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: heavySize16Text()),
            smallVerticalSizedBox,
            Text(
              description,
              style: normalSize14Text(AppColors.unSelectedReactionIconColor),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: confirmKey,
                buttonColor: Colors.red,
                text: yesContinue,
                textStyle: boldSize16Text(AppColors.whiteColor),
                textColor: AppColors.whiteColor,
                onPressed: onConfirm,
              ),
            ),
            verySmallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: cancelKey,
                text: cancelString,
                textColor: AppColors.primaryColor,
                buttonColor: AppColors.primaryColor.withOpacity(0.1),
                borderColor: Colors.transparent,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
