import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/help_center/widgets/circular_background_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';

class HelpCenterChannels extends StatelessWidget {
  const HelpCenterChannels();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          top: 20,
          left: 20,
          child: Row(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    key: helpCenterCallKey,
                    onTap: callSupport,
                    child: Column(
                      children: <Widget>[
                        const CircularBackGroundIcons(
                          backgroundColor: AppColors.primaryColor,
                          iconBackgroundPadding: 16,
                          loadIcon: UniconsLine.phone,
                        ),
                        smallVerticalSizedBox,
                        Text(
                          callText,
                          style: TextThemes.normalSize13Text(
                            AppColors.blackColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  veryLargeHorizontalSizedBox,
                  GestureDetector(
                    key: helpCenterWhatsAppKey,
                    onTap: chatOnWhatsApp,
                    child: Column(
                      children: <Widget>[
                        const CircularBackGroundIcons(
                          backgroundColor: AppColors.primaryColor,
                          iconBackgroundPadding: 16,
                          loadIcon: UniconsLine.whatsapp,
                        ),
                        smallVerticalSizedBox,
                        Text(
                          whatsAppText,
                          style: TextThemes.normalSize13Text(
                            AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
