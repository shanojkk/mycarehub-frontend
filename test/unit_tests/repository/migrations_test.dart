// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/infrastructure/repository/migrations.dart';

void main() {
  test('migrations should have 9 migrations', () {
    expect(migrations.length, 9);
  });
}
