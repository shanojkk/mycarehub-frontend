import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/flagged_messages/fetch_flagged_messages_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/flagged_messages/widgets/moderation_actions_dialog.dart';
import 'package:pro_health_360/presentation/communities/group_info/view_models/flagged_messages_view_model.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FlaggedMessagesPage extends StatelessWidget {
  const FlaggedMessagesPage();

  void _showActionsDialog({
    required String messageId,
    required String communityName,
    required String memberId,
    required String communityId,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModerationActionsDialog(
          messageId: messageId,
          communityName: communityName,
          memberId: memberId,
          communityId: communityId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;

    String channelName = 'No name';

    final String channelID = channel.id!;

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    return Scaffold(
      appBar: const CustomAppBar(title: flaggedMessagesString),
      body: StoreConnector<AppState, FlaggedMessagesViewModel>(
        converter: (Store<AppState> store) =>
            FlaggedMessagesViewModel.fromStore(store),
        onInit: (Store<AppState> store) {
          StoreProvider.dispatch(
            context,
            FetchFlaggedMessagesAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
              communityCID: channelID,
            ),
          );
        },
        builder: (BuildContext context, FlaggedMessagesViewModel vm) {
          if (vm.wait.isWaitingFor(fetchFlaggedMessagesFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }

          final List<Message?> flaggedMessages =
              vm.flaggedMessages ?? <Message>[];

          if (flaggedMessages.isEmpty) {
            return GenericErrorWidget(
              actionKey: helpNoDataWidgetKey,
              headerIconSvgUrl: noFlaggedMessagesImage,
              recoverCallback: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  FetchFlaggedMessagesAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                    communityCID: channelID,
                    onFailure: (String message) {
                      showTextSnackbar(
                        ScaffoldMessenger.of(context),
                        content: message,
                      );
                    },
                  ),
                );
              },
              messageTitle: noFlaggedMessagesTitle,
              messageBody: <TextSpan>[
                TextSpan(
                  text: messagesDisplayedHereText,
                  style: normalSize16Text(AppColors.greyTextColor),
                ),
                const TextSpan(text: '\n\n'),
                TextSpan(
                  text: canDeleteOrBanText,
                  style: normalSize16Text(AppColors.greyTextColor),
                ),
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      channelName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    flaggedMessagesDescription,
                    style: TextStyle(color: Color(0xFF7A7B8E)),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: flaggedMessages.length,
                    itemBuilder: (_, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: StreamMessageWidget(
                          onMessageActions:
                              (BuildContext context, Message message) {},
                          onMessageTap: (Message message) {
                            String channelName = '';
                            if (channel.extraData.containsKey('Name')) {
                              channelName =
                                  channel.extraData['Name']! as String;
                            }

                            _showActionsDialog(
                              messageId: message.id,
                              memberId: message.user!.id,
                              communityId: channelID,
                              communityName: channelName,
                              context: context,
                            );
                          },
                          message: flaggedMessages[index]!,
                          messageTheme:
                              StreamChatTheme.of(context).ownMessageTheme,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
