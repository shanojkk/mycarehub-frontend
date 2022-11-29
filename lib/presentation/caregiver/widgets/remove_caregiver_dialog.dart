import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class RemoveCaregiverDialog extends StatelessWidget {
  RemoveCaregiverDialog({
    super.key,
    required this.name,
  });

  final String name;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Are you really sure?',
              style: veryBoldSize18Text(
                AppColors.warningRedColor,
              ),
            ),
            smallVerticalSizedBox,
            RichText(
              text: TextSpan(
                text: 'Please confirm that you want to remove',
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' $name ',
                    style: veryBoldSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                  const TextSpan(
                    text: 'as your caregiver?\n\n',
                  ),
                  const TextSpan(
                    text: 'Please type the word',
                  ),
                  TextSpan(
                    text: ' "$removeString" ',
                    style: veryBoldSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                style: const TextStyle(
                  color: AppColors.greyTextColor,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                text: removeCaregiverString,
                buttonKey: removeCaregiverButtonKey,
                buttonColor: AppColors.warningRedColor,
                borderColor: Colors.transparent,
                onPressed: () {
                  if (controller.text == removeString) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: cancelButtonKey,
                text: cancelString,
                textColor: AppColors.greenHappyColor,
                buttonColor: AppColors.greenHappyColor.withOpacity(0.1),
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
