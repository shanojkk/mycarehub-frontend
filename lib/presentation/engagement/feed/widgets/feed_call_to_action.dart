import 'package:flutter/material.dart';
import 'package:user_feed/src/domain/value_objects/asset_strings.dart';

import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';

class FeedCallToAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: coverCallToActionColor,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: white,
        ),
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -15,
              bottom: -20,
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      coverImgpUrl,
                      package: packageName,
                    ),
                  )),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  coverCallToActionTitle,
                  style: TextThemes.boldSize18Text(),
                ),
                smallVerticalSizedBox,
                Text(
                  viewCoverCallToActionBody,
                  style: TextThemes.normalSize15Text(),
                ),
                mediumVerticalSizedBox,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
