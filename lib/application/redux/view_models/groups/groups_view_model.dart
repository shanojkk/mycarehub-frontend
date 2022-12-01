import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';

class GroupsViewModel extends Vm {
  final Wait wait;
  final List<Group?>? recommendedGroups;
  final List<GroupMember?>? groupMembers;
  final List<Role>? clientRoles;
  final bool? isModerator;
  final bool? isOwner;
  final String? clientId;
  final List<Community?>? communities;

  GroupsViewModel({
    required this.wait,
    this.recommendedGroups,
    this.groupMembers,
    this.clientRoles,
    this.isModerator,
    this.isOwner,
    this.clientId,
    this.communities,
  }) : super(
          equals: <Object?>[
            wait,
            recommendedGroups,
            groupMembers,
            clientRoles,
            isModerator,
            isOwner,
            clientId,
            communities,
          ],
        );

  factory GroupsViewModel.fromStore(Store<AppState> store) {
    return GroupsViewModel(
      wait: store.state.wait!,
      recommendedGroups: store.state.miscState?.groupState?.recommendedGroups,
      groupMembers: store.state.miscState?.groupState?.groupMembers,
      clientRoles: store.state.clientState?.user?.roles,
      isModerator: store.state.miscState?.groupState?.isModerator,
      clientId: store.state.clientState?.id,
      communities: store.state.miscState?.groupState?.communities,
    );
  }
}
