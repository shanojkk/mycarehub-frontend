import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/processed_response.dart';
import 'package:sghi_core/afya_moja_core/src/helpers.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class DeleteMessageAction extends ReduxAction<AppState> {
  DeleteMessageAction({
    required this.roomID,
    required this.eventID,
    required this.senderID,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  final String roomID;
  final String eventID;
  final String senderID;
  final Function(String eventID)? onSuccess;
  final Function(String errorMsg)? onError;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(deleteMessageFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(deleteMessageFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.chatState?.userProfile?.userID ?? '';

    final bool canDelete = await canDeleteMessage(
      roomID: roomID,
      userID: userID,
      senderID: senderID,
      client: client,
    );

    if (canDelete) {
      final Response response = await ChatAPI.deleteMessage(
        client: client,
        roomID: roomID,
        senderID: senderID,
        eventID: eventID,
        userID: userID,
      );

      final ProcessedResponse processedResponse = processHttpResponse(response);

      if (processedResponse.ok) {
        final Response resp = processedResponse.response;

        final Map<String, dynamic> body =
            json.decode(resp.body) as Map<String, dynamic>;

        if (body.containsKey('event_id')) {
          // Remove the event from state
          final Map<String, Room>? joinedRooms =
              state.chatState?.syncResponse?.rooms?.joinedRooms;
          final List<Message?>? events = joinedRooms![roomID]?.timeline?.events;

          events?.removeWhere((Message? m) => m?.eventID == eventID);

          final Room? newRoom =
              joinedRooms[roomID]?.copyWith.timeline?.call(events: events);

          if (newRoom != null) {
            joinedRooms.addAll(<String, Room>{roomID: newRoom});

            final AppState? newState = state
                .copyWith.chatState?.syncResponse?.rooms
                ?.call(joinedRooms: joinedRooms);

            onSuccess?.call(body['event_id']?.toString() ?? '');

            return newState;
          }

          return null;
        }
      } else {
        if (processedResponse.response.statusCode == 403) {
          onError?.call(
            'Sorry, you do not have permissions to delete this message',
          );
          return null;
        }

        onError?.call(
          'Sorry, an error occurred while deleting the message',
        );
        return null;
      }
    }
    return null;
  }
}
