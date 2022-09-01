import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class GeneralWorkstationWidget extends StatelessWidget {
  const GeneralWorkstationWidget({
    Key? key,
    required this.title,
    required this.bodyWidget,
    required this.onButtonCallback,
    required this.buttonText,
  }) : super(key: key);

  final String title;
  final String buttonText;
  final Widget bodyWidget;
  final Function() onButtonCallback;

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
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: veryBoldSize17Text(AppColors.primaryColor),
          ),
          mediumVerticalSizedBox,
          bodyWidget,
          mediumVerticalSizedBox,
          SizedBox(
            height: 48,
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              buttonKey: Key(buttonText),
              text: buttonText,
              onPressed: () {
                onButtonCallback.call();
              },
            ),
          )
        ],
      ),
    );
  }
}
