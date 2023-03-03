import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class EventTypes {
  static const String name = 'm.room.name';
  static const String alias = 'm.room.canonical_alias';
  static const String topic = 'm.room.topic';
  static const String avatar = 'm.room.avatar';
  static const String creation = 'm.room.create';
  static const String message = 'm.room.message';
  static const String encrypted = 'm.room.encrypted';
  static const String member = 'm.room.member';
  static const String redaction = 'm.room.redaction';
  static const String reaction = 'm.reaction';

  static const String callInvite = 'm.call.invite';
  static const String callCandidates = 'm.call.candidates';
  static const String callHangup = 'm.call.hangup';

  static const String guestAccess = 'm.room.guest_access';
  static const String joinRules = 'm.room.join_rules';
  static const String historyVisibility = 'm.room.history_visibility';
  static const String powerLevels = 'm.room.power_levels';
  static const String encryption = 'm.room.encryption';
  static const String roomKey = 'm.room_key';
  static const String roomKeyRequest = 'm.room_key_request';

  // Default
  static const String unknown = UNKNOWN;
}
