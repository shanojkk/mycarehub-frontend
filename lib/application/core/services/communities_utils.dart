import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/event_types.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/communities/core/endpoints.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/core/utils.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/sync_params.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

Future<bool> canDeleteMessage({
  required String roomID,
  required String userID,
  required String senderID,
  required IGraphQlClient client,
}) async {
  final Map<String, dynamic> powerLevels =
      await fetchRoomPowerLevels(roomID, client);

  final Map<String, dynamic> powerLevelUser =
      powerLevels['users'] as Map<String, dynamic>;

  final int? userLevel = powerLevelUser[userID] as int?;

  if (userLevel == null || senderID != userID) {
    return false;
  }

  if (senderID == userID || userLevel > 50) {
    return true;
  }

  return false;
}

List<int> fibonacci(int n) {
  if (n == 0) {
    return <int>[0];
  }
  if (n == 1) {
    return <int>[0, 1];
  }

  final List<int> series = fibonacci(n - 1);

  series.add(series[series.length - 1] + series[series.length - 2]);

  return series;
}

Future<SyncResponse> synchronizeEvents(SyncParams syncParams) async {
  final bool fullSync = syncParams.fullSync ?? false;

  String endpoint = syncEndpoint;

// Add url params
  endpoint += '?full_state=${syncParams.fullState}';
  endpoint += syncParams.since != null ? '&since=${syncParams.since}' : '';
  endpoint += '&timeout=${syncParams.timeout}';
  endpoint += fullSync
      ? '&filter={"room":{"state": {"lazy_load_members":true},'
          ' "timeline":{"lazy_load_members":true}}}'
      : '';

  final IGraphQlClient processedClient = syncParams.client;

  final Response response = await processedClient.callRESTAPI(
    endpoint: endpoint,
    method: httpGET,
    variables: <String, dynamic>{},
  ).timeout(Duration(seconds: fullSync ? 180 : 60));

  final dynamic data = await json.decode(utf8.decode(response.bodyBytes));

  // Process the events here
  final Map<String, dynamic> processedData = data as Map<String, dynamic>;

  final SyncResponse syncResponse = SyncResponse.fromJson(processedData);

  return syncResponse;
}

/// Processes the initial room data after the sync API is called the first time
///
/// Used for processing totally new events from the server
///
/// Adds things like the group name and invite status
Map<String, Room>? parseSyncRooms(
  Map<String, Room>? roomsData, {
  bool invite = false,
}) {
  if (roomsData?.isNotEmpty ?? false) {
    final Map<String, Room>? parsedRooms =
        roomsData?.map((String id, Room room) {
      final List<Message?>? stateEvents =
          invite ? room.inviteState?.events : room.state?.events;

      Message? nameEvent;

      final Message? stateNameEvent = stateEvents?.firstWhere(
        (Message? m) => m?.eventType == EventTypes.name,
        orElse: () => Message.initial(),
      );

      if (stateNameEvent == Message.initial()) {
        // Attempt to find the group name in the state events
        final List<Message?>? timelineEvents = room.timeline?.events;

        final Message? timelineNameEvent = timelineEvents?.firstWhere(
          (Message? m) => m?.eventType == EventTypes.name,
          orElse: () => Message.initial(),
        );

        nameEvent = timelineNameEvent;
      } else {
        nameEvent = stateNameEvent;
      }

      final Room newRoom = room.copyWith.call(
        name: nameEvent?.content?.name,
        roomID: id,
        invite: invite,
      );

      return MapEntry<String, Room>(id, newRoom);
    });

    return parsedRooms;
  }

  return null;
}

/// Loops through the new events from Matrix and runs updates on the old events
///
/// Used for subsequent room updates after the initial sync
Map<String, Room>? updateRoomData(
  // From server
  Map<String, Room>? fromServer,

  // From state
  Map<String, Room>? fromState, {
  bool invite = false,
}) {
  if (fromServer != null) {
    /// For each of the new room updates
    final Map<String, Room> updatedRooms =
        fromServer.map((String key, Room newRoom) {
      /// Find the old room
      if (fromState?.containsKey(key) ?? false) {
        final Room? oldRoom = fromState![key];

        /// Parse the room updates
        final Room parsedRoom = processRoomEvents(newRoom, oldRoom!);

        return MapEntry<String, Room>(key, parsedRoom);
      }

      /// This is useless for now
      return MapEntry<String, Room>(key, newRoom);
    });

    return updatedRooms;
  }

  return null;
}

/// Combines old and new events (both state and timeline),
/// and removes duplicates
///
/// Used in [updateRoomData] above
Room processRoomEvents(Room newRoom, Room oldRoom) {
  // Extract state and timeline events, and combine them
  final List<Message?> allStateEvents = <Message?>[
    ...?oldRoom.state?.events,
    ...?newRoom.state?.events
  ];

  // Extract state and timeline events and combine them
  final List<Message?> allTimelineEvents = <Message?>[
    ...?oldRoom.timeline?.events,
    ...?newRoom.timeline?.events
  ];

  // Extract state and timeline event IDs. Used to remove duplicate events
  final Set<String?> stateEventIDs =
      allStateEvents.map((Message? e) => e?.eventID).toSet();
  final Set<String?> timelineEventIDs =
      allTimelineEvents.map((Message? e) => e?.eventID).toSet();

  // Remove duplicate state events
  allStateEvents.retainWhere((Message? m) => stateEventIDs.remove(m?.eventID));

  // Remove duplicate timeline events
  allTimelineEvents
      .retainWhere((Message? m) => timelineEventIDs.remove(m?.eventID));

  final Room processedRoom = oldRoom.copyWith.call(
    timeline: oldRoom.timeline?.copyWith.call(events: allTimelineEvents),
    state: oldRoom.state?.copyWith.call(events: allStateEvents),
  );

  return processedRoom;
}

/// Retrieves a string's initials
///
/// Example 'Abiud Orina' returns 'AO'
String getInitials(String string) {
  if (string.isEmpty) return '';
  final String initials =
      string.trim().split(RegExp(' +')).map((String s) => s[0]).join();

  return (initials.length > 2) ? initials.substring(0, 2) : initials;
}

String formatUsername(String? name) =>
    (name?.split(':').first ?? 'No name').split(':').first;

String formatTimestamp(int? timestamp) {
  if (timestamp != null) {
    /// Format timestamp
    final DateTime formattedTimestamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp);
    final String formattedDate =
        DateFormat('d MMM, yy').format(formattedTimestamp);
    final String formattedTime = DateFormat('jm').format(formattedTimestamp);
    return '$formattedDate at $formattedTime';
  }
  return '';
}

String processMembership(
  MembershipEventTypes? type,
  String name,
  String sender,
) {
  final String? membershipAction = type?.name;

  if ((membershipAction?.isNotEmpty ?? false) &&
      type != MembershipEventTypes.unknown) {
    switch (type) {
      case MembershipEventTypes.invite:
        return '$sender $membershipAction $name';
      case MembershipEventTypes.join:
        return '$name $membershipAction';
      case MembershipEventTypes.leave:
        return '$name $membershipAction';
      case MembershipEventTypes.ban:
        return '$name was $membershipAction';
      case MembershipEventTypes.knock:
        return '$name $membershipAction';
      default:
        return '';
    }
  }
  return '';
}

// Sort messages events in the order that they happened
List<Message?>? organizeEventTimeline(List<Message?>? events) {
  final List<Message?>? sortedEvents = events;
  if (sortedEvents != null && sortedEvents.isEmpty) return <Message>[];

  sortedEvents?.sort(
    (Message? a, Message? b) => b?.timeStamp?.compareTo(a?.timeStamp ?? 0) ?? 0,
  );

  return sortedEvents;
}
