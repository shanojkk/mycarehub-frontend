import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/fetch_screening_questions_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

import '../../../../mocks.dart';

void main() {
  group('FetchViolenceScreeningQuestionsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('shows loading indicator successfully', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
    });

    test('should run successfully for violence', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState,
        isNotNull,
      );
    });

    test('should run successfully for contraceptives', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState,
        isNotNull,
      );
    });
    test('should run successfully for alcohol', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
        isNotNull,
      );
    });
    test('should run successfully for tb', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockGraphQlClient(),
          screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState,
        isNotNull,
      );
    });

    test('should dispatch error if body is null for violence', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.violenceState,
        isNotNull,
      );
    });

    test('should dispatch error if body is null for contraceptives', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.contraceptiveState,
        isNotNull,
      );
    });
    test('should dispatch error if body is null for alcohol', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
        isNotNull,
      );
    });
    test('should dispatch error if body is null for tb', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'getScreeningToolQuestions': <dynamic>[]
                }
              }),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        info.state.wait!.isWaitingFor(fetchingQuestionsFlag),
        false,
      );
      expect(
        info.state.miscState?.screeningToolsState?.tbState,
        isNotNull,
      );
    });

    test('should throw error for violence if api response is not 200',
        () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error for tb if api response is not 200', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error for contraceptives if api response is not 200',
        () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error for alcohol if api response is not 200', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error for violence if api reponse is not 200', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        FetchScreeningToolsQuestionsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchScreeningToolsQuestionsAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching questions'),
      );
    });
  });
}
