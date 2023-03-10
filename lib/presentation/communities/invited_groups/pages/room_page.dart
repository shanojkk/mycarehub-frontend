import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/send_message_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/message_widget.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/review_invite_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomPage extends StatelessWidget {
  RoomPage({super.key, required this.room});

  final Room room;
  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String roomName = room.name ?? 'No name';
    final String roomID = room.roomID ?? UNKNOWN;
    final String roomInitials = getInitials(room.name ?? 'No room name');

    return Scaffold(
      appBar: CustomAppBar(
        title: roomName,
        trailingWidget: GestureDetector(
          key: navigateToGroupInfoPageKey,
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.roomInfoPageRoute, arguments: room);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple.withOpacity(0.4),
            ),
            padding: const EdgeInsets.all(15),
            child: Text(
              roomInitials.toUpperCase(),
              style: heavySize14Text(Colors.purple),
            ),
          ),
        ),
      ),
      body: StoreConnector<AppState, RoomPageViewModel>(
        converter: (Store<AppState> store) =>
            RoomPageViewModel.fromStore(store),
        builder: (BuildContext context, RoomPageViewModel vm) {
          final bool isInvite = room.invite ?? false;

          final Map<String, Room>? rooms =
              isInvite ? vm.invitedRooms : vm.joinedRooms;

          if (isInvite) {
            return ReviewInviteWidget(room: room);
          }

          /// Extract the room details directly from state
          final Room? currentRoom = rooms![roomID];

          final List<Message?>? roomEvents = currentRoom?.state?.events;
          final List<Message?>? roomMessages = currentRoom?.timeline?.events;

          final List<Message?> allMessages = <Message?>[
            ...?roomEvents,
            ...?roomMessages
          ];

          final List<Message?>? organizedEvents =
              organizeEventTimeline(allMessages);

          if (organizedEvents?.isEmpty ?? true) {
            return const Center(child: Text('No messages here'));
          }

          return Column(
            children: <Widget>[
              // Messages list
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  padding: EdgeInsets.only(
                    top: (organizedEvents?.length ?? 0) < 10 ? 200 : 0,
                  ),
                  itemCount: organizedEvents?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message currentMsg = organizedEvents![index]!;

                    return MessageWidget(message: currentMsg, roomID: roomID);
                  },
                ),
              ),

              /// Send message input
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  key: messageInputKey,
                  decoration: InputDecoration(
                    labelText: 'Send a text message...',
                    hintText: 'Type your text message...',
                    contentPadding: const EdgeInsets.only(left: 20, bottom: 32),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: IconButton(
                      key: sendMessageIconKey,
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        /// Add send message logic here
                        if (msgCtrl.text.isNotEmpty) {
                          StoreProvider.dispatch<AppState>(
                            context,
                            SendMessageAction(
                              roomID: room.roomID!,
                              onSuccess: (String roomID) {
                                if (roomID.isNotEmpty) {
                                  msgCtrl.clear();
                                } else {
                                  // Show an error snackbar here
                                }
                              },
                              message: msgCtrl.text,
                              client: AppWrapperBase.of(context)!
                                  .communitiesClient!,
                            ),
                          );
                        }
                      },
                      color: Theme.of(context).primaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: msgCtrl,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
