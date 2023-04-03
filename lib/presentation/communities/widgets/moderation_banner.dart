import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ModerationBanner extends StatelessWidget {
  const ModerationBanner({
    super.key,
    required this.title,
    required this.body,
    required this.onTap,
    this.optionKey,
  });

  final String title;
  final String body;
  final Key? optionKey;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
        key: optionKey,
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        highlightColor: Colors.purple.withOpacity(0.3),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryColor.withOpacity(0.14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.lightBlackTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                body,
                style: const TextStyle(
                  color: AppColors.grey50,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
