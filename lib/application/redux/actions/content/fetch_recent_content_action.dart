// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_recent_content_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/sentry_hints.dart';

class FetchRecentContentAction extends ReduxAction<AppState> {
  FetchRecentContentAction({
    required this.context,
    this.limit = 5,
  });

  final int limit;
  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchRecentContentFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchRecentContentFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'Limit': limit.toString()
    };
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await client.query(
      getContentQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchRecentContentErrorString,
        state: state,
        query: getContentQuery,
        response: response,
        exception: error,
        variables: variables,
      );

      if (error == 'timeout') {
        dispatch(UpdateRecentContentStateAction(timeoutFetchingContent: true));
        throw UserException(getErrorMessage('fetching recent content'));
      }

      dispatch(UpdateRecentContentStateAction(errorFetchingContent: true));
      throw UserException(getErrorMessage('fetching recent content'));
    }

    final FeedContent recentFeedContent = FeedContent.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (recentFeedContent.feedContent != null) {
      final List<Content?>? feedItems = recentFeedContent.feedContent?.items;

      if (feedItems != null && feedItems.isNotEmpty) {
        dispatch(UpdateRecentContentStateAction(contentItems: feedItems));
      } else {
        dispatch(
          UpdateRecentContentStateAction(
            contentItems: <Content>[],
          ),
        );
      }
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == UserException) {
      return error;
    }
    return error;
  }
}
