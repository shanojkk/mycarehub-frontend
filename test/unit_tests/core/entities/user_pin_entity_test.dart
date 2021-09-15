import 'package:myafyahub/domain/core/entities/login/user_pin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'forgotPIN': false,
    'invalidPin': false,
    'isChangingPin': false,
    'pin': '1234',
    'recoveryOtp': '123456'
  };
  test('UserPin toJson', () {
    expect(
      UserPin(pin: '1234', recoveryOtp: '123456').toJson(),
      data,
    );
  });

  test('UserPin fromJson', () {
    expect(
      UserPin.fromJson(data),
      isA<UserPin>(),
    );
  });
}
