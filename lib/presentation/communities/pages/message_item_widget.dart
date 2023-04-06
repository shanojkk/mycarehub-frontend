import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/event_types.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/communities/widgets/normal_message_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/update_message_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/models/message.dart';

class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({
    super.key,
    required this.message,
    required this.roomID,
    this.isFlaggedMessage = false,
  });

  // Whether this message being displayed is a flagged message
  final bool isFlaggedMessage;

  // The message to render
  final Message message;

  // The room to which this message was sent
  final String roomID;

  @override
  Widget build(BuildContext context) {
    final String userID = StoreProvider.state<AppState>(context)
            ?.clientState
            ?.clientProfile
            ?.id ??
        '';
    final String timeStamp = formatTimestamp(message.timeStamp);
    final bool wasSentByUser = message.sender == userID;

    Widget getRoomUpdatesWidget(Message? message) {
      final String eventType = message?.eventType ?? UNKNOWN;
      final MessageContent? messageContent = message?.content;
      final String sender = formatUsername(message?.sender);

      switch (eventType) {
        case EventTypes.member:
          final String displayName = messageContent?.displayName ?? '';
          final MembershipEventTypes? memberShipType =
              messageContent?.membership;

          final String info =
              processMembership(memberShipType, displayName, sender);

          return UpdateMessageWidget(msg: info);

        case EventTypes.topic:
          final String topic = messageContent?.topic ?? '';

          return UpdateMessageWidget(msg: topicSetMsg(topic));

        case EventTypes.creation:
          final String creator = formatUsername(messageContent?.creator);
          final String msg = groupCreationMsg(creator, timeStamp);

          return UpdateMessageWidget(msg: msg);

        case EventTypes.redaction:
          return const UpdateMessageWidget(
            msg: deletedMsgText,
            icon: Icons.delete_rounded,
          );

        case EventTypes.message:
          return NormalMessageWidget(
            message: message,
            wasSentByUser: wasSentByUser,
            roomID: roomID,
            isFlaggedMessage: isFlaggedMessage,
          );

        default:
          return const SizedBox();
      }
    }

    return getRoomUpdatesWidget(message);
  }
}
