import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/ban_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/kick_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/promote_to_moderator_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/message_option_item_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/strings.dart';
import 'package:sghi_core/misc_utilities/misc.dart';

class UserOptionsBottomSheet extends StatelessWidget {
  const UserOptionsBottomSheet({
    super.key,
    required this.roomID,
    required this.userID,
    required this.name,
  });

  final String roomID;
  final String? userID;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          const Text(
            actionsString,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
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
                  client: AppWrapperBase.of(context)!.communitiesClient!,
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
            iconData: Icons.security,
            contentColor: AppColors.primaryColor,
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
                  client: AppWrapperBase.of(context)!.communitiesClient!,
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
            contentColor: Colors.redAccent,
            iconData: Icons.remove,
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
            contentColor: Colors.redAccent,
            iconData: Icons.block_outlined,
          ),
        ],
      ),
    );
  }
}
