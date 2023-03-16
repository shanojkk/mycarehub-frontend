import 'package:pro_health_360/domain/core/entities/core/screening_tool_answers_list.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ScreeningToolAnswerList values', () {
    final Map<String, dynamic> answerJson = <String, dynamic>{
      'questionResponses': <dynamic>[
        <String, dynamic>{'questionID': UNKNOWN, 'response': UNKNOWN}
      ]
    };
    expect(
      ScreeningToolAnswersList.fromJson(answerJson)
          .answersList
          ?.first
          ?.questionId,
      UNKNOWN,
    );
  });
}
