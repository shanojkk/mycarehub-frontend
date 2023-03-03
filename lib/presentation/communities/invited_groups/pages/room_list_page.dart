import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';

import 'package:pro_health_360/application/redux/actions/communities/communities_logout_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/create_room_page.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_list_item_widget.dart';
import 'package:pro_health_360/presentation/onboarding/login/pages/login_page.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        leading: StoreConnector<AppState, RoomListViewModel>(
          converter: (Store<AppState> store) =>
              RoomListViewModel.fromStore(store),
          builder: (BuildContext context, RoomListViewModel vm) {
            if (vm.wait?.isWaitingFor(communitiesSignOutFlag) ?? false) {
              return const SizedBox(
                child: CircularProgressIndicator(),
              );
            }
            return IconButton(
              key: logoutKey,
              onPressed: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  CommunitiesLogoutAction(
                    onSuccess: () => Navigator.of(context).push(
                      MaterialPageRoute<bool>(
                        builder: (BuildContext context) => const LoginPage(),
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.logout),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StoreConnector<AppState, RoomListViewModel>(
                  converter: (Store<AppState> store) {
                    return RoomListViewModel.fromStore(store);
                  },
                  builder: (BuildContext context, RoomListViewModel vm) {
                    final String userName = formatUsername(vm.displayName);
                    return Text(
                      'Welcome $userName',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                Center(
                  child: TextButton(
                    key: navToCreateRoomKey,
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute<bool>(
                          builder: (_) => const CreateRoomPage(),
                        ),
                      );
                    },
                    child: const Text('Create a room'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: StoreConnector<AppState, RoomListViewModel>(
                converter: (Store<AppState> store) {
                  return RoomListViewModel.fromStore(store);
                },
                builder: (BuildContext context, RoomListViewModel vm) {
                  if (vm.wait?.isWaitingFor(syncingEventsFlag) ?? false) {
                    return Center(
                      child: Column(
                        children: const <Widget>[
                          Text('Fetching your messages...'),
                          SizedBox(height: 20),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }

                  final List<Room>? invitedRooms =
                      vm.invitedRooms?.values.toList();

                  final List<Room>? joinedRooms =
                      vm.joinedRooms?.values.toList();

                  final List<Room> allRooms = <Room>[
                    ...?invitedRooms,
                    ...?joinedRooms
                  ];

                  if (allRooms.isEmpty) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Sorry, You have no rooms yet. No worries though, '
                            'tap the button below to'
                            ' create your first group',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: TextButton(
                              key: emptyChatsNewRoomKey,
                              onPressed: () async {
                                Navigator.of(context).push(
                                  MaterialPageRoute<bool>(
                                    builder: (_) => const CreateRoomPage(),
                                  ),
                                );
                              },
                              child: const Text('Create a room'),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: allRooms.length,
                    itemBuilder: (BuildContext context, int i) {
                      final Room currentRoom = allRooms[i];
                      final String groupName = currentRoom.name ?? 'No name';
                      final String groupMembers =
                          currentRoom.summary?.joinedMembers.toString() ?? 'no';
                      final bool isInvite = currentRoom.invite ?? false;

                      return RoomListItemWidget(
                        groupName: groupName,
                        currentRoom: currentRoom,
                        isInvite: isInvite,
                        groupMembers: groupMembers,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
