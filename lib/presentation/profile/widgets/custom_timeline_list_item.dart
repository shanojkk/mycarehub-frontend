// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/domain/core/entities/profile/timeline_item.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class CustomTimelineListItem extends StatelessWidget {
  const CustomTimelineListItem({
    super.key,
    required this.item,
  });

  final TimelineItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  item.leadingIcon,
                  color: AppColors.primaryColor,
                  width: 35,
                  height: 35,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        item.title,
                        style: normalSize12Text(
                          AppColors.primaryColor,
                        ),
                      ),
                    ),
                    if (item.subtitle != null) ...<Widget>[
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle!,
                        style: normalSize10Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    ],
                    if (item.time != null) ...<Widget>[
                      const SizedBox(height: 4),
                      humanizeDate(
                        dateTextStyle:
                            normalSize10Text(AppColors.greyTextColor),
                        loadedDate: item.time!,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
