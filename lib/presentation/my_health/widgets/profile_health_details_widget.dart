// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ProfileHealthDetailsWidget extends StatelessWidget {
  ///[ProfileHealthDetailsWidget] displays profile health details widget
  final String svgPath;
  final String title;
  final String descriptionSubScript;
  final String description;

  const ProfileHealthDetailsWidget({
    required this.svgPath,
    required this.title,
    required this.description,
    required this.descriptionSubScript,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  svgPath,
                  width: 15,
                  height: 15,
                  color: AppColors.primaryColor,
                ),
                verySmallHorizontalSizedBox,
                Text(
                  title,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: description,
                  style: boldSize30Text(
                    AppColors.primaryColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: descriptionSubScript,
                      style: normalSize14Text(
                        AppColors.secondaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
