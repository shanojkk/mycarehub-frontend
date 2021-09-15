import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert from json', () {
    final AppErrorState result2 = AppErrorState.fromJson(
        <String, dynamic>{'isTimeout': false, 'errorMessage': 'test'});

    expect(result2.isTimeout, isNotNull);
    expect(result2.isTimeout, false);
    expect(result2.errorMessage, isNotNull);
    expect(result2.errorMessage, 'test');
  });
}
