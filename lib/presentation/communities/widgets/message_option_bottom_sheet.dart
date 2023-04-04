import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/report_message_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/confirm_dialog_component.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_item_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class MessageOptionBottomSheet extends StatelessWidget {
  const MessageOptionBottomSheet({
    super.key,
    required this.wasSentByUser,
    required this.roomID,
    required this.eventID,
    required this.senderID,
  });

  final bool wasSentByUser;
  final String roomID;
  final String eventID;
  final String senderID;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MessageOptionsViewModel>(
      converter: (Store<AppState> store) =>
          MessageOptionsViewModel.fromStore(store),
      builder: (BuildContext context, MessageOptionsViewModel vm) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const Text(
              messageOptions,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            MessageOptionItem(
              title: reportMessageText,
              onTap: () async {
                Navigator.of(context).pop();

                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmDialogComponent(
                      onConfirm: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          ReportMessageACtion(
                            roomID: roomID,
                            eventID: eventID,
                            onSuccess: () {
                              Navigator.of(context).pop();
                            },
                            client:
                                AppWrapperBase.of(context)!.communitiesClient!,
                          ),
                        );
                      },
                      title: '$reportMessageText?',
                      description: reportMessagePrompt,
                    );
                  },
                );
              },
              buttonKey: reportMessageKey,
              iconData: Icons.report_outlined,
              contentColor: AppColors.redColor,
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
                    Navigator.of(context).pop();

                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmDialogComponent(
                          onConfirm: () {
                            StoreProvider.dispatch<AppState>(
                              context,
                              DeleteMessageAction(
                                roomID: roomID,
                                eventID: eventID,
                                senderID: senderID,
                                onSuccess: () => Navigator.of(context).pop(),
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                          },
                          title: '$deleteMessage?',
                          description: deleteMessagePrompt,
                        );
                      },
                    );
                  },
                  contentColor: AppColors.redColor,
                  iconData: Icons.delete,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
