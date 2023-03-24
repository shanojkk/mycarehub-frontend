import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/set_room_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/strings.dart';

class RoomListItemWidget extends StatelessWidget {
  const RoomListItemWidget({super.key, required this.currentRoom});

  final Room currentRoom;

  @override
  Widget build(BuildContext context) {
    final String groupName = currentRoom.name ?? 'Empty room';

    final bool isInvite = currentRoom.invite ?? false;

    final String joinedMemberCount =
        currentRoom.summary?.joinedMembers?.toString() ?? 'no';

    final String? avatarURI = currentRoom.avatarUri;

    return InkWell(
      key: Key(currentRoom.roomID ?? UNKNOWN),
      onTap: () {
        StoreProvider.dispatch<AppState>(
          context,
          SetRoom(roomID: currentRoom.roomID),
        );
        Navigator.of(context)
            .pushNamed(AppRoutes.roomPageRoute, arguments: currentRoom);
      },
      borderRadius: BorderRadius.circular(8),
      highlightColor: Colors.purple.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Avatar(avatarURI: avatarURI, displayName: groupName),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  groupName,
                  style: TextStyle(
                    color: Colors.purple.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  isInvite
                      ? invitedString
                      : groupMembersCount(joinedMemberCount),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
