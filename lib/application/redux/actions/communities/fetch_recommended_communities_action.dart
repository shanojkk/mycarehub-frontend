import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_group_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/domain/core/entities/core/groups_state.dart';

class FetchRecommendedGroupsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final Map<String, dynamic> variables;

  FetchRecommendedGroupsAction({required this.client, required this.variables});

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchRecommendedCommunitiesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchRecommendedCommunitiesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await client.query(
      recommendedCommunitiesQuery,
      variables,
    );

    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;

    if (data != null) {
      final GroupState groupState =
          GroupState.fromJson(payLoad['data'] as Map<String, dynamic>);
      final List<Group?>? recommendedGroups = groupState.recommendedGroups;

      if (recommendedGroups?.isNotEmpty ?? false) {
        dispatch(
          UpdateGroupStateAction(recommendedGroups: recommendedGroups),
        );
      } else {
        dispatch(UpdateGroupStateAction(recommendedGroups: <Group>[]));
      }
    }
    return state;
  }
}
