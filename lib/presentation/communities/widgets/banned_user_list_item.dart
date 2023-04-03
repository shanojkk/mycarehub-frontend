import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/un_ban_user_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/strings.dart';

class BannedUserListItem extends StatelessWidget {
  const BannedUserListItem({
    required this.userID,
    required this.roomID,
    this.optionKey,
  });

  final String userID;
  final String roomID;

  final Key? optionKey;

  @override
  Widget build(BuildContext context) {
    final String name = formatUsername(userID);

    return InkWell(
      key: optionKey,
      borderRadius: BorderRadius.circular(8),
      highlightColor: Colors.purple.withOpacity(0.3),
      onTap: () {
        StoreProvider.dispatch<AppState>(
          context,
          UnBanUserAction(
            roomID: roomID,
            userID: userID,
            client: AppWrapperBase.of(context)!.graphQLClient,
            onSuccess: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(unBanUserSuccess)),
              );
            },
            onError: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(failedToUnban),
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Avatar(avatarURI: UNKNOWN, displayName: name.split('@').last),
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
