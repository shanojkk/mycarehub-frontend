import 'package:myafyahub/domain/core/entities/marketplace/premium_ranges/range.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Map<String, dynamic> json = <String, dynamic>{'minAmount': '200'};

  test('PremiumRange should convert from json', () {
    final Range range = Range.fromJson(json);

    expect(range.minAmount, '200');
  });
}
