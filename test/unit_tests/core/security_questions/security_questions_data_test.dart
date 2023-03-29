// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import '../../../mock_data.dart';

void main() {
  group('SecurityQuestionsData', () {
    test('expects to convert SecurityQuestionsData from json', () {
      final SecurityQuestionsData securityQuestionsData =
          SecurityQuestionsData.fromJson(mockSecurityQuestionsData);
      expect(securityQuestionsData, isA<SecurityQuestionsData>());
    });
  });
}
