// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_home_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class CreateHealthDiaryAction extends ReduxAction<AppState> {
  CreateHealthDiaryAction({
    required this.context,
    required this.note,
    required this.mood,
  });

  final BuildContext context;
  final String note;
  final String mood;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(createHealthDiaryFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createHealthDiaryFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState?.id;
    final bool shouldShareHealthRecord =
        state.clientState?.healthDiaryState?.shouldShareHealthRecord ?? false;

    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': userID,
      'note': note,
      'mood': mood,
      'reportToStaff': shouldShareHealthRecord
    };

    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await client.query(
      createHealthDiaryEntryMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    final String? error = parseError(body);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: errorCreatingHealthDiaryEntryString,
      );

      throw MyAfyaException(
        cause: errorCreatingHealthDiaryEntryString,
        message: somethingWentWrongText,
      );
    }

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['createHealthDiaryEntry'] != null &&
        data?['createHealthDiaryEntry'] == true) {
      // Log event for analytic
      await AnalyticsService().logEvent(
        name: recordDiaryEntryEvent,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'mood': mood,
          'reportToStaff': shouldShareHealthRecord,
          'note': note,
        },
      );

      dispatch(
        UpdateHomeStateAction(
          createHealthDiaryEntry: true,
          canRecordMood: false,
        ),
      );
      Navigator.popAndPushNamed(
        context,
        AppRoutes.successfulEntryPage,
        arguments: DiaryEntrySuccessType.created,
      );
    }

    return state;
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
            action: dismissSnackBar(
              closeString,
              white,
              context,
            ),
          ),
        );
      return error;
    }
    return error;
  }
}
