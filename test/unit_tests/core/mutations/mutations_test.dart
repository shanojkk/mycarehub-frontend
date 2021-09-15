import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test('confirmEmailVariables should return a map', () {
    const String email = 'someone@gmail.com';
    expect(confirmEmailVariables(email), <String, dynamic>{'input': email});
  });

  test('deviceTokenVariables should return a map', () {
    const String token = 'jshdif89-jhe87fd';
    expect(deviceTokenVariables(token), <String, dynamic>{'token': token});
  });

  test('updateBioDataMutationVariables should return a map', () {
    final DateTime dateTime = DateTime.now();
    const String gender = 'Male';
    expect(updateBioDataMutationVariables(dateTime, gender), <String, dynamic>{
      'input': <String, dynamic>{
        'dateOfBirth': DateFormat('yyyy-MM-dd').format(dateTime).toString(),
        'gender': gender.toLowerCase(),
      }
    });
  });
}
