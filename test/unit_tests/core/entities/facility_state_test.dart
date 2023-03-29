import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/facility_state.dart';
import '../../../mock_data.dart';

void main() {
  test('FacilityState fromJson', () {
    expect(FacilityState.fromJson(mockFacilityState), isA<FacilityState>());
  });
}
