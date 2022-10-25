import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/exception_tag.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class AcceptDeclineCommunitiesInviteAction extends ReduxAction<AppState> {
  AcceptDeclineCommunitiesInviteAction({
    required this.hasAcceptedInvite,
    required this.communityID,
    required this.client,
    this.onAcceptSuccess,
    this.onDeclineSuccess,
    this.onError,
  });

  final void Function()? onAcceptSuccess;
  final void Function()? onDeclineSuccess;
  final void Function()? onError;
  final IGraphQlClient client;
  final String communityID;
  final bool hasAcceptedInvite;

  @override
  Future<AppState?> reduce() async {
    final String memberId = state.clientState!.id!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberId,
      'communityID': communityID,
    };
    final Response response;

    /// fetch the data from the api
    if (hasAcceptedInvite) {
      response = await client.query(
        acceptInvitationMutation,
        variables,
      );
    } else {
      response = await client.query(
        rejectInvitationMutation,
        variables,
      );
    }

    final Map<String, dynamic> responseMap = client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        hint: acceptDeclineCommunitiesInviteErrorString,
        query: rejectInvitationMutation,
        variables: variables,
        response: response,
        state: state,
      );
      onError?.call();
      throw MyAfyaException(
        cause: acceptRejectCommunitiesTag,
        message: somethingWentWrongText,
      );
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['acceptInvitation'] == true) {
      onAcceptSuccess?.call();
    } else if (data?['rejectInvitation'] == true) {
      onDeclineSuccess?.call();
    } else {
      onError?.call();
    }

    return null;
  }
}
