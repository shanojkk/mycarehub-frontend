import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pro_health_360/domain/core/entities/communities/event_types.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/communities/core/endpoints.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/core/utils.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/strings.dart';
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

  final Map<String, dynamic>? powerLevelUser =
      powerLevels['users'] as Map<String, dynamic>?;

  final int? userLevel = powerLevelUser?[userID] as int?;

  if (senderID == userID || (userLevel != null && userLevel > 50)) {
    return true;
  }

  if (userLevel == null || senderID != userID) {
    return false;
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

Future<Map<String, dynamic>> synchronizeEvents(SyncParams syncParams) async {
  final bool fullSync = syncParams.fullSync ?? false;

  String endpoint = syncEndpoint;

// Add url params
  endpoint += '?full_state=${syncParams.fullState}';
  endpoint += (syncParams.since != null && syncParams.since != UNKNOWN)
      ? '&since=${syncParams.since}'
      : '';
  endpoint += '&timeout=${syncParams.timeout}';
  endpoint += fullSync
      ? '&filter={"room":{"state": {"lazy_load_members":true, "types":["*"]}, '
          '"timeline":{"lazy_load_members":true}}}'
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

  return processedData;
}

/// Processes the initial room data after the sync API is called the first time
///
/// Used for processing totally new events from the server
///
/// Adds things like the group name and invite status
Map<String, Room>? enrichRooms(
  Map<String, Room>? roomsData, {
  bool invite = false,
}) {
  if (roomsData?.isNotEmpty ?? false) {
    final Map<String, Room> parsedRooms = <String, Room>{
      for (final String id in roomsData!.keys)
        if (roomsData[id] != null)
          id: enrichRoom(roomsData[id]!, id, invite: invite),
    };

    return parsedRooms;
  }
  return null;
}

/// Enriches a single room object with the group name, avatar URL, and invite status
Room enrichRoom(Room room, String roomID, {bool invite = false}) {
  final List<Message?>? stateEvents =
      invite ? room.inviteState?.events : room.state?.events;

  Message? nameEvent;

  final Message? stateNameEvent = stateEvents?.firstWhere(
    (Message? m) => m?.eventType == EventTypes.name,
    orElse: () => Message.initial(),
  );

  final Message? avatar = stateEvents?.firstWhere(
    (Message? m) => m?.eventType == EventTypes.avatar,
    orElse: () => Message.initial(),
  );

  if (stateNameEvent == Message.initial()) {
    // Attempt to find the group name in the state events
    final Message? timelineNameEvent = room.timeline?.events?.firstWhere(
      (Message? m) => m?.eventType == EventTypes.name,
      orElse: () => Message.initial(),
    );

    nameEvent = timelineNameEvent;
  } else {
    nameEvent = stateNameEvent;
  }

  return room.copyWith(
    name: nameEvent?.content?.name,
    roomID: roomID,
    invite: invite,
    avatarUri: avatar?.content?.url ?? UNKNOWN,
  );
}

/// Loops through the new events from Matrix and runs updates on the old events
///
/// Used for subsequent room updates after the initial sync
Map<String, Room>? updateRoomData({
  // From server
  required Map<String, Room>? fromServer,

  // From state
  required Map<String, Room>? fromState,
  bool invite = false,
}) {
  if (fromServer != null) {
    /// For each of the new room updates
    final Map<String, Room> updatedRooms = fromServer.map(
      (String key, Room newRoom) {
        /// Find the old room
        if (fromState?.containsKey(key) ?? false) {
          final Room? oldRoom = fromState![key];

          /// Parse the room updates
          final Room parsedRoom = processRoomUpdates(newRoom, oldRoom!);

          return MapEntry<String, Room>(key, parsedRoom);
        } else {
          return MapEntry<String, Room>(key, enrichRoom(newRoom, key));
        }
      },
    );

    return updatedRooms;
  }

  return fromState;
}

/// Combines old and new events (both state and timeline),
/// and removes duplicates
///
/// Used in [updateRoomData] above
Room processRoomUpdates(Room serverRoom, Room stateRoom) {
  // Extract state and timeline events, and combine them
  final List<Message?> allStateEvents = <Message?>[
    ...?serverRoom.state?.events,
    ...?stateRoom.state?.events
  ];

  // Extract state and timeline events and combine them
  final List<Message?> allTimelineEvents = <Message?>[
    ...?serverRoom.timeline?.events,
    ...?stateRoom.timeline?.events
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

  final Room processedRoom = stateRoom.copyWith.call(
    timeline: stateRoom.timeline?.copyWith.call(events: allTimelineEvents),
    state: stateRoom.state?.copyWith.call(events: allStateEvents),
    name: (serverRoom.name?.isNotEmpty ?? false)
        ? serverRoom.name
        : stateRoom.name,
    topic: (serverRoom.topic?.isNotEmpty ?? false)
        ? serverRoom.topic
        : stateRoom.topic,
    ephemeral: (serverRoom.ephemeral != null)
        ? serverRoom.ephemeral
        : stateRoom.ephemeral,
    unreadNotifications: (serverRoom.unreadNotifications != null)
        ? serverRoom.unreadNotifications
        : stateRoom.unreadNotifications,
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
    (name?.split(':').first ?? noNameText).split(':').first;

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
