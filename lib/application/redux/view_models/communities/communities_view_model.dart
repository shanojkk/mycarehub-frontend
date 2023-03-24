import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class RoomListViewModel extends Vm {
  RoomListViewModel({
    required this.rooms,
    required this.syncing,
    required this.displayName,
  }) : super(
          equals: <Object?>[
            syncing,
            displayName,
            rooms,
          ],
        );

  factory RoomListViewModel.fromStore(Store<AppState> store) {
    final List<Room?> allRooms = <Room?>[
      ...?store.state.chatState?.syncResponse?.rooms?.invitedRooms?.values
          .toList(),
      ...?store.state.chatState?.syncResponse?.rooms?.joinedRooms?.values
          .toList(),
    ];

    return RoomListViewModel(
      syncing: store.state.wait?.isWaitingFor(syncingEventsFlag) ?? false,
      displayName: store.state.chatState?.userProfile?.userID,
      rooms: allRooms,
    );
  }

  final bool syncing;
  final String? displayName;
  final List<Room?>? rooms;
}

class RoomInfoViewModel extends Vm {
  RoomInfoViewModel({
    required this.groupInfoMembers,
    required this.fetchingMembers,
    required this.authUserID,
    required this.leavingRoom,
    required this.promotingToMod,
    required this.joiningRoom,
  }) : super(
          equals: <Object?>[
            groupInfoMembers,
            authUserID,
            leavingRoom,
            fetchingMembers,
            promotingToMod,
            joiningRoom,
          ],
        );

  factory RoomInfoViewModel.fromStore(Store<AppState> store) {
    final AppState state = store.state;
    return RoomInfoViewModel(
      fetchingMembers:
          store.state.wait?.isWaitingFor(fetchRoomMembersFlag) ?? false,
      leavingRoom: store.state.wait?.isWaitingFor(leaveRoomFlag) ?? false,
      promotingToMod: store.state.wait?.isWaitingFor(promoteToModFlag) ?? false,
      joiningRoom: store.state.wait?.isWaitingFor(joinRoomFlag) ?? false,
      groupInfoMembers: state.chatState?.groupInfoMembers,
      authUserID: state.chatState?.userProfile?.userID ?? UNKNOWN,
    );
  }

  final List<RoomUser>? groupInfoMembers;

  /// User ID of the currently signed in user
  final String authUserID;

  final bool fetchingMembers;

  final bool leavingRoom;

  final bool promotingToMod;

  final bool joiningRoom;
}

class SearchPageViewModel extends Vm {
  SearchPageViewModel({
    required this.searchMemberResults,
    required this.authUserID,
    this.wait,
  }) : super(equals: <Object?>[searchMemberResults, wait, authUserID]);

  factory SearchPageViewModel.fromStore(Store<AppState> store) {
    return SearchPageViewModel(
      wait: store.state.wait,
      searchMemberResults: store.state.chatState?.searchMemberResults,
      authUserID: store.state.chatState?.userProfile?.userID ?? UNKNOWN,
    );
  }

  final List<User>? searchMemberResults;
  final String authUserID;
  final Wait? wait;
}

class RoomPageViewModel extends Vm {
  RoomPageViewModel({required this.selectedRoom})
      : super(equals: <Object?>[selectedRoom]);

  factory RoomPageViewModel.fromStore(Store<AppState> store) {
    final String? selectedRoomID = store.state.chatState?.selectedRoom;

    final List<Room?> allRooms = <Room?>[
      ...?store.state.chatState?.syncResponse?.rooms?.invitedRooms?.values
          .toList(),
      ...?store.state.chatState?.syncResponse?.rooms?.joinedRooms?.values
          .toList(),
    ];

    final Room? selected = allRooms.firstWhere(
      (Room? r) => r?.roomID == selectedRoomID,
    );

    return RoomPageViewModel(selectedRoom: selected);
  }

  final Room? selectedRoom;
}

class MessageOptionsViewModel extends Vm {
  MessageOptionsViewModel({required this.isDeletingMessage})
      : super(equals: <Object?>[isDeletingMessage]);

  factory MessageOptionsViewModel.fromStore(Store<AppState> store) {
    return MessageOptionsViewModel(
      isDeletingMessage:
          store.state.wait?.isWaitingFor(deleteMessageFlag) ?? false,
    );
  }

  final bool isDeletingMessage;
}

class ImageUploadViewModel extends Vm {
  ImageUploadViewModel({required this.uploadingImage})
      : super(equals: <Object?>[uploadingImage]);

  factory ImageUploadViewModel.fromStore(Store<AppState> store) {
    return ImageUploadViewModel(
      uploadingImage: store.state.wait?.isWaitingFor(uploadMediaFlag) ?? false,
    );
  }

  final bool uploadingImage;
}

class MessageInputViewModel extends Vm {
  MessageInputViewModel({required this.isSending})
      : super(equals: <Object?>[isSending]);

  factory MessageInputViewModel.fromStore(Store<AppState> store) {
    return MessageInputViewModel(
      isSending: store.state.wait?.isWaitingFor(sendMessageFlag) ?? false,
    );
  }

  final bool isSending;
}
