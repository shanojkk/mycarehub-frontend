import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/contact_type.dart';
import 'package:myafyahub/domain/core/entities/core/credentials.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/login/login_data.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_data.dart';

import '../../../../mocks.dart';

void main() {
  group('PhoneLoginData', () {
    test('should convert fromJson to class', () {
      final Map<String, dynamic> data =
          mockLoginResponse['data'] as Map<String, dynamic>;

      final PhoneLoginData loginDataFromJson = PhoneLoginData.fromJson(data);

      final PhoneLoginData phoneLoginData = PhoneLoginData(
        loginData: LoginData(
          credentials: Credentials(
            clientProfile: ClientProfile(
              user: User(
                userId: 'some-user-id',
                displayName: 'Kowalski',
                username: 'Kowalski',
                firstName: 'Juha',
                lastName: 'Kalulu',
                contacts: <Contact>[
                  Contact(
                    active: true,
                    contact: PhoneNumber.withValue('+254717356476'),
                    contactType: ContactType.PRIMARY,
                    optedIn: true,
                  ),
                  Contact(
                    active: true,
                    contact: PhoneNumber.withValue('+254712345678'),
                    contactType: ContactType.SECONDARY,
                    optedIn: true,
                  ),
                ],
                termsAccepted: true,
              ),
              active: true,
            ),
            authCredentials: AuthCredentials(
              expiresIn: '3600',
              idToken: 'some id token',
              refreshToken: 'some refresh token',
            ),
            pinChangeRequired: true,
          ),
        ),
      );

      expect(phoneLoginData, loginDataFromJson);
    });
  });
}
