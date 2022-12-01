import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/ban_user_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

import '../../../../../mocks.dart';
import 'ban_user_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('BanUserAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should complete normally', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{'banUser': true}
          }),
          200,
        ),
      );

      int success = 0;

      storeTester.dispatch(
        BanUserAction(
          client: client,
          memberID: '',
          communityID: '',
          onSuccess: () => success++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(BanUserAction);

      expect(info.dispatchCount, 3);
      expect(success, 1);
    });

    test('should handle false', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{'banUser': false}
          }),
          200,
        ),
      );

      int error = 0;

      storeTester.dispatch(
        BanUserAction(
          client: client,
          memberID: '',
          communityID: '',
          onError: () => error++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(BanUserAction);

      expect(info.dispatchCount, 3);
      expect(error, 1);
    });

    test('should handle api error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          200,
        ),
      );

      int errors = 0;

      storeTester.dispatch(
        BanUserAction(
          client: client,
          memberID: '',
          communityID: '',
          onError: () => errors++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(BanUserAction);

      expect(info.state.miscState?.groupState?.groupMembers?.length, 0);
      expect(errors, 1);
    });

    test('should handle exception', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        BanUserAction(client: client, memberID: '', communityID: ''),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(BanUserAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
