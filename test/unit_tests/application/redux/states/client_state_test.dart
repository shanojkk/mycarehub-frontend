// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';

void main() {
  group('ClientState', () {
    test('should convert to and from JSON', () {
      final ClientState clientState = ClientState.initial();

      final Map<String, dynamic> clientStateJson = clientState.toJson();

      expect(clientStateJson.containsKey('clientProfile'), true);

      final Map<String, dynamic> clientStateMap = <String, dynamic>{
        'user': <String, dynamic>{'userId': 'some-user-id'},
        'clientProfile': <String, dynamic>{'ClientCounselled': true},
      };

      expect(
        ClientState.fromJson(clientStateMap).clientProfile!.counselled,
        isNotNull,
      );

      expect(
        ClientState.fromJson(clientStateMap).clientProfile!.counselled,
        true,
      );
    });
  });
}
