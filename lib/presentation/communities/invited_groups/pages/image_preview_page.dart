import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({
    super.key,
    required this.url,
    required this.sender,
    required this.time,
    this.wasSentByUser = false,
  });

  final String url;

  final Widget sender;

  final String time;

  final bool wasSentByUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: const Center(child: Text(imageInfoString)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (
                  BuildContext context,
                  String url,
                  DownloadProgress progress,
                ) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: const CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                  );
                },
              ),
            ),
            mediumVerticalSizedBox,
            const Text(
              imageInfoString,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            mediumVerticalSizedBox,
            Row(
              children: <Widget>[
                const Text(
                  sentBy,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                if (!wasSentByUser)
                  sender
                else
                  const Text(
                    'You ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
              ],
            ),
            mediumVerticalSizedBox,
            Row(
              children: <Widget>[
                const Text(
                  sentOn,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
