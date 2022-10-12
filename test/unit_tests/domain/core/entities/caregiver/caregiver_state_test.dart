// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/caregiver/caregiver_state.dart';

void main() {
  group('CaregiverState', () {
    test('fromJson works correctly', () {
      final CaregiverState fromJson =
          CaregiverState.fromJson(<String, dynamic>{
        'id': 'test',
        'caregiver_number': 'test',
      });

      final CaregiverState actual = CaregiverState(
        caregiverNumber: 'test',
        id: 'test',
      );

      expect(fromJson, actual);
    });
  });
}
