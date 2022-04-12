import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UpdateCaregiverInfoAction extends ReduxAction<AppState> {
  UpdateCaregiverInfoAction({
    required this.caregiverInformation,
    required this.graphQlClient,
  });

  final CaregiverInformation caregiverInformation;
  final IGraphQlClient graphQlClient;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(editInformationFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(editInformationFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'caregiverInput': caregiverInformation.toJson(),
    };
    variables['clientID'] = state.clientState?.id;

    final Response response = await graphQlClient.query(
      updateClientCaregiver,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap = graphQlClient.toMap(response);
      final String? error = parseError(responseMap);

      if (error != null) {
        Sentry.captureException(
          UserException(error),
          hint: <String, dynamic>{'caregiverInput': variables},
        );

        throw UserException(getErrorMessage('updating caregiver information'));
      }

      if (((responseMap['data']?['createOrUpdateClientCaregiver'] ?? false)
              as bool) ==
          true) {
        dispatch(
          UpdateClientProfileAction(caregiverInformation: caregiverInformation),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
