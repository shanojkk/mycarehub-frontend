// Flutter imports:
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/content/content.dart';

// Project imports:
import 'package:myafyahub/presentation/feed/content_item_widget.dart';

class FeedContentList extends StatelessWidget {
  final List<Content> feedItems;

  const FeedContentList({required this.feedItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: feedItems.length,
        itemBuilder: (BuildContext context, int index) {
          final Content currentContentItem = feedContentItems.elementAt(index);

          return Padding(
            padding: const EdgeInsets.only(top: 7.5),
            child: ContentItem(contentItem: currentContentItem),
          );
        },
      ),
    );
  }
}
