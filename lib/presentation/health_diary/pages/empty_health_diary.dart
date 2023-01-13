// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class EmptyHealthDiary extends StatelessWidget {
  const EmptyHealthDiary({required this.refreshCallback});

  final void Function() refreshCallback;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            emptyDiaryEntryImage,
            height: size.height / 3,
            width: size.width,
          ),
          Text(
            diaryEmptyTitle,
            textAlign: TextAlign.center,
            style: boldSize20Text(),
          ),
          smallVerticalSizedBox,
          Text(
            diaryEmptyDescription,
            textAlign: TextAlign.center,
            style: normalSize15Text(AppColors.greyTextColor),
          ),
          verySmallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                buttonKey: healthDiaryRetryButtonKey,
                text: addDiaryString,
                textColor: AppColors.whiteColor,
                buttonColor: Theme.of(context).primaryColor,
                borderColor: Colors.transparent,
                onPressed: refreshCallback,
              ),
            ),
          )
        ],
      ),
    );
  }
}
