// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_content_categories_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class FetchContentCategoriesAction extends ReduxAction<AppState> {
  FetchContentCategoriesAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void before() {
    super.before();

    dispatch(WaitAction<AppState>.add(fetchContentCategoriesFlag));
    dispatch(
      UpdateContentCategoriesAction(
        errorFetchingContentCategories: false,
        timeoutFetchingContentCategories: false,
      ),
    );
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchContentCategoriesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final http.Response result = await client.query(
      getCategoriesQuery,
      <String, dynamic>{},
    );

    final Map<String, dynamic> body = client.toMap(result);

    final String? error = parseError(body);

    if (error != null) {
      if (error == 'timeout') {
        dispatch(
          UpdateContentCategoriesAction(timeoutFetchingContentCategories: true),
        );
        return null;
      }

      dispatch(
        UpdateContentCategoriesAction(errorFetchingContentCategories: true),
      );
      return null;
    }

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final ListContentCategory listContentCategory =
        ListContentCategory.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    if (listContentCategory.contentCategories != null) {
      final List<ContentCategory?>? items =
          listContentCategory.contentCategories;
      dispatch(
        UpdateContentCategoriesAction(
          contentCategories: items,
        ),
      );
    }

    return state;
  }
}
