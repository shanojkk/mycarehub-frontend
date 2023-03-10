import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/pages/room_list_item_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class RoomListPage extends StatelessWidget {
  const RoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversations'),
      bottomNavigationBar: const BottomNavBar(bottomNavIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: StoreConnector<AppState, RoomListViewModel>(
                converter: (Store<AppState> store) {
                  return RoomListViewModel.fromStore(store);
                },
                onInit: (Store<AppState> store) {},
                builder: (BuildContext context, RoomListViewModel vm) {
                  if (vm.wait?.isWaitingFor(syncingEventsFlag) ?? false) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          const Text('Fetching your messages...'),
                          mediumVerticalSizedBox,
                          const CircularProgressIndicator(),
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
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.createRoomPageRoute);
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
