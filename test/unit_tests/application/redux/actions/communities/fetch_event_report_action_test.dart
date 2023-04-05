import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_event_report_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:sghi_core/communities/models/message.dart';

import '../../../../../mock_data.dart';
import '../../../../../mocks.dart';

void main() {
  group('FetchEventReportAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should fetch an event report successfully and update state',
        () async {
      bool error = false;

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        FetchEventReportAction(
          reportID: 'test-report-id',
          onError: () => error = true,
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(eventReportMock), 200),
          ),
        ),
      );

      await storeTester.waitUntil(FetchEventReportAction);
      expect(error, false);

      expect(
        storeTester.state.chatState?.selectedFlaggedMessage,
        isA<EventReport>(),
      );
      expect(
        storeTester.state.chatState?.selectedFlaggedMessage?.reportedMessage,
        isA<Message>(),
      );
      expect(
        storeTester.state.chatState?.selectedFlaggedMessage?.reportedMessage
            ?.content?.body,
        'hi',
      );
    });

    test('should fail to fetch an event report', () async {
      bool error = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        FetchEventReportAction(
          reportID: 'test-report-id',
          onError: () {
            error = true;
          },
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{}),
              403,
            ),
          ),
        ),
      );

      await storeTester.waitUntil(FetchEventReportAction);
      expect(error, true);
    });
  });
}
