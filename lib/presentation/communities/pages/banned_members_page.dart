import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_banned_room_members_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/widgets/banned_user_list_item.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/generic_error_widget.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/text_themes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class BannedMembersPage extends StatelessWidget {
  const BannedMembersPage({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: bannedMembersString,
        trailingWidget: SizedBox(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const Text(
            bannedMembersInstructions,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          mediumVerticalSizedBox,
          StoreConnector<AppState, BannedMembersViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchBannedRoomMembersAction(
                  roomID: room.roomID!,
                  client: AppWrapperBase.of(context)!.graphQLClient,
                ),
              );
            },
            converter: (Store<AppState> store) =>
                BannedMembersViewModel.fromStore(store),
            builder: (BuildContext context, BannedMembersViewModel vm) {
              if (vm.fetchingMembers) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<String?>? bannedUsers = vm.bannedUserIDs;

              if (bannedUsers?.isEmpty ?? true) {
                return GenericErrorWidget(
                  actionText: okThanks,
                  actionKey: emptyBannedMembersKey,
                  headerIconSvgUrl: noBannedMembersImage,
                  messageTitle: noBannedMembers,
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: noBannedMembersDescription,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                  recoverCallback: () {
                    Navigator.of(context).pop();
                  },
                );
              }

              return ListView.builder(
                itemCount: bannedUsers?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final String currentUserID = bannedUsers![index]!;

                  return BannedUserListItem(
                    userID: currentUserID,
                    roomID: room.roomID!,
                    optionKey: Key(currentUserID),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
