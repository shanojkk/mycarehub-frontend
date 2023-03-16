import 'package:pro_health_360/domain/core/entities/core/screening_tool_answer.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ScreeningToolAnswer values', () {
    final ScreeningToolAnswer tool = ScreeningToolAnswer.initial();
    expect(tool.response, UNKNOWN);
    expect(tool.questionId, UNKNOWN);

    final Map<String, dynamic> answerJson = tool.toJson();
    expect(ScreeningToolAnswer.fromJson(answerJson).questionId, UNKNOWN);
  });
}
