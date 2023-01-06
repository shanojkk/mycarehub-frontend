// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/add_user_to_group_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/groups/groups_view_model.dart';
import 'package:sghi_core/shared_themes/constants.dart';

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
    required this.index,
  });

  final Group group;
  final String route;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GroupsViewModel>(
      converter: (Store<AppState> store) => GroupsViewModel.fromStore(store),
      builder: (BuildContext context, GroupsViewModel vm) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: AppColors.orangeColor.withOpacity(0.14),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                group.name ?? '',
                style: heavySize16Text(AppColors.orangeColor),
              ),
              smallVerticalSizedBox,
              Text(
                group.description ?? '',
                overflow: TextOverflow.ellipsis,
                style:
                    normalSize14Text(AppColors.secondaryColor.withOpacity(0.6)),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: vm.wait.isWaitingFor(index)
                    ? const PlatformLoader()
                    : SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: MyAfyaHubPrimaryButton(
                          borderColor: Colors.transparent,
                          buttonColor: AppColors.orangeColor.withOpacity(0.3),
                          buttonKey: joinSuggestedGroupButtonKey,
                          onPressed: () {
                            final String clientID =
                                StoreProvider.state<AppState>(context)
                                        ?.clientState
                                        ?.id ??
                                    '';
                            StoreProvider.dispatch<AppState>(
                              context,
                              AddUserToGroupAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
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
                                          AppColors.whiteColor,
                                          context,
                                        ),
                                      ),
                                    );
                                  reportErrorToSentry(
                                    hint: getErrorMessage(addingToGroupString),
                                  );
                                },
                                onSuccess: () =>
                                    Navigator.of(context).pushReplacementNamed(
                                  route,
                                ),
                              ),
                            );
                          },
                          customChild: Text(
                            joinString,
                            style: veryBoldSize15Text(AppColors.orangeColor),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
