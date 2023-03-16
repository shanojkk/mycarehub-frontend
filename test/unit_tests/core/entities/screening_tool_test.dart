import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';

void main() {
  test('Screening tool values', () {
    final ScreeningTool tool = ScreeningTool.initial();
    expect(tool.id, UNKNOWN);
    expect(tool.questionnaireId, UNKNOWN);
  });
}
