// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/security_questions/questions/responded_security_questions_data.dart';

import '../../../mocks.dart';

void main() {
  group('RespondedSecurityQuestionsData', () {
    test('expects to convert RespondedSecurityQuestionsData from json', () {
      final RespondedSecurityQuestionsData respondedSecurityQuestionsData =
          RespondedSecurityQuestionsData.fromJson(
        mockRespondedSecurityQuestionsData,
      );
      expect(
        respondedSecurityQuestionsData,
        isA<RespondedSecurityQuestionsData>(),
      );
    });
  });
}
