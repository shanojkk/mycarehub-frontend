// ignore_for_file: avoid_dynamic_calls

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_room_members_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/leave_room_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/invite_users_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_list_page.dart';
import 'package:pro_health_360/presentation/communities/widgets/user_list_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class RoomInfoPage extends StatelessWidget {
  const RoomInfoPage({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String roomInitials = getInitials(room.name ?? 'No room name');

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text('${room.name ?? ''} info')),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple.withOpacity(0.4),
            ),
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Text(
                roomInitials.toUpperCase(),
                style: heavySize20Text(Colors.purple),
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  room.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${room.summary?.joinedMembers?.toString() ?? ''} members',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (room.topic?.isNotEmpty ?? false) ...<Widget>[
                  const SizedBox(height: 10),
                  Text(
                    room.topic ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Group members',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Long press on a member to promote them to a moderator, '
            'remove or ban them from this group',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              key: inviteUsersKey,
              onPressed: () async {
                // Search for a user and add them
                // navigate to rooms page
                Navigator.of(context).push(
                  MaterialPageRoute<bool>(
                    builder: (BuildContext context) => InviteUsersPage(
                      room: room,
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(inviteMembers),
              ),
            ),
          ),
          StoreConnector<AppState, RoomInfoViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchRoomMembersAction(
                  roomID: room.roomID!,
                  client: AppWrapperBase.of(context)!.graphQLClient,
                ),
              );
            },
            converter: (Store<AppState> store) {
              return RoomInfoViewModel.fromStore(store);
            },
            builder: (BuildContext context, RoomInfoViewModel vm) {
              if (vm.wait?.isWaitingFor(fetchRoomMembersFlag) ?? false) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<RoomUser>? users = vm.groupInfoMembers;

              return ListView.builder(
                itemCount: users?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final RoomUser currentUser = users![index];

                  return UserListItem(
                    name: currentUser.roomUser?.displayName ?? 'No Name',
                    userID: currentUser.roomUser?.userID ?? 'No User ID',
                    isModerator: currentUser.moderator,
                    isSelf: currentUser.roomUser?.userID == vm.authUserID,
                    roomID: room.roomID ?? '',
                  );
                },
              );
            },
          ),
          StoreConnector<AppState, RoomInfoViewModel>(
            converter: (Store<AppState> store) =>
                RoomInfoViewModel.fromStore(store),
            builder: (BuildContext context, RoomInfoViewModel vm) {
              if (vm.wait?.isWaitingFor(leaveRoomFlag) ?? false) {
                return const Center(child: CircularProgressIndicator());
              }
              return TextButton(
                key: leaveRoomKey,
                onPressed: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    LeaveRoomAction(
                      roomID: room.roomID!,
                      onSuccess: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const RoomListPage(),
                          ),
                        );
                      },
                      client: AppWrapperBase.of(context)!.graphQLClient,
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(leaveRoom),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
