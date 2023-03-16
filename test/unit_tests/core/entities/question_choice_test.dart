import 'package:pro_health_360/domain/core/entities/core/question_choice.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Question choice values', () {
    final QuestionChoice tool = QuestionChoice.initial();
    expect(tool.id, UNKNOWN);
    expect(tool.value, UNKNOWN);
  });
}
