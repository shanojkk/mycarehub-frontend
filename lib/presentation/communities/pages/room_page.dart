import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/pages/message_item_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/review_invite_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/send_message_input.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomPage extends StatelessWidget {
  RoomPage({super.key, required this.room});

  final Room room;
  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String roomName = room.name ?? noNameText;
    final String roomID = room.roomID ?? UNKNOWN;
    final String roomInitials = getInitials(room.name ?? 'No room name');
    final bool isInvite = room.invite ?? false;

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: StoreConnector<AppState, RoomPageViewModel>(
              converter: (Store<AppState> store) =>
                  RoomPageViewModel.fromStore(store),
              builder: (BuildContext context, RoomPageViewModel vm) {
                final Room? currentRoom = vm.selectedRoom;

                if (isInvite) {
                  return ReviewInviteWidget(room: room);
                }

                final List<Message?>? roomEvents = currentRoom?.state?.events;
                final List<Message?>? roomMessages =
                    currentRoom?.timeline?.events;

                final List<Message?> allMessages = <Message?>[
                  ...?roomEvents,
                  ...?roomMessages
                ];

                final List<Message?>? organizedEvents =
                    organizeEventTimeline(allMessages);

                if (organizedEvents?.isEmpty ?? true) {
                  return const Center(child: Text('No messages here'));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  padding: EdgeInsets.only(
                    top: (organizedEvents?.length ?? 0) < 10 ? 200 : 0,
                  ),
                  itemCount: organizedEvents?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message currentMsg = organizedEvents![index]!;

                    return MessageItemWidget(
                      message: currentMsg,
                      roomID: roomID,
                    );
                  },
                );
              },
            ),
          ),

          /// Send message input
          Visibility(
            visible: !isInvite,
            child: SendMessageInput(roomID: roomID),
          ),
        ],
      ),
    );
  }
}
