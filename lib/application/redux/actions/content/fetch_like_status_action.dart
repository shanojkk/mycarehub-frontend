// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class FetchLikeStatusAction extends ReduxAction<AppState> {
  FetchLikeStatusAction({
    required this.context,
    required this.contentID,
  });

  final BuildContext context;
  final int contentID;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchLikeStatusFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchLikeStatusFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': state.clientState!.user!.userId,
      'contentID': contentID
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      checkIfUserHasLikedContentQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error while fetching your like status',
      );
      throw SILException(
        cause: fetchLikeStatusFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['checkIfUserHasLikedContent'] != null) {
      dispatch(
        UpdateReactionStatusAction(
          contentID: contentID,
          hasLiked: responseMap['data']['checkIfUserHasLikedContent'] as bool,
        ),
      );
    }

    return state;
  }
  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ),
        );
      return error;
    }
    return error;
  }
}