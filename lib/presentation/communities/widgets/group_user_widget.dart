import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/ban_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/kick_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/promote_to_moderator_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_item_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/strings.dart';
import 'package:sghi_core/communities/models/user.dart';
import 'package:sghi_core/misc_utilities/misc.dart';

class GroupUserWidget extends StatelessWidget {
  const GroupUserWidget({
    required this.user,
    required this.authUserID,
    required this.roomID,
  });

  final RoomUser user;

  /// You can't perform moderation actions on yourself
  final String authUserID;

  final String roomID;

  @override
  Widget build(BuildContext context) {
    final String name = user.roomUser?.displayName ?? noNameText;
    final String? userID = user.roomUser?.userID;
    final bool isSelf = userID == authUserID;

    return InkWell(
      key: openUserListOptionDialogKey,
      onTap: () async {
        if (!isSelf) {
          await showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    const Text(
                      actionsString,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    MessageOptionItem(
                      buttonKey: promoteToModKey,
                      title: promoteToModText,
                      onTap: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          PromoteToModeratorAction(
                            roomID: roomID,
                            userID: userID ?? UNKNOWN,
                            client:
                                AppWrapperBase.of(context)!.communitiesClient!,
                            onSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackbar(
                                  content: modSuccessMessage(name),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                      iconData: Icons.add_task_rounded,
                      iconColor: Colors.greenAccent,
                    ),
                    MessageOptionItem(
                      buttonKey: removeFromGroupKey,
                      title: removeFromGroupText,
                      onTap: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          KickUserAction(
                            roomID: roomID,
                            userID: userID ?? UNKNOWN,
                            client:
                                AppWrapperBase.of(context)!.communitiesClient!,
                            onSuccess: () {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text(successRemoveFromGroup),
                                  ),
                                );
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                      textColor: Colors.redAccent,
                      iconData: Icons.remove,
                      iconColor: Colors.redAccent,
                    ),
                    MessageOptionItem(
                      buttonKey: banUserKey,
                      title: banUserText,
                      onTap: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          BanUserAction(
                            roomID: roomID,
                            userID: userID ?? UNKNOWN,
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            onSuccess: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(content: Text(successBanText)),
                                );
                            },
                          ),
                        );
                      },
                      textColor: Colors.redAccent,
                      iconData: Icons.block,
                      iconColor: Colors.redAccent,
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Avatar(avatarURI: UNKNOWN, displayName: name),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            if (user.moderator ?? false)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff00BE33).withOpacity(.1),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                ),
                child: const Text(
                  moderatorText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
