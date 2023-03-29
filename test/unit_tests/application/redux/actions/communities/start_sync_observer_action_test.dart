import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/start_sync_observer_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/sync_response_state.dart';
import 'package:pro_health_360/application/redux/states/sync_state.dart';
import 'package:sghi_core/communities/models/user.dart' as user;

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('StartSyncObserverAction', () {
    late StoreTester<AppState> storeTester;
    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: user.User.fromJson(loginResponseMock),
              syncState: SyncState.initial().copyWith.call(syncInterval: 2000),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      TestWidgetsFlutterBinding.ensureInitialized();
    });

    tearDown(
      () {
        storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.chatState!.call(
                userProfile: user.User.fromJson(loginResponseMock),
                syncState:
                    SyncState.initial().copyWith.call(syncInterval: 2000),
                syncResponse: SyncResponse.fromJson(syncResponseMock),
              ),
          testInfoPrinter: (TestInfo<dynamic> testInfo) {},
        );

        storeTester.state.chatState?.syncState?.syncObserver?.cancel();
      },
    );

    test(
        'should start sync correctly if last since is available and backoff is 0',
        () async {
      storeTester.dispatch(
        StartSyncObserverAction(client: MockGraphQlClient()),
      );

      await Future<dynamic>.delayed(
        const Duration(milliseconds: 1000),
        () async {
          final TestInfo<AppState> testInfo =
              await storeTester.waitUntil(StartSyncObserverAction);

          expect(testInfo.dispatchCount, 3);
          expect(
            testInfo.state.chatState?.syncState?.syncObserver?.isActive,
            true,
          );
        },
      );
    });

    test(
        'should start sync correctly if last since is available and backoff is 10',
        () async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: user.User.fromJson(loginResponseMock),
              syncState: SyncState.initial().copyWith.call(
                    syncInterval: 1,
                    backOff: 3,
                  ),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(
        StartSyncObserverAction(client: MockGraphQlClient()),
      );

      await Future<dynamic>.delayed(
        const Duration(milliseconds: 10),
        () async {
          final TestInfo<AppState> testInfo =
              await storeTester.waitUntil(StartSyncObserverAction);

          expect(testInfo.dispatchCount, 3);
          expect(
            testInfo.state.chatState?.syncState?.syncObserver?.isActive,
            true,
          );

          expect(testInfo.state.chatState?.syncState?.backOff, 3);
        },
      );
    });

    group('StartSyncObserverAction from empty state', () {
      late StoreTester<AppState> storeTester;

      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: user.User.fromJson(loginResponseMock),
              syncState: SyncState.initial().copyWith.call(
                    syncInterval: 2000,
                    syncObserver: null,
                  ),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      TestWidgetsFlutterBinding.ensureInitialized();

      test('should start sync correctly if sync observer is null', () async {
        storeTester.dispatch(
          StartSyncObserverAction(client: MockGraphQlClient()),
        );

        await Future<dynamic>.delayed(
          const Duration(milliseconds: 1000),
          () async {
            final TestInfo<AppState> testInfo =
                await storeTester.waitUntil(StartSyncObserverAction);

            expect(testInfo.dispatchCount, 3);
            expect(
              testInfo.state.chatState?.syncState?.syncObserver?.isActive,
              true,
            );
          },
        );
      });
    });
  });
}
