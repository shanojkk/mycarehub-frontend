import 'package:myafyahub/domain/core/value_objects/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Capitalize', () {
    test('First letter of String is small', () {
      final String myString = 'name'.capitalize();
      expect(myString, 'Name');
    });

    test('First letter of a String is a number', () {
      final String myString = '1ame'.capitalize();
      expect(myString, '1ame');
    });

    test('First letter of a String is a symbol', () {
      final String myString = '{ame'.capitalize();
      expect(myString, '{ame');
    });
  });
}
