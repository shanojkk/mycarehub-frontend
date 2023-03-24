import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/invite_users_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/strings.dart';
import 'package:sghi_core/communities/models/user.dart';

class InviteUserWidget extends StatelessWidget {
  const InviteUserWidget({
    required this.user,
    required this.authUserID,
    required this.roomID,
  });

  final User user;

  final String authUserID;

  final String roomID;

  @override
  Widget build(BuildContext context) {
    final String name = user.displayName ?? 'No Name';
    final String? userID = user.userID;
    final bool isSelf = userID == authUserID;

    return InkWell(
      key: Key(userID ?? UNKNOWN),
      onTap: () async {
        if (!isSelf) {
          StoreProvider.dispatch<AppState>(
            context,
            InviteUserAction(
              roomID: roomID,
              userID: userID!,
              client: AppWrapperBase.of(context)!.communitiesClient!,
              onSuccess: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        '$name has been invited successfully',
                      ),
                    ),
                  );

                Navigator.of(context).pop();
              },
            ),
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
          ],
        ),
      ),
    );
  }
}
