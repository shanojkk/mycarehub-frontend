import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_response.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchMedicalDataAction extends ReduxAction<AppState> {
  FetchMedicalDataAction({required this.httpClient});

  final IGraphQlClient httpClient;

  @override
  void after() {
    super.after();
    dispatch(WaitAction<AppState>.remove(fetchMedicalDataFlag));
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchMedicalDataFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String patientID = state.clientState?.fhirPatientID ?? '';
    final Map<String, dynamic> variables = <String, dynamic>{
      'patientID': patientID == UNKNOWN ? '' : patientID,
    };

    final Response response =
        await httpClient.query(medicalDataQuery, variables);

    final ProcessedResponse processed = processHttpResponse(response);

    if (processed.ok) {
      final Map<String, dynamic> mapped = httpClient.toMap(response);

      final String? error = httpClient.parseError(mapped);

      if (error != null) {
        // log error accessing medical data
        await AnalyticsService().logEvent(
          name: unsuccessfulMedicalDataAccessEvent,
          eventType: AnalyticsEventType.INTERACTION,
          parameters: <String, dynamic>{
            'error': error,
            'patientID': patientID,
          },
        );
        throw UserException(getErrorMessage());
      }

      final MedicalDataResponse medicalDataResponse =
          MedicalDataResponse.fromJson(
        mapped['data'] as Map<String, dynamic>,
      );

      final MedicalDataState newState =
          MedicalDataState(medicalData: medicalDataResponse.medicalData);

      // log successful medical data access
      await AnalyticsService().logEvent(
        name: successfulMedicalDataAccessEvent,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'patientID': patientID,
        },
      );

      final AppState appState = state.copyWith(
        clientState: state.clientState?.copyWith(medicalDataState: newState),
      );

      return appState;
    } else {
      // log error accessing medical data
      await AnalyticsService().logEvent(
        name: unsuccessfulMedicalDataAccessEvent,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'error': processed.message,
          'patientID': patientID,
        },
      );
      throw UserException(getErrorMessage());
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
