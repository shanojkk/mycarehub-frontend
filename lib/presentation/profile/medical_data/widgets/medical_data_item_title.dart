// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class MedicalDataItemTitle extends StatelessWidget {
  const MedicalDataItemTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: boldSize12Text(AppColors.secondaryColor),
      ),
    );
  }
}
