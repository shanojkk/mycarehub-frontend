// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class PersonalInformationWidget extends StatelessWidget {
  final String description;

  const PersonalInformationWidget({
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        color: Colors.white,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: normalSize14Text(
              AppColors.greyTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
