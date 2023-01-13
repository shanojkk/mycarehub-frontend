import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class TBAssessmentInformation extends StatelessWidget {
  const TBAssessmentInformation();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: RichText(
            text: TextSpan(
              text: assessmentSubmissionSuccessfulDescription,
              style: normalSize14Text(
                AppColors.greyTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: pleaseVisitClinic,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
