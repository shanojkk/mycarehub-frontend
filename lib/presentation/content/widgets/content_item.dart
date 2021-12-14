import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

import 'package:myafyahub/presentation/content/widgets/audio_content.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/presentation/content/widgets/gallery_image_widget.dart';
import 'package:myafyahub/presentation/content/widgets/leading_graphic_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/content/widgets/reaction_item.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// [ContentItem] Displays the feed
/// [isNew] renders the new tag
class ContentItem extends StatelessWidget {
  const ContentItem({required this.contentDetails, this.isNew = false});

  final Content contentDetails;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final double galleryImageHeight = MediaQuery.of(context).size.height * 0.41;
    final BorderRadius imageBorderRadius = BorderRadius.circular(12);

    final List<GalleryImage>? galleryImages = contentDetails.galleryImages;

    final bool hasGalleryImages =
        galleryImages != null && galleryImages.isNotEmpty;

    final List<Widget> galleryItems = <Widget>[];

    final bool hasHeroImage = contentDetails.heroImage != null &&
        contentDetails.heroImage!.url != UNKNOWN &&
        contentDetails.heroImage!.url!.isNotEmpty;

    if (hasGalleryImages) {
      if (galleryImages.length == 1) {
        galleryItems.addAll(<Widget>[
          GalleryImageWidget(
            borderRadius: imageBorderRadius,
            imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
            height: galleryImageHeight,
          ),
        ]);
      } else if (galleryImages.length == 2) {
        galleryItems.addAll(<Widget>[
          Flexible(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
              height: galleryImageHeight,
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[1].image?.meta?.imageDownloadUrl ?? '',
              height: galleryImageHeight,
            ),
          ),
        ]);
      } else {
        galleryItems.addAll(<Widget>[
          Flexible(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
              height: MediaQuery.of(context).size.height * 0.81,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: GalleryImageWidget(
                    borderRadius: imageBorderRadius,
                    imageUrl:
                        galleryImages[1].image?.meta?.imageDownloadUrl ?? '',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: GalleryImageWidget(
                    borderRadius: imageBorderRadius,
                    imageUrl:
                        galleryImages[2].image?.meta?.imageDownloadUrl ?? '',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
        ]);
      }
    } else if (hasHeroImage) {
      galleryItems.add(
        Expanded(
          child: GalleryImageWidget(
            imageUrl: contentDetails.heroImage!.url!,
            height: galleryImageHeight,
          ),
        ),
      );
    }

    final bool isArticle = contentDetails.contentType == ContentType.ARTICLE;
    final bool isVideo =
        contentDetails.contentType == ContentType.AUDIO_VIDEO &&
            contentDetails.featuredMedia?[0]?.featuredMediaType ==
                FeaturedMediaType.video;
    final bool isAudio =
        contentDetails.contentType == ContentType.AUDIO_VIDEO &&
            contentDetails.featuredMedia?[0]?.featuredMediaType ==
                FeaturedMediaType.audio;

    return GestureDetector(
      key: feedContentItemKey,
      onTap: () {
        if (isArticle ||
            contentDetails.featuredMedia?[0]?.featuredMediaType ==
                FeaturedMediaType.video) {
          Navigator.of(context).pushNamed(
            BWRoutes.contentDetailPage,
            arguments: ContentDetails(content: contentDetails),
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: const BoxDecoration(
          color: AppColors.darkGreyBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      if (galleryItems.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: LeadingGraphicWidget(
                            contentDetails: contentDetails,
                            heroImage: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[...galleryItems],
                            ),
                          ),
                        ),
                      // A video playback icon if there is a video
                      if (isVideo)
                        SizedBox(
                          key: feedVideoPlayIconKey,
                          child: SvgPicture.asset(
                            playIcon,
                            width: 50,
                            height: 50,
                          ),
                        ),
                    ],
                  ),
                ),
                if (isAudio)
                  AudioContent(contentDetails: contentDetails)
                else if (contentDetails.contentType == ContentType.ARTICLE ||
                    contentDetails.featuredMedia?[0]?.featuredMediaType ==
                        FeaturedMediaType.video)
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  contentDetails.title!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextThemes.boldSize16Text(
                                    AppColors.secondaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: humanizeDate(
                                  dateTextStyle: TextThemes.normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                  loadedDate:
                                      contentDetails.metadata!.createdAt!,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        if (contentDetails.authorName != null)
                          Text(
                            contentDetails.authorName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextThemes.boldSize12Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        // Reactions
                        Padding(
                          padding: const EdgeInsets.only(top: 18, bottom: 4),
                          child: Row(
                            children: <Widget>[
                              ReactionItem(
                                iconUrl: heartIconUrl,
                                count: contentDetails.likeCount,
                              ),
                              ReactionItem(
                                iconUrl: shareIconUrl,
                                count: contentDetails.shareCount,
                              ),
                              ReactionItem(
                                iconUrl: saveIconUrl,
                                count: contentDetails.bookmarkCount,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            if (isNew)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.redAccent[700],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    newText,
                    style: TextThemes.boldSize16Text(Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}