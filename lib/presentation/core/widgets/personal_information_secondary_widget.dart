// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class PersonalInformationSecondaryWidget extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const PersonalInformationSecondaryWidget({
    required this.fieldName,
    required this.fieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              fieldName,
              overflow: TextOverflow.ellipsis,
              style: boldSize15Text(),
            ),
            verySmallVerticalSizedBox,
            Text(
              fieldValue,
              style: normalSize14Text(AppColors.greyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
