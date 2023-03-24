import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    super.key,
    required this.wasSentByUser,
    required this.sender,
    required this.timestamp,
    required this.imageURL,
  });

  final bool wasSentByUser;
  final Widget sender;
  final String imageURL;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.imagePreviewRoute,
          arguments: <String, dynamic>{
            'imageURL': imageURL,
            'wasSentByUser': wasSentByUser,
            'sender': sender,
            'timestamp': timestamp,
          },
        );
      },
      child: Column(
        crossAxisAlignment:
            wasSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: wasSentByUser ? 50 : 8,
              right: wasSentByUser ? 8 : 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft:
                    wasSentByUser ? const Radius.circular(10) : Radius.zero,
                topRight:
                    wasSentByUser ? Radius.zero : const Radius.circular(10),
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
              ),
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(wasSentByUser ? .5 : .2),
            ),
            child: Column(
              crossAxisAlignment: wasSentByUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                sender,
                const SizedBox(height: 5),

                // Add image here
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageURL,
                    height: 300,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (
                      BuildContext context,
                      String url,
                      DownloadProgress progress,
                    ) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: const CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),

                smallVerticalSizedBox,
                Text(
                  timestamp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
