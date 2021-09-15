import 'package:myafyahub/infrastructure/repository/migrations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('migrations should have 4 migrations', () {
    expect(migrations.length, 4);
  });
}
