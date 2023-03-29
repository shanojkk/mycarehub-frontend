import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/event_types.dart';
import 'package:sghi_core/communities/client/utils.dart';
import 'package:sghi_core/communities/core/enums.dart';
import 'package:sghi_core/communities/core/utils.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';

import '../../../mock_data.dart';
import '../../../mocks.dart';

void main() {
  group('Utils', () {
    test('should return a valid fibonacci sequence', () {
      expect(fibonacci(0), <int>[0]);

      expect(fibonacci(1), <int>[0, 1]);

      expect(fibonacci(2), <int>[0, 1, 1]);

      expect(fibonacci(3), <int>[0, 1, 1, 2]);
    });

    test('Uint8ListConverter should convert to/from JSON', () {
      final Uint8List? uint =
          const Uint8ListConverter().fromJson(<int>[1, 2, 3]);
      expect(uint?.length, 3);

      final List<int>? uintJson = const Uint8ListConverter().toJson(uint);
      expect(uintJson?.length, 3);
    });

    test('should return the correct name initials', () {
      expect(getInitials('Abiud Orina'), 'AO');
      expect(getInitials('Abiud Kowalski Orina'), 'AK');
    });

    test('should format username', () {
      expect(getInitials('Abiud Orina'), 'AO');
      expect(getInitials('Abiud Kowalski Orina'), 'AK');
      expect(getInitials('Abiud'), 'A');
      expect(getInitials(''), '');
    });

    test('should fetch room power levels', () async {
      final Map<String, dynamic> powerLevels =
          await fetchRoomPowerLevels('test-room', MockGraphQlClient());

      expect(powerLevels, isA<Map<String, dynamic>>());
      expect(powerLevels.containsKey('users'), true);

      expect(powerLevels['users'], isA<Map<String, dynamic>>());
    });

    test('should allow deletion of self-sent messages', () async {
      final bool canDelete = await canDeleteMessage(
        roomID: '!testRoom:chat.savannahghi.org',
        userID: '@abiudrn:chat.savannahghi.org',
        senderID: '@abiudrn:chat.savannahghi.org',
        client: MockGraphQlClient(),
      );

      expect(canDelete, true);
    });

    test('should not allow deletion of messages', () async {
      final bool canDelete = await canDeleteMessage(
        roomID: '!testRoom:chat.savannahghi.org',
        userID: '@kowalski:chat.savannahghi.org',
        senderID: '@abiudrn:chat.savannahghi.org',
        client: MockGraphQlClient(),
      );

      expect(canDelete, false);
    });

    test('should process membership types correctly', () async {
      expect(
        processMembership(MembershipEventTypes.invite, 'myCareHub', 'Abiud'),
        'Abiud invited myCareHub',
      );

      expect(
        processMembership(MembershipEventTypes.join, 'myCareHub', 'Abiud'),
        'myCareHub joined',
      );

      expect(
        processMembership(MembershipEventTypes.leave, 'myCareHub', 'Abiud'),
        'myCareHub left',
      );

      expect(
        processMembership(MembershipEventTypes.ban, 'myCareHub', 'Abiud'),
        'myCareHub was banned',
      );

      expect(
        processMembership(MembershipEventTypes.knock, 'myCareHub', 'Abiud'),
        'myCareHub requested to join',
      );

      expect(
        processMembership(MembershipEventTypes.unknown, 'myCareHub', 'Abiud'),
        '',
      );
    });

    test('should update room data', () async {
      final Map<String, Room>? updatedRoomData = updateRoomData(
        fromServer: <String, Room>{
          '!testRoom:chat.savannahghi.org': Room.fromJson(roomMock)
        },
        fromState: <String, Room>{
          '!testRoom:chat.savannahghi.org':
              Room.fromJson(roomMock).copyWith.call(
                    timeline: RoomTimeline.initial(),
                    state: RoomState.initial(),
                  )
        },
      );

      expect(updatedRoomData?.values.first.timeline?.events?.isEmpty, false);
      expect(updatedRoomData?.values.first.state?.events?.isEmpty, false);

      expect(updatedRoomData?.values.first.timeline?.events?.length, 1);
      expect(updatedRoomData?.values.first.state?.events?.length, 1);

      expect(
        updatedRoomData?.values.first.timeline?.events?.first?.eventType,
        EventTypes.message,
      );
      expect(
        updatedRoomData?.values.first.state?.events?.first?.eventType,
        EventTypes.name,
      );

      expect(
        updatedRoomData?.values.first.timeline?.events?.first?.sender,
        '@test:chat.savannahghi.org',
      );

      expect(
        updatedRoomData?.values.first.state?.events?.first?.sender,
        '@test:chat.savannahghi.org',
      );
    });

    test('should parse sync data for a joined room', () async {
      final Map<String, Room>? syncedRoomsData = enrichRooms(
        SyncResponse.fromJson(syncResponseMock).rooms?.joinedRooms,
      );

      expect(
        syncedRoomsData?.containsKey('!testRoom:chat.savannahghi.org'),
        true,
      );

      expect(
        syncedRoomsData?['!testRoom:chat.savannahghi.org']?.name,
        'The Grand Gaming Squad',
      );

      expect(
        syncedRoomsData?['!testRoom:chat.savannahghi.org']
            ?.timeline
            ?.events
            ?.isEmpty,
        false,
      );
      expect(
        syncedRoomsData?['!testRoom:chat.savannahghi.org']
            ?.state
            ?.events
            ?.isEmpty,
        false,
      );
    });

    test('should parse sync data for an invited room', () async {
      final Map<String, Room>? syncedRoomsData = enrichRooms(
        SyncResponse.fromJson(syncResponseMock).rooms?.joinedRooms,
        invite: true,
      );

      expect(
        syncedRoomsData?.containsKey('!testRoom:chat.savannahghi.org'),
        true,
      );

      expect(
        syncedRoomsData?['!testRoom:chat.savannahghi.org']?.invite,
        true,
      );
    });

    test('should parse the room name from the timeline', () async {
      final Map<String, Room>? syncedRoomsData = enrichRooms(
        SyncResponse.fromJson(syncResponseMock).rooms?.copyWith.call(
          joinedRooms: <String, Room>{
            '!testRoom:chat.savannahghi.org': Room.initial().copyWith.call(
                  timeline: RoomTimeline.initial().copyWith.call(
                    events: <Message>[
                      Message.initial()
                          .copyWith
                          .call(eventType: EventTypes.name)
                    ],
                  ),
                )
          },
        ).joinedRooms,
      );

      expect(
        syncedRoomsData?.containsKey('!testRoom:chat.savannahghi.org'),
        true,
      );

      expect(
        syncedRoomsData?['!testRoom:chat.savannahghi.org']?.invite,
        false,
      );
    });

    test('should parse the room name from the state', () async {
      final Map<String, Room>? syncedRoomsData = enrichRooms(
        SyncResponse.fromJson(syncResponseMock).rooms?.copyWith.call(
          joinedRooms: <String, Room>{
            '!testRoom:chat.savannahghi.org': Room.initial().copyWith.call(
                  state: RoomState.initial().copyWith.call(
                    events: <Message>[
                      Message.initial()
                          .copyWith
                          .call(eventType: EventTypes.avatar)
                    ],
                  ),
                )
          },
        ).joinedRooms,
      );

      expect(
        syncedRoomsData?.containsKey('!testRoom:chat.savannahghi.org'),
        true,
      );

      expect(
        syncedRoomsData?['!testRoom:chat.savannahghi.org']?.invite,
        false,
      );
    });
  });
}
