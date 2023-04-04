import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_bottom_sheet.dart';

class TextMessageWidget extends StatelessWidget {
  const TextMessageWidget({
    super.key,
    required this.wasSentByUser,
    required this.senderWidget,
    required this.timestamp,
    required this.roomID,
    required this.senderID,
    required this.eventID,
    this.messageBody,
  });

  final bool wasSentByUser;
  final Widget senderWidget;
  final String? messageBody;
  final String timestamp;

  // For deletion of the message
  final String roomID;
  final String eventID;
  final String senderID;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: messageOptionsKey,
      onTap: () {
        // Open the message in a new page
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
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: wasSentByUser ? 50 : 10,
          right: wasSentByUser ? 10 : 50,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: wasSentByUser ? const Radius.circular(10) : Radius.zero,
            topRight: wasSentByUser ? Radius.zero : const Radius.circular(10),
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
          ),
          color: Theme.of(context)
              .primaryColor
              .withOpacity(wasSentByUser ? .5 : .2),
        ),
        child: Column(
          crossAxisAlignment:
              wasSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            senderWidget,
            const SizedBox(height: 5),
            Text(messageBody ?? ''),
            const SizedBox(height: 10),
            Text(
              timestamp,
              style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
