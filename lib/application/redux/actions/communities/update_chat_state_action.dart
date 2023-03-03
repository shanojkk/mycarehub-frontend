import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
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
    this.image,
    this.syncResponse,
  });

  final User? userProfile;
  final List<Room>? joinedRooms;
  final List<RoomUser>? groupInfoMembers;
  final List<User>? searchMemberResults;
  final List<Message>? messages;
  final Map<String, Uint8List?>? image;
  final SyncResponse? syncResponse;

  @override
  AppState? reduce() {
    final List<Map<String, Uint8List?>?>? currentImages =
        state.chatState?.images;

    if (image?.isNotEmpty ?? false) {
      // Check if the image already exists and replace
      final bool? isImagePresent = currentImages?.where(
        (Map<String, Uint8List?>? element) {
          return element?.containsKey(image?.keys.first) ?? false;
        },
      ).isNotEmpty;

      if (isImagePresent ?? false) {
        currentImages?.removeWhere(
          (Map<String, Uint8List?>? element) =>
              element?.containsKey(image?.keys.first) ?? false,
        );
        currentImages?.add(image);
      } else {
        currentImages?.add(image);
      }
    }

    final AppState? newState = state.copyWith.chatState?.call(
      userProfile: userProfile ?? state.chatState?.userProfile,
      groupInfoMembers: groupInfoMembers ?? state.chatState?.groupInfoMembers,
      searchMemberResults:
          searchMemberResults ?? state.chatState?.searchMemberResults,
      messages: messages ?? state.chatState?.messages,
      images: currentImages,
      syncResponse: syncResponse ?? state.chatState?.syncResponse,
    );

    return newState;
  }
}
