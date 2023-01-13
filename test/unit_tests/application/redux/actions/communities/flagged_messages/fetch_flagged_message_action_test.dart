import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/flagged_messages/fetch_flagged_messages_action.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../../../../mocks.dart';

void main() {
  group('FetchFlaggedMessagesAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update communities state', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listFlaggedMessages': mockListFlaggedMessages,
            }
          }),
          201,
        ),
      );

      storeTester.dispatch(
        FetchFlaggedMessagesAction(
          client: client,
          communityCID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFlaggedMessagesAction);

      expect(
        info.state.clientState?.communitiesState?.flaggedMessages?.length,
        3,
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        FetchFlaggedMessagesAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          communityCID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFlaggedMessagesAction);

      expect(
        info.state.clientState?.communitiesState?.flaggedMessages,
        <Message>[],
      );
    });

    test('should throw error if no connection', () async {
      String error = '';

      storeTester.dispatch(UpdateConnectivityAction(hasConnection: false));
      storeTester.dispatch(
        FetchFlaggedMessagesAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          onFailure: (String message) {
            error = message;
          },
          communityCID: '',
        ),
      );

      expect(error, connectionLostText);

      await storeTester.waitUntil(FetchFlaggedMessagesAction);

      expect(error, connectionLostText);
    });
  });
}
