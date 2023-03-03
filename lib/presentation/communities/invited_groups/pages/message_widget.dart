import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/event_types.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/normal_message_widget.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/update_message_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/models/message.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message, required this.roomID});

  final Message message;
  final String roomID;

  @override
  Widget build(BuildContext context) {
    final String userID = StoreProvider.state<AppState>(context)
            ?.chatState
            ?.userProfile
            ?.userID ??
        '';
    final bool isUserSent = message.sender == userID;
    final String timeStamp = formatTimestamp(message.timeStamp);

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

          return UpdateMessageWidget(msg: 'The topic was set to $topic');

        case EventTypes.creation:
          final String creator = formatUsername(messageContent?.creator);
          final String msg = '$creator created the group on $timeStamp';

          return UpdateMessageWidget(msg: msg);

        case EventTypes.redaction:
          return const UpdateMessageWidget(
            msg: 'This message was deleted',
            icon: Icons.delete,
          );

        case EventTypes.message:
          return NormalMessageWidget(
            message: message,
            isUserSent: isUserSent,
            roomID: roomID,
          );

        default:
          return const SizedBox();
      }
    }

    return getRoomUpdatesWidget(message);
  }
}
