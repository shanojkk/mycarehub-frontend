// Flutter imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/content/content.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/feed/feed_item_bottom_row.dart';

/// [ContentItem] Displays the feed
/// [isNew] renders the new tag
class ContentItem extends StatelessWidget {
  final Content? contentItem;

  const ContentItem({required this.contentItem});

  @override
  Widget build(BuildContext context) {
    final String title = contentItem?.title ?? '';
    final String? heroImage = contentItem?.heroImage;
    final String createdAt = contentItem?.createdAt ?? UNKNOWN;
    final bool isNew = contentItem?.isNew ?? false;
    final int? readTime = contentItem?.estimate;

    return GestureDetector(
      child: Container(
        width: 370,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(children: <Widget>[
                if (heroImage == null || heroImage.isEmpty)
                  Container(
                    height: 170.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(heroImage!),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.0)),
                    ),
                  )
                else
                  const SizedBox(),
                smallVerticalSizedBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                ),
                smallVerticalSizedBox,
                ContentItemFooter(
                  feedDate: createdAt,
                  readTime: readTime,
                )
              ]),
            ),
            if (isNew)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 30.0,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                      color: Colors.redAccent[700],
                    ),
                    child: Center(
                      child: Text(
                        newString,
                        style: TextThemes.boldSize16Text(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context)
          .pushNamed(BWRoutes.articleDetailsPage, arguments: contentItem),
    );
  }
}
