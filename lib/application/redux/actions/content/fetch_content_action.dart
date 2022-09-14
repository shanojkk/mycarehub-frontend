import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class FetchContentAction extends ReduxAction<AppState> {
  FetchContentAction({
    required this.context,
    this.limit = 20,
    this.category,
  });

  final ContentCategory? category;
  final BuildContext context;
  final int limit;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchContentFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      UpdateContentStateAction(
        selectedCategory: category ?? ContentCategory.initial(),
        timeoutFetchingContent: false,
        errorFetchingContent: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchContentFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final ContentCategory selectedCategory =
        category ?? ContentCategory.initial();

    final Map<String, dynamic> variables = <String, dynamic>{
      'categoryID': selectedCategory.id == 0 ? null : selectedCategory.id,
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
        context,
        error,
        hint: 'Error while fetching your content',
      );

      if (error == 'timeout') {
        dispatch(UpdateContentStateAction(timeoutFetchingContent: true));
        return null;
      }

      dispatch(UpdateContentStateAction(errorFetchingContent: true));
      return null;
    }

    final FeedContent feedContent = FeedContent.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (feedContent.feedContent != null) {
      final List<Content?>? feedItems = feedContent.feedContent?.items;

      if (feedItems != null && feedItems.isNotEmpty) {
        dispatch(UpdateContentStateAction(contentItems: feedItems));
      } else {
        dispatch(
          UpdateContentStateAction(
            contentItems: <Content>[],
            timeoutFetchingContent: false,
            errorFetchingContent: false,
          ),
        );
      }
    }

    return state;
  }
}
