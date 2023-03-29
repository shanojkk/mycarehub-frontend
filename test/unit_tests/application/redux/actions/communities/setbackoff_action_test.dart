import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/set_backoff_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

void main() {
  group('SetBackoffAction', () {
    late StoreTester<AppState> storeTester;
    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('should dispatch and update state with new backoff value', () async {
      expect(storeTester.state.chatState?.syncState?.backOff, 0);

      storeTester.dispatch(SetBackoffAction(backoff: 5));

      await storeTester.waitUntil(SetBackoffAction);
      expect(storeTester.state.chatState?.syncState?.backOff, 5);
    });

    test('should dispatch and update state with new last attempt value',
        () async {
      expect(storeTester.state.chatState?.syncState?.lastAttempt, 0);

      storeTester.dispatch(SetLastAttempt(lastAttempt: 1679578595));

      await storeTester.waitUntil(SetLastAttempt);
      expect(storeTester.state.chatState?.syncState?.lastAttempt, 1679578595);
    });
  });
}
