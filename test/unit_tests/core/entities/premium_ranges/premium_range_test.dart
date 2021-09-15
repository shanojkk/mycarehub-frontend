import 'package:flutter_test/flutter_test.dart';

import 'package:myafyahub/domain/core/entities/marketplace/premium_ranges/premium_range.dart';

void main() {
  final Map<String, dynamic> json = <String, dynamic>{'description': '200'};

  test('PremiumRange should convert from json', () {
    final PremiumRange range = PremiumRange.fromJson(json);

    expect(range.description, '200');
  });
}
