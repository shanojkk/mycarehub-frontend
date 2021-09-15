import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';

import '../../../test_utils.dart';

void main() {
  group('test queries.dart', () {
    const String status = 'ACTIVE';

    test('should verify sendOTPVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedPhoneNumber = <String, dynamic>{
        'msisdn': '0710000000'
      };

      // call the actual function / method
      final Map<String, dynamic> actualSendOTPVariableMap =
          sendOTPVariables(testPhoneNumber);

      // verify functionality
      expect(actualSendOTPVariableMap, expectedPhoneNumber);
    });
    test('should verify sendEmailOTPVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedEmail = <String, dynamic>{
        'email': testEmail
      };

      // call the actual function / method
      final Map<String, dynamic> actualSendOTPVariableMap =
          sendEmailOTPVariables(testEmail);

      // verify functionality
      expect(actualSendOTPVariableMap, expectedEmail);
    });

    test('should verify getFeedQueryVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedGetFeedQueryVariables =
          <String, dynamic>{
        'isAnonymous': false,
        'status': status,
        'flavour': Flavour.CONSUMER.name,
        'persistent': 'BOTH',
        'visibility': 'SHOW'
      };

      // call the actual function / method
      final Map<String, dynamic> actualGetFeedQueryVariables =
          getFeedQueryVariables(status: status, isAnonymous: false);

      // verify functionality
      expect(actualGetFeedQueryVariables, expectedGetFeedQueryVariables);
    });

    test('should verify resumeWithPinQueryVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedResumeWithPinQueryVariables =
          <String, dynamic>{'pin': '1234'};

      // call the actual function / method
      final Map<String, dynamic> actualResumeWithPinQueryVariables =
          resumeWithPinQueryVariables('1234');

      // verify functionality
      expect(actualResumeWithPinQueryVariables,
          expectedResumeWithPinQueryVariables);
    });
    test('should verify postMessageVariables returns correct map', () {
      // setup
      final Map<String, dynamic> expectedPostMessageVariables =
          <String, dynamic>{
        'flavour': Flavour.CONSUMER.name,
        'itemID': '892vchio7329',
        'message': <String, dynamic>{
          'sequenceNumber': 1,
          'replyTo': '89072479042',
          'postedByName': 'Happy User',
          'postedByUID': '78942hcv87290uv',
          'id': '',
          'text': 'My reply',
          'timestamp': '10:47'
        },
      };

      // call the actual function / method
      final Map<String, dynamic> actualPostMessageVariables =
          postMessageVariables('89072479042', '892vchio7329', 1, 'My reply',
              'Happy User', '78942hcv87290uv', '10:47');

      // verify functionality
      expect(actualPostMessageVariables, expectedPostMessageVariables);
    });
  });
}
