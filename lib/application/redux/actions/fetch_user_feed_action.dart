import 'dart:async';

import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart' as http;

import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/remove_feed_error_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/actions/update_app_error_state_action.dart';
import 'package:myafyahub/application/redux/actions/save_user_feed_action.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:user_feed/user_feed.dart';
import 'package:flutter_graphql_client/graph_client.dart';

class FetchUserFeedAction extends ReduxAction<AppState> {
  FetchUserFeedAction({
    required this.context,
    this.refresh = true,
    this.showRefreshIndicator = true,
  });

  final BuildContext context;
  final bool refresh;
  final bool showRefreshIndicator;

  @override
  void after() => showFeedShimmer.add(false);

  @override
  void before() {
    if (this.showRefreshIndicator) {
      showFeedShimmer.add(true);
    }
  }

  @override
  Future<AppState> reduce() async {
    // do not fetch the feed if refresh is false
    if (refresh == false) return state;

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    // make an api call and fetch the user feed
    final http.Response _feedFetchResponse = await _client.query(
        getFeedQuery,
        getFeedQueryVariables(
          isAnonymous: false,
        ));

    /// handle timeout
    if (_feedFetchResponse.statusCode == 408) {
      // dispatch an action to show a timeout error
      store.dispatch(UpdateAppErrorStateAction(
        isTimeout: true,
        errorType: AppErrorType.UserFeedError,
        errorMessage: 'timeout',
        isError: false,
      ));
      return state;
    }

    final Map<String, dynamic> _response = _client.toMap(_feedFetchResponse);
    final String? error = _client.parseError(_response);
    // check for errors in the data
    if (error != null) {
      // dispatch an action to show another error
      store.dispatch(
        UpdateAppErrorStateAction(
            isError: true,
            errorType: AppErrorType.UserFeedError,
            isTimeout: false,
            errorMessage: 'error'),
      );
      return state;
    }

    store.dispatch(RemoveFeedErrorStateAction());

    final FeedResponsePayload payload = FeedResponsePayload.fromJson(_response);

    // save the feed to state
    await store.dispatch(SaveUserFeedAction(userFeedState: payload));

    if (store.state.wait!.isWaitingFor(feedRefreshFlag)) {
      toggleLoadingIndicator(
          context: context, flag: feedRefreshFlag, show: false);
    }

    return state;
  }
}
