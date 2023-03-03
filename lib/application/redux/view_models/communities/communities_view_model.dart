import 'package:async_redux/async_redux.dart';
import 'package:flutter/services.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class RoomListViewModel extends Vm {
  RoomListViewModel({
    required this.joinedRooms,
    this.wait,
    this.displayName,
    this.invitedRooms,
  }) : super(
          equals: <Object?>[
            joinedRooms,
            wait,
            displayName,
            invitedRooms,
            joinedRooms,
          ],
        );

  factory RoomListViewModel.fromStore(Store<AppState> store) {
    return RoomListViewModel(
      wait: store.state.wait,
      displayName: store.state.chatState?.userProfile?.userID,
      joinedRooms: store.state.chatState?.syncResponse?.rooms?.joinedRooms,
      invitedRooms: store.state.chatState?.syncResponse?.rooms?.invitedRooms,
    );
  }

  final Map<String, Room>? invitedRooms;
  final Map<String, Room>? joinedRooms;

  final Wait? wait;
  final String? displayName;
}

class RoomInfoViewModel extends Vm {
  RoomInfoViewModel({
    required this.groupInfoMembers,
    this.wait,
    required this.authUserID,
  }) : super(equals: <Object?>[groupInfoMembers, wait, authUserID]);

  factory RoomInfoViewModel.fromStore(Store<AppState> store) {
    final AppState state = store.state;
    return RoomInfoViewModel(
      wait: state.wait,
      groupInfoMembers: state.chatState?.groupInfoMembers,
      authUserID: state.chatState?.userProfile?.userID ?? UNKNOWN,
    );
  }

  final List<RoomUser>? groupInfoMembers;

  /// User ID of the currently signed in user
  final String authUserID;
  final Wait? wait;
}

class SearchPageViewModel extends Vm {
  SearchPageViewModel({required this.searchMemberResults, this.wait})
      : super(equals: <Object?>[searchMemberResults, wait]);

  factory SearchPageViewModel.fromStore(Store<AppState> store) {
    return SearchPageViewModel(
      wait: store.state.wait,
      searchMemberResults: store.state.chatState?.searchMemberResults,
    );
  }

  final List<User>? searchMemberResults;
  final Wait? wait;
}

class RoomPageViewModel extends Vm {
  RoomPageViewModel({
    required this.joinedRooms,
    required this.invitedRooms,
    this.wait,
  }) : super(equals: <Object?>[invitedRooms, joinedRooms, wait]);

  factory RoomPageViewModel.fromStore(Store<AppState> store) {
    return RoomPageViewModel(
      wait: store.state.wait,
      invitedRooms: store.state.chatState?.syncResponse?.rooms?.invitedRooms,
      joinedRooms: store.state.chatState?.syncResponse?.rooms?.joinedRooms,
    );
  }

  final Wait? wait;

  final Map<String, Room>? invitedRooms;
  final Map<String, Room>? joinedRooms;
}

class MediaItemViewModel extends Vm {
  MediaItemViewModel({required this.images, this.wait})
      : super(equals: <Object?>[images, wait]);

  factory MediaItemViewModel.fromStore(Store<AppState> store) {
    return MediaItemViewModel(
      wait: store.state.wait,
      images: store.state.chatState?.images,
    );
  }
  final List<Map<String, Uint8List?>?>? images;
  final Wait? wait;
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

class CreateRoomViewModel extends Vm {
  CreateRoomViewModel({required this.isCreatingRoom})
      : super(equals: <Object?>[isCreatingRoom]);

  factory CreateRoomViewModel.fromStore(Store<AppState> store) {
    return CreateRoomViewModel(
      isCreatingRoom: store.state.wait?.isWaitingFor(createRoomFlag) ?? false,
    );
  }

  final bool isCreatingRoom;
}
