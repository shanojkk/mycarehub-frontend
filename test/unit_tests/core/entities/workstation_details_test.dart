import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/workstation_details.dart';

void main() {
  test('initial workstation details', () {
    final WorkStationDetails workStationDetails = WorkStationDetails.initial();
    expect(workStationDetails.messages, 0);
    expect(workStationDetails.notifications, 0);
    expect(workStationDetails.surveys, 0);
  });
}
