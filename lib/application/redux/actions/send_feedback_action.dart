// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

/// [SendFeedbackAction] is a Redux Action whose job is to send users feedback.
/// Otherwise delightfully notify user of any Error that might occur during
///  the process.
class SendFeedbackAction extends ReduxAction<AppState> {
  SendFeedbackAction({
    required this.client,
    required this.feedback,
    required this.feedbackType,
    required this.satisfactionLevel,
    this.requiresFollowUp = false,
    this.serviceName,
    this.onSuccess,
    this.onError,
  });

  final String feedback;
  final String feedbackType;
  final int satisfactionLevel;
  final String? serviceName;
  final bool requiresFollowUp;
  final IGraphQlClient client;
  final void Function()? onSuccess;
  final void Function()? onError;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(sendFeedbackFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sendFeedbackFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState?.user?.userId;

    final Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'userID': userID,
        'feedbackType': feedbackType,
        'satisfactionLevel': satisfactionLevel,
        'feedback': feedback,
        'serviceName': serviceName,
        'requiresFollowUp': requiresFollowUp,
      }
    };

    final http.Response result = await client.query(
      sendFeedbackMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? errors = client.parseError(body);

    if (errors != null) {
      onError?.call();
      reportErrorToSentry(
        hint: 'Error while sending feedback',
        query: sendFeedbackMutation,
        variables: variables,
        response: result,
        state: state,
      );

      throw const UserException(somethingWentWrongText);
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['sendFeedback'] == true) {
      onSuccess?.call();
    } else {
      onError?.call();
    }

    return state;
  }
}
