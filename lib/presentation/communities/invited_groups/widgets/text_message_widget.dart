import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_action.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_item_widget.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

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
            // TODO!(abiud): populate these values dynamically based on power level
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
                    MessageOptionItem(
                      title: replyInThread,
                      onTap: () {},
                      buttonKey: replyMessageKey,
                    ),
                    if (vm.isDeletingMessage)
                      const Center(child: CircularProgressIndicator())
                    else
                      Visibility(
                        visible: wasSentByUser,
                        child: MessageOptionItem(
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
                                client: AppWrapperBase.of(context)!
                                    .communitiesClient!,
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
