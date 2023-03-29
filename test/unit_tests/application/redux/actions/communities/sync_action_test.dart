import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/sync_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/sync_params.dart';

import '../../../../../mocks.dart';

void main() {
  group('SyncAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('should sync correctly with initial sync params', () async {
      storeTester.dispatch(
        SyncAction(
          syncParams: SyncParams(
            client: MockCommunitiesClient(),
            accessToken: 'some-access-token',
            fullState: true,
            fullSync: true,
          ),
        ),
      );

      await storeTester.waitUntil(SyncAction);

      expect(
        storeTester.state.chatState?.syncResponse?.rooms?.joinedRooms?.length,
        1,
      );
    });

    test('should sync correctly with repeat sync params', () async {
      storeTester.dispatch(
        SyncAction(
          syncParams: SyncParams(
            client: MockCommunitiesClient(),
            accessToken: 'some-access-token',
            fullState: true,
            since: 'some-since-token',
          ),
        ),
      );

      await storeTester.waitUntil(SyncAction);

      expect(
        storeTester.state.chatState?.syncResponse?.rooms?.joinedRooms?.length,
        1,
      );
    });

    test('should set a backoff if the sync response contains an error',
        () async {
      storeTester.dispatch(
        SyncAction(
          syncParams: SyncParams(
            client: MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              Response(
                json.encode(<String, dynamic>{'error': 'some error'}),
                200,
              ),
            ),
            accessToken: 'some-access-token',
            fullState: true,
            since: 'some-since-token',
          ),
        ),
      );

      await storeTester.waitUntil(SyncAction);

      expect(storeTester.state.chatState?.syncState?.backOff, 5);
    });
  });
}
