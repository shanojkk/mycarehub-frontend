// Package imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';

import '../../../mock_data.dart';

void main() {
  test('ClientState fromJson', () {
    expect(
      ClientState.fromJson(mockClientState),
      isA<ClientState>(),
    );
  });

  test('ClientState initial is set', () {
    final ClientState initialClientState = ClientState.initial();

    expect(
      initialClientState.clientProfile?.treatmentEnrollmentDate,
      UNKNOWN,
    );
    expect(
      initialClientState.facilityID,
      UNKNOWN,
    );
  });
}
