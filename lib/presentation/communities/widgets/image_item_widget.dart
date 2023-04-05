import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_bottom_sheet.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    super.key,
    required this.wasSentByUser,
    required this.sender,
    required this.timestamp,
    required this.imageURL,
    required this.roomID,
    required this.eventID,
    required this.senderID,
    this.isFlaggedMessage = false,
  });

  final bool wasSentByUser;
  final Widget sender;
  final String imageURL;
  final String timestamp;

  final String roomID;
  final String eventID;
  final String senderID;

  // Whether this message being displayed is a flagged message
  final bool isFlaggedMessage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: previewImageMessageKey,
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
      onLongPress: () async {
        await showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return MessageOptionBottomSheet(
              wasSentByUser: wasSentByUser,
              roomID: roomID,
              eventID: eventID,
              senderID: senderID,
              isFlaggedMessage: isFlaggedMessage,
            );
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
                          child:
                              const CircularProgressIndicator(strokeWidth: 1),
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
