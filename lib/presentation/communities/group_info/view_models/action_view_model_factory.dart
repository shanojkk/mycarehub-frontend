import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:pro_health_360/application/redux/actions/communities/ban_user_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/remove_from_group_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/unban_user_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/communities/group_info/pages/group_member_connector.dart';
import 'package:pro_health_360/presentation/communities/group_info/view_models/moderation_actions_view_model.dart';

class ActionViewModelFactory extends VmFactory<AppState, GroupMemberConnector> {
  final IGraphQlClient client;
  final GroupMemberConnector dumbWidget;

  ActionViewModelFactory({required this.client, required this.dumbWidget});

  @override
  ModerationActionsViewModel fromStore() {
    return ModerationActionsViewModel(
      wait: state.wait!,
      unBan: () => unBanUser(),
      ban: () => banUser(),
      remove: () => remove(),
    );
  }

  void remove() {
    dispatch(
      RemoveFromGroupAction(
        client: client,
        memberID: dumbWidget.memberID,
        communityID: dumbWidget.communityId,
        onFailure: () {
          dumbWidget.onError?.call('${dumbWidget.userName} $unableToRemove');
          dispatch(NavigateAction<AppState>.pop());
        },
        onSuccess: () {
          dumbWidget.onSuccess
              ?.call('${dumbWidget.userName} $removedFromGroup');

          refreshGroupMembers();

          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void banUser() {
    dispatch(
      BanUserAction(
        client: client,
        memberID: dumbWidget.memberID,
        communityID: dumbWidget.communityId,
        onError: () => dumbWidget.onError?.call(getErrorMessage()),
        onSuccess: () {
          dumbWidget.onSuccess?.call(
            userBannedMessage(
              communityName: dumbWidget.communityName,
            ),
          );

          refreshGroupMembers();

          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void unBanUser() {
    dispatch(
      UnBanUserAction(
        client: client,
        memberID: dumbWidget.memberID,
        communityID: dumbWidget.communityId,
        onError: () => dumbWidget.onError?.call(getErrorMessage()),
        onSuccess: () {
          dumbWidget.onSuccess?.call(
            userBannedMessage(
              isBanned: true,
              communityName: dumbWidget.communityName,
            ),
          );

          refreshGroupMembers();

          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void refreshGroupMembers() {
    dispatch(
      FetchGroupMembersAction(
        client: client,
        channelId: dumbWidget.communityId,
        onError: (String? error) {
          dumbWidget.onError
              ?.call(getErrorMessage(groupMembersText.toLowerCase()));
        },
      ),
    );
  }
}
