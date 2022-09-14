// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/add_user_to_group_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/groups/groups_view_model.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

/// [SuggestedGroupCard] is a shared widget used in [SuggestedGroupsSection]
///
/// It takes in required [groupIconUrl], [groupTitle] and [groupTotalMembers] parameters

class SuggestedGroupCard extends StatelessWidget {
  const SuggestedGroupCard({
    super.key,
    required this.group,
    required this.route,
  });

  final Group group;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          smallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: group.avatar != null &&
                    group.avatar!.isNotEmpty &&
                    group.avatar != UNKNOWN
                ? ClipOval(
                    child: Image.network(
                      group.avatar!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  )
                : DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text(
                          group.name != null &&
                                  group.name!.isNotEmpty &&
                                  group.name != UNKNOWN
                              ? group.name![0]
                              : 'U',
                          style: boldSize16Text(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          verySmallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              group.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          verySmallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '${group.memberCount} members',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.greyTextColor,
              ),
            ),
          ),
          verySmallVerticalSizedBox,
          StoreConnector<AppState, GroupsViewModel>(
            converter: (Store<AppState> store) =>
                GroupsViewModel.fromStore(store),
            builder: (BuildContext context, GroupsViewModel vm) {
              return vm.wait.isWaitingFor(group.id)
                  ? const PlatformLoader()
                  : RawMaterialButton(
                      key: joinSuggestedGroupButtonKey,
                      splashColor: AppColors.secondaryColor.withOpacity(0.2),
                      highlightColor: Colors.transparent,
                      elevation: 0,
                      onPressed: () {
                        final String clientID =
                            StoreProvider.state<AppState>(context)
                                    ?.clientState
                                    ?.id ??
                                '';
                        StoreProvider.dispatch<AppState>(
                          context,
                          AddUserToGroupAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            variables: <String, dynamic>{
                              'memberIDs': <String>[clientID],
                              'communityID': group.id
                            },
                            communityId: group.id ?? '',
                            onError: (String error) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getErrorMessage(addingToGroupString),
                                    ),
                                    duration: const Duration(
                                      seconds: kShortSnackBarDuration,
                                    ),
                                    action: dismissSnackBar(
                                      closeString,
                                      white,
                                      context,
                                    ),
                                  ),
                                );
                              reportErrorToSentry(
                                context,
                                error,
                              );
                            },
                            onSuccess: () =>
                                Navigator.of(context).pushReplacementNamed(
                              route,
                            ),
                          ),
                        );
                      },
                      constraints:
                          const BoxConstraints(minHeight: 25, minWidth: 80),
                      fillColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      child: const Text(
                        joinString,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
