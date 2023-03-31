import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/medical_data/fetch_medical_data_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data.dart';

import '../../../../../mocks.dart';

void main() {
  group('FetchMedicalData', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('update state correctly', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.regimen?[0]?.category?.text, 'Pneumonia');
      expect(medicalData?.bmi?[0]?.valueString, 'some-bmi-value');
    });

    test('throws error if response contains error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          200,
        ),
      );

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.allergies, <dynamic>[]);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws error if http call was not successful', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.allergies, <dynamic>[]);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws catch unhandled error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.allergies, <dynamic>[]);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });
  });
}
