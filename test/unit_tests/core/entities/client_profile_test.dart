// Package imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import '../../../mocks.dart';

void main() {
  test('ClientProfile fromJson', () {
    expect(
      ClientState.fromJson(mockClientProfile),
      isA<ClientState>(),
    );
  });

  test('ClientProfile initial is set', () {
    final ClientState initialClientProfile = ClientState.initial();

    expect(
      initialClientProfile.treatmentEnrollmentDate,
      UNKNOWN,
    );
    expect(
      initialClientProfile.facilityID,
      UNKNOWN,
    );
  });
}
