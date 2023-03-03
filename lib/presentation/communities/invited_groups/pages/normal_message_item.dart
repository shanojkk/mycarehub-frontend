import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';

import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class NormalMessageItem extends StatelessWidget {
  const NormalMessageItem({
    super.key,
    required this.isUserSent,
    required this.senderWidget,
    required this.timestamp,
    required this.roomID,
    required this.senderID,
    required this.eventID,
    this.messageBody,
  });

  final bool isUserSent;
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
            return StoreConnector<AppState, MessageOptionsViewModel>(
              converter: (Store<AppState> store) =>
                  MessageOptionsViewModel.fromStore(store),
              builder: (BuildContext context, MessageOptionsViewModel vm) =>
                  Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    const Text(
                      messageOptions,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    MessageReactionItem(
                      title: replyInThread,
                      onTap: () {},
                      buttonKey: replyMessageKey,
                    ),
                    if (vm.isDeletingMessage)
                      const Center(child: CircularProgressIndicator())
                    else
                      Visibility(
                        visible: isUserSent,
                        child: MessageReactionItem(
                          buttonKey: deleteMessageKey,
                          title: deleteMessage,
                          onTap: () async {
                            StoreProvider.dispatch<AppState>(
                              context,
                              DeleteMessageAction(
                                roomID: roomID,
                                eventID: eventID,
                                senderID: senderID,
                                onSuccess: (String eventID) {
                                  if (eventID.isNotEmpty) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                          },
                          textColor: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: isUserSent ? 50 : 10,
          right: isUserSent ? 10 : 50,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: isUserSent ? const Radius.circular(10) : Radius.zero,
            topRight: isUserSent ? Radius.zero : const Radius.circular(10),
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
          ),
          color:
              Theme.of(context).primaryColor.withOpacity(isUserSent ? .5 : .2),
        ),
        child: Column(
          crossAxisAlignment:
              isUserSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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

class MessageReactionItem extends StatelessWidget {
  const MessageReactionItem({
    required this.title,
    required this.onTap,
    this.textColor,
    this.iconColor,
    this.iconData,
    this.buttonKey,
  });

  final Key? buttonKey;

  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? iconColor;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: buttonKey,
      onTap: () {
        onTap.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Visibility(
              visible: iconData != null,
              child: Icon(iconData, size: 32, color: iconColor),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
