import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/user.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SearchMembersAction extends ReduxAction<AppState> {
  SearchMembersAction({required this.searchParam, required this.client});

  final String searchParam;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchRoomMembersFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(searchRoomMembersFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await ChatAPI.searchGroupMembers(
      client: client,
      searchParam: searchParam,
    );

    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    final List<dynamic> rawUsers = data['results'] as List<dynamic>;

    final List<User> users = rawUsers.map((dynamic user) {
      final Map<String, dynamic> newUser = user as Map<String, dynamic>;
      return User.fromJson(newUser);
    }).toList();

    final AppState? newState = state.copyWith.chatState
        ?.call(searchMemberResults: users.isEmpty ? <User>[] : users);

    return newState;
  }
}
