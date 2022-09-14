// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

/// [UnlikeContentAction] is a Redux Action whose job is to add like to content per user
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class UpdateContentLikeStatusAction extends ReduxAction<AppState> {
  UpdateContentLikeStatusAction({
    required this.contentID,
    required this.context,
    required this.isLiked,
  });

  final BuildContext context;
  final int contentID;
  final bool isLiked;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.clientState?.user?.userId;

    // initializing of the UnlikeContent mutation
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'contentID': contentID,
    };
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await client.query(
      isLiked ? unlikeContentMutation : likeContentMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);

    client.close();

    final String? errors = client.parseError(body);
    if (errors != null) {
      if (errors.contains('Network connection unreliable')) {
        throw MyAfyaException(
          cause: updateLikeContentFlag,
          message: networkConnectionUnreliable,
        );
      }

      throw MyAfyaException(
        cause: updateLikeContentFlag,
        message: somethingWentWrongText,
      );
    }

    await AnalyticsService().logEvent(
      name: isLiked ? likeContentEvent : unlikeContentEvent,
      eventType: AnalyticsEventType.CONTENT_INTERACTION,
      parameters: <String, dynamic>{'contentID': contentID},
    );

    return null;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text((error as MyAfyaException).message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );
    }

    reportErrorToSentry(context, error);
    return error;
  }
}
