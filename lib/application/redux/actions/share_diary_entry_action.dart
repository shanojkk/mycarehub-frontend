import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/fetch_health_diary_action.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class ShareDiaryEntryAction extends ReduxAction<AppState> {
  ShareDiaryEntryAction({
    required this.client,
    required this.onSuccess,
    required this.onFailure,
    required this.healthDiaryEntryID,
    required this.canShareEntireDiaryEntry,
  });

  final void Function()? onSuccess;
  final void Function()? onFailure;
  final IGraphQlClient client;
  final String healthDiaryEntryID;
  final bool canShareEntireDiaryEntry;

  @override
  void after() {
    dispatch(FetchHealthDiaryAction(client: client));
    dispatch(WaitAction<AppState>.remove(shareDiaryEntryFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(shareDiaryEntryFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'healthDiaryEntryID': healthDiaryEntryID,
      'shareHealthDiaryEntry': canShareEntireDiaryEntry
    };
    final Response response =
        await client.query(shareHealthDiaryEntryMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: 'Error while sharing diary entry',
          query: shareHealthDiaryEntryMutation,
          variables: variables,
          response: response,
          state: state,
        );

        throw UserException(getErrorMessage('sharing diary entry'));
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data?['shareHealthDiaryEntry'] == true) {
        // Log event for analytic
        await AnalyticsService().logEvent(
          name: shareDiaryEntryEvent,
          eventType: AnalyticsEventType.INTERACTION,
          parameters: <String, dynamic>{
            'healthDiaryEntryID': healthDiaryEntryID,
          },
        );
        onSuccess?.call();
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
