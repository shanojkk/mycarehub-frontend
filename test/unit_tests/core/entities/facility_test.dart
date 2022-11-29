import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';

void main() {
  test('initial facility object is correctly created', () {
    final Facility facility = Facility.initial();
    expect(facility.id, UNKNOWN);
    expect(facility.name, UNKNOWN);
    expect(facility.code, 0);
  });
}
