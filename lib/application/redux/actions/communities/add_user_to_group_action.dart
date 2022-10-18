import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class AddUserToGroupAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final Map<String, dynamic> variables;
  final String communityId;
  final void Function(String)? onError;
  final VoidCallback? onSuccess;
  final int? index;

  AddUserToGroupAction({
    required this.client,
    required this.variables,
    this.communityId = '',
    this.onError,
    this.onSuccess,
    this.index,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(index ?? addUserToCommunityFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(index ?? addUserToCommunityFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await client.query(
      addMembersToCommunityMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? errors = client.parseError(payLoad);
    if (errors != null) {
      onError?.call(errors);
      return null;
    }

    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;
    final bool? memberAdded = data?['addMembersToCommunity'] as bool?;

    if (memberAdded ?? false) {
      onSuccess?.call();
    }
    return null;
  }
}
