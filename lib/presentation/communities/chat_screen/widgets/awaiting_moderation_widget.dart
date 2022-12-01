// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

/// [AwaitingModerationWidget] used within [SentMessageItem] to show messages awaiting moderation.
class AwaitingModerationWidget extends StatelessWidget {
  /// [AwaitingModerationWidget] used within [SentMessageItem] to show messages awaiting moderation.
  ///
  const AwaitingModerationWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          awaitingModerationString,
          style:
              normalSize12Text().copyWith(color: AppColors.darkGreyTextColor),
        ),
        verySmallHorizontalSizedBox,
        SvgPicture.asset(
          awaitingModerationIcon,
          color: AppColors.darkGreyTextColor,
          width: 18,
          height: 18,
        ),
      ],
    );
  }
}
