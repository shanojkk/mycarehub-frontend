import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/ban_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/delete_message_report_action.dart';
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
    this.isFlaggedMessage = false,
  });

  final bool wasSentByUser;
  final String roomID;
  final String eventID;
  final String senderID;

  // Whether this message being displayed is a flagged message
  final bool isFlaggedMessage;

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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: isFlaggedMessage,
              child: MessageOptionItem(
                buttonKey: deleteMessageReportKey,
                title: removeMessageReport,
                onTap: () async {
                  Navigator.of(context).pop();

                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmDialogComponent(
                        onConfirm: () {
                          StoreProvider.dispatch<AppState>(
                            context,
                            DeleteMessageReportAction(
                              roomID: roomID,
                              onSuccess: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              client: AppWrapperBase.of(context)!
                                  .communitiesClient!,
                            ),
                          );
                        },
                        title: '$deleteMessage?',
                        description: deleteMessagePrompt,
                      );
                    },
                  );
                },
                contentColor: AppColors.purpleChillColor,
                iconData: Icons.delete,
              ),
            ),
            Visibility(
              visible: !isFlaggedMessage,
              child: MessageOptionItem(
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
                              client: AppWrapperBase.of(context)!
                                  .communitiesClient!,
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
            ),
            if (vm.isDeletingMessage)
              const Center(child: CircularProgressIndicator(strokeWidth: 1))
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
                                client: AppWrapperBase.of(context)!
                                    .communitiesClient!,
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
            Visibility(
              visible: isFlaggedMessage && !wasSentByUser,
              child: MessageOptionItem(
                buttonKey: banUserKey,
                title: banUserText,
                onTap: () {
                  StoreProvider.dispatch<AppState>(
                    context,
                    BanUserAction(
                      roomID: roomID,
                      userID: senderID,
                      client: AppWrapperBase.of(context)!.graphQLClient,
                      onSuccess: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(content: Text(successBanText)),
                          );
                      },
                    ),
                  );
                },
                contentColor: Colors.redAccent,
                iconData: Icons.block_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
