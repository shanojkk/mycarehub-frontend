// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import '../../../mock_data.dart';

void main() {
  test('Contact fromJson', () {
    expect(Contact.fromJson(mockPrimaryContact), isA<Contact>());
  });
}
