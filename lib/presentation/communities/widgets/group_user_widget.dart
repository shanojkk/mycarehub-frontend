import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';
import 'package:pro_health_360/presentation/communities/widgets/user_options_bottom_sheet.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/communities/models/strings.dart';
import 'package:sghi_core/communities/models/user.dart';

class GroupUserWidget extends StatelessWidget {
  const GroupUserWidget({
    required this.user,
    required this.authUserID,
    required this.roomID,
  });

  final RoomUser user;

  /// You can't perform moderation actions on yourself
  ///
  /// This is used to make sure of that
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
              return UserOptionsBottomSheet(
                roomID: roomID,
                userID: userID,
                name: name,
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
