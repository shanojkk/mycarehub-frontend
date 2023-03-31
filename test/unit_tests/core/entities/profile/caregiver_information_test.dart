import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';

import '../../../../mock_data.dart';

void main() {
  test('CaregiverInformation serialization', () {
    expect(
      CaregiverInformation.fromJson(mockUpdateClientCareGiver),
      isA<CaregiverInformation>(),
    );

    final CaregiverInformation mockInstance = CaregiverInformation(
      firstName: 'John',
      lastName: 'Doe',
      phoneNumber: '+254798000000',
      caregiverType: CaregiverType.SIBLING,
      clientID: UNKNOWN,
    );

    expect(
      mockInstance.toJson(),
      mockUpdateClientCareGiver,
    );
  });
}
