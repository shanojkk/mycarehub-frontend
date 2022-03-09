import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';

import 'package:shared_themes/spaces.dart';

class GroupInfoPage extends StatelessWidget {
  const GroupInfoPage({required this.channelId});

  final String channelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: groupInfoText,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 10, 10),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    groupInfoImage,
                    height: 200.0,
                    width: 200.0,
                  ),
                  Text(
                    groupTitle,
                    style: boldSize20Text(AppColors.lightBlackTextColor),
                  ),
                  verySmallVerticalSizedBox,
                  Text(
                    getGroupMembersNumber(230),
                    style: boldSize16Text(AppColors.greyTextColor),
                  ),
                  largeVerticalSizedBox,
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      groupMembersText,
                      style: boldSize20Text(AppColors.blackColor),
                    ),
                  ),
                  largeVerticalSizedBox,
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: membersList.length,
                    itemBuilder: (_, int index) {
                      return membersList[index];
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
