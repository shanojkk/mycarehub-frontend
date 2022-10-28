import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/groups/groups_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/communities/chat_screen/widgets/chat_page_app_bar.dart';
import 'package:pro_health_360/presentation/communities/group_info/pages/group_info_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Channel channel = StreamChannel.of(context).channel;

    StoreProvider.dispatch<AppState>(
      context,
      FetchGroupMembersAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        channelId: channel.id!,
        onError: (String? error) {
          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: getErrorMessage(groupMembersText.toLowerCase()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;
    String channelImage = '';

    String channelName = noTitleText;

    String channelDescription = '';

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    if (channel.extraData.containsKey('image')) {
      channelImage = channel.extraData['image']! as String;
    }

    if (channel.extraData.containsKey('Description')) {
      channelDescription = channel.extraData['Description']! as String;
    }

    return Scaffold(
      appBar: ChatPageAppBar(
        onTitleTap: () {
          _navigateToGroupInfoPage(
            context,
            channel,
            channelName,
            channelDescription,
          );
        },
        title: Text(channelName, overflow: TextOverflow.ellipsis),
        subtitle: StoreConnector<AppState, GroupsViewModel>(
          converter: (Store<AppState> store) {
            return GroupsViewModel.fromStore(store);
          },
          builder: (BuildContext context, GroupsViewModel vm) {
            if (vm.wait.isWaitingFor(fetchGroupMembersFlag)) {
              return const SizedBox(
                height: 12,
                width: 12,
                child: PlatformLoader(),
              );
            }

            final Community? community = vm.communities?.first;

            if (community == null) return const SizedBox();

            final int groupMembersLength = vm.groupMembers?.length ?? 0;

            return Text('$groupMembersLength members');
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _navigateToGroupInfoPage(
                context,
                channel,
                channelName,
                channelDescription,
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: channelImage.isNotEmpty
                    ? Image.network(channelImage, fit: BoxFit.cover)
                    : SvgPicture.asset(
                        acceptInvitesImage,
                        height: 30,
                        width: 30,
                      ),
              ),
            ),
          ),
          size15HorizontalSizedBox,
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamMessageListView(
              threadBuilder: (_, Message? parentMessage) {
                return ThreadPage(parent: parentMessage);
              },
              onThreadTap: (Message message, Widget? widget) {
                AnalyticsService().logEvent(
                  name: viewMessageThreadEvent,
                  eventType: AnalyticsEventType.CONVERSATION,
                  parameters: <String, dynamic>{
                    'channel_name': channelName,
                    'parent_message_id': message.parentId,
                    'message_id': message.id,
                    'text': message.text,
                    'reactions': message.reactionCounts,
                    'attachment_count': message.attachments.length,
                  },
                );
              },
            ),
          ),
          StreamMessageInput(
            onMessageSent: (Message message) {
              AnalyticsService().logEvent(
                name: sendMessageEvent,
                eventType: AnalyticsEventType.CONVERSATION,
                parameters: <String, dynamic>{
                  'channel_name': channelName,
                  'message_id': message.id,
                  'text': message.text,
                  'reactions': message.reactionCounts,
                  'attachment_count': message.attachments.length,
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> _navigateToGroupInfoPage(
    BuildContext context,
    Channel channel,
    String channelName,
    String channelDescription,
  ) {
    AnalyticsService().logEvent(
      name: viewGroupInfoEvent,
      eventType: AnalyticsEventType.CONVERSATION,
      parameters: <String, dynamic>{'channel_name': channelName},
    );
    return Navigator.of(context).push(
      MaterialPageRoute<Route<dynamic>>(
        builder: (_) => StreamChannel(
          channel: channel,
          child: GroupInfoPage(
            channelName: channelName,
            channelDesc: channelDescription,
          ),
        ),
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  const ThreadPage({super.key, this.parent});

  final Message? parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamThreadHeader(parent: parent!),
      body: Column(
        children: <Widget>[
          Expanded(child: StreamMessageListView(parentMessage: parent)),
          const StreamMessageInput(),
        ],
      ),
    );
  }
}
