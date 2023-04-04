import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/presentation/communities/widgets/image_item_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/text_message_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/models/message.dart';

class NormalMessageWidget extends StatelessWidget {
  const NormalMessageWidget({
    super.key,
    required this.message,
    required this.wasSentByUser,
    required this.roomID,
  });

  final Message? message;
  final bool wasSentByUser;
  final String roomID;

  @override
  Widget build(BuildContext context) {
    final String sender = message?.sender?.split(':').first ?? '';
    final String formattedSender = sender.split('@').last;
    final String timeStamp = formatTimestamp(message?.timeStamp);

    final Widget formattedSenderWidget = !wasSentByUser
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              formattedSender,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          )
        : const SizedBox();

    final String msgType = message?.content?.msgType ?? UNKNOWN;

    switch (msgType) {
      case MatrixMessageTypes.text:
        return TextMessageWidget(
          wasSentByUser: wasSentByUser,
          senderWidget: formattedSenderWidget,
          timestamp: timeStamp,
          messageBody: message?.content?.body,
          roomID: roomID,
          eventID: message?.eventID ?? '',
          senderID: message?.sender ?? '',
        );

      case MatrixMessageTypes.image:
        final String imgURI =
            ChatAPI.getMediaURL(mediaUrl: message?.content?.url) ?? '';

        return ImageItemWidget(
          wasSentByUser: wasSentByUser,
          sender: formattedSenderWidget,
          timestamp: timeStamp,
          imageURL: imgURI,
          roomID: roomID,
          eventID: message?.eventID ?? '',
          senderID: message?.sender ?? '',
        );

      default:
        return const SizedBox();
    }
  }
}
