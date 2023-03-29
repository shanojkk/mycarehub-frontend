// Package imports:

import 'package:pro_health_360/domain/core/entities/core/user_profile.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:

import '../../../mock_data.dart';

void main() {
  test('UserProfile fromJson', () {
    expect(
      UserProfile.fromJson(mockUserProfile),
      isA<UserProfile>(),
    );
  });

  test('UserProfile toJson', () {
    final UserProfile userProfile = UserProfile(
      name: UNKNOWN,
      active: false,
      termsAccepted: false,
      pinChangeRequired: false,
      pinUpdateRequired: false,
      hasSetNickname: false,
      hasSetPin: false,
      hasSetSecurityQuestions: false,
      isPhoneVerified: false,
      suspended: false,
    );

    expect(
      userProfile.toJson(),
      isA<Map<String, dynamic>>(),
    );
  });

  test('User initial is set', () {
    final UserProfile initialUserProfile = UserProfile.initial();

    expect(initialUserProfile.name, UNKNOWN);
  });
}
