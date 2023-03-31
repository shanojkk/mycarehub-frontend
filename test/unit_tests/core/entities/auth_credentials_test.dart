// Package imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import '../../../mock_data.dart';

void main() {
  test('AuthCredentials fromJson', () {
    expect(
      AuthCredentials.fromJson(mockAuthCredentials),
      isA<AuthCredentials>(),
    );
  });

  test('AuthCredentials initial is set', () {
    final AuthCredentials initialAuthCredentials = AuthCredentials.initial();

    expect(initialAuthCredentials.idToken, UNKNOWN);
    expect(initialAuthCredentials.expiresIn, UNKNOWN);
  });
}
