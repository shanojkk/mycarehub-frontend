import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ConsentStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: AppColors.malachiteColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 14.0,
          ),
        ),
        verySmallHorizontalSizedBox,
        Text(
          consentRecordedString,
          style: normalSize14Text(
            AppColors.malachiteColor,
          ),
        ),
      ],
    );
  }
}
