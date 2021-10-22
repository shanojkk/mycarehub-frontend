// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/content/content.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/feed/content_item_widget.dart';

class NewContent extends StatelessWidget {
  final List<Content> feedItems;

  const NewContent({required this.feedItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  newContentText,
                  style: TextThemes.veryBoldSize16Text(
                    AppColors.secondaryColor,
                  ),
                ),
                Text(
                  viewAllText,
                  style: TextThemes.normalSize16Text(
                    AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: feedItems.length,
              itemBuilder: (BuildContext context, int index) {
                final Content currentContentItem =
                    feedContentItems.elementAt(index);

                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 15 : 7.5),
                  child: ContentItem(contentItem: currentContentItem),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
