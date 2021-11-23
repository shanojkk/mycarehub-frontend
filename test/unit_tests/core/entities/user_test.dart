// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/user.dart';
import '../../../mocks.dart';

void main() {
  test('User fromJson', () {
    expect(User.fromJson(mockUser), isA<User>());
    expect(User.fromJson(mockUser).gender, Gender.male);
  });

  test('User initial is set', () {
    final User initialUser = User.initial();

    expect(
      initialUser.secondaryContacts!.length,
      0,
    );
  });
}
