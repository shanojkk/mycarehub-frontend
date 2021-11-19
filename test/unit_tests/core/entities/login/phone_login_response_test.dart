import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';

import '../../../../mocks.dart';

void main() {
  group('PhoneLoginResponse', () {
    test('expects to convert PhoneLoginResponse from json', () {
      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockPhoneLoginResponse);
      expect(phoneLoginResponse, isA<PhoneLoginResponse>());
    });
  });
}
