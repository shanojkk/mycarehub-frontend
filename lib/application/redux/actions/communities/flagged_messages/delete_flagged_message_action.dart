import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class DeleteFlaggedMessageAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String messageID;
  final void Function(String message)? onFailure;
  final VoidCallback? onSuccess;

  DeleteFlaggedMessageAction({
    required this.client,
    required this.messageID,
    this.onFailure,
    this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add('${deleteCommunityMessageFlag}_$messageID'),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove('${deleteCommunityMessageFlag}_$messageID'),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call(connectionLostText);
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'messageID': messageID,
    };

    final Response response = await client.query(
      deleteCommunityMessageMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> responseMap = client.toMap(response);

    final String? errors = parseError(responseMap);

    if (errors != null) {
      reportErrorToSentry(
        hint: deleteFlaggedMessageErrorString,
        state: state,
        query: deleteCommunityMessageMutation,
        response: response,
        exception: errors,
        variables: variables,
      );
      throw const UserException(somethingWentWrongText);
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['deleteCommunityMessage'] == true) {
      final List<Message?>? messages =
          state.clientState?.communitiesState?.flaggedMessages;

      final List<Message?>? removed = messages
          ?.where((Message? message) => message?.id != messageID)
          .toList();

      dispatch(
        UpdateCommunitiesStateAction(flaggedMessages: removed),
      );
      onSuccess?.call();
    }

    return state;
  }
}
