import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/leave_room_action.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';
import 'package:pro_health_360/presentation/communities/widgets/confirm_dialog_component.dart';
import 'package:pro_health_360/presentation/communities/widgets/group_user_widget.dart';
import 'package:pro_health_360/presentation/communities/widgets/moderation_banner.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

import 'package:pro_health_360/application/redux/actions/communities/fetch_room_members_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class RoomInfoPage extends StatelessWidget {
  const RoomInfoPage({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String roomName = room.name ?? '';
    return Scaffold(
      appBar: CustomAppBar(
        title: roomInformationString(roomName),
        trailingWidget: const SizedBox(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Center(
            child: Avatar(
              avatarURI: room.avatarUri,
              displayName: room.name,
              aviSize: 100,
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                smallVerticalSizedBox,
                Text(
                  roomName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                smallVerticalSizedBox,
                Text(
                  groupMembersCount(
                    room.summary?.joinedMembers?.toString() ?? '',
                  ),
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
          mediumVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                groupMembersText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                key: inviteUsersKey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.inviteUsersPageRoute,
                    arguments: room,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(inviteMembersText),
                ),
              ),
            ],
          ),
          ModerationBanner(
            title: bannedMembersString,
            body: tapToViewBannedMembersString,
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.bannedMembersRoute, arguments: room);
            },
          ),
          mediumVerticalSizedBox,
          const Text(
            longPressInstruction,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          mediumVerticalSizedBox,

          StoreConnector<AppState, RoomInfoViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchRoomMembersAction(
                  roomID: room.roomID!,
                  client: AppWrapperBase.of(context)!.communitiesClient!,
                ),
              );
            },
            converter: (Store<AppState> store) {
              return RoomInfoViewModel.fromStore(store);
            },
            builder: (BuildContext context, RoomInfoViewModel vm) {
              if (vm.fetchingMembers) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 1)),
                );
              }

              final List<RoomUser>? users = vm.groupInfoMembers;

              return ListView.builder(
                itemCount: users?.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final RoomUser currentUser = users![index];

                  return GroupUserWidget(
                    user: currentUser,
                    authUserID: vm.authUserID,
                    roomID: room.roomID!,
                  );
                },
              );
            },
          ),
          mediumVerticalSizedBox,
          ModerationBanner(
            title: flaggedMessagesString,
            body: tapToViewFlaggedMessagesText,
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.flaggedMessagesRoute, arguments: room);
            },
          ),
          mediumVerticalSizedBox,
          // Leave room button
          StoreConnector<AppState, RoomInfoViewModel>(
            converter: (Store<AppState> store) =>
                RoomInfoViewModel.fromStore(store),
            builder: (BuildContext context, RoomInfoViewModel vm) {
              if (vm.leavingRoom) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 1),
                );
              }
              return SizedBox(
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: leaveRoomKey,
                  text: leaveRoom,
                  textColor: AppColors.redColor,
                  buttonColor: AppColors.redColor.withOpacity(.1),
                  borderColor: Colors.transparent,
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmDialogComponent(
                          onConfirm: () {
                            StoreProvider.dispatch<AppState>(
                              context,
                              LeaveRoomAction(
                                roomID: room.roomID!,
                                onSuccess: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.roomListPageRoute);
                                },
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                          },
                          title: '$leaveRoom?',
                          description: leaveGroupPrompt,
                          confirmKey: confirmLeaveRoomKey,
                          cancelKey: cancelLeaveRoomKey,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
