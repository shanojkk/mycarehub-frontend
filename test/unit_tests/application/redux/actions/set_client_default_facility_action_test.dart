import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/set_client_default_facility_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';

import '../../../../mocks.dart';

void main() {
  group('SetClientDefaultFacilityAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        SetClientDefaultFacilityAction(
          client: MockGraphQlClient(),
          facility: Facility.initial(),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetClientDefaultFacilityAction);

      expect(info.state.wait!.isWaitingFor(setDefaultFacilityFlag), false);
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        SetClientDefaultFacilityAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          facility: Facility.initial(),
          onFailure: (String message) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetClientDefaultFacilityAction);

      expect(info.state.wait!.isWaitingFor(setDefaultFacilityFlag), false);

      expect((info.error! as UserException).msg, getErrorMessage());
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        SetClientDefaultFacilityAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          facility: Facility.initial(),
          onFailure: (String message) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetClientDefaultFacilityAction);

      expect(info.state.wait!.isWaitingFor(setDefaultFacilityFlag), false);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('selecting facility'),
      );
    });
  });
}
