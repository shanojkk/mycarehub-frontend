import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class UpdateChatStateAction extends ReduxAction<AppState> {
  UpdateChatStateAction({
    this.userProfile,
    this.joinedRooms,
    this.groupInfoMembers,
    this.searchMemberResults,
    this.messages,
    this.syncResponse,
  });

  final User? userProfile;
  final List<Room>? joinedRooms;
  final List<RoomUser>? groupInfoMembers;
  final List<User>? searchMemberResults;
  final List<Message>? messages;
  final SyncResponse? syncResponse;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.chatState?.call(
      userProfile: userProfile ?? state.chatState?.userProfile,
      groupInfoMembers: groupInfoMembers ?? state.chatState?.groupInfoMembers,
      searchMemberResults:
          searchMemberResults ?? state.chatState?.searchMemberResults,
      messages: messages ?? state.chatState?.messages,
      syncResponse: syncResponse ?? state.chatState?.syncResponse,
    );

    return newState;
  }
}
