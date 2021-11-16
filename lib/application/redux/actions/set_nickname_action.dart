import 'dart:async';
import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/nickname/set_nickname_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/exception_tag.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

class SetNickName extends ReduxAction<AppState> {
  SetNickName({
    required this.context,
    required this.nickname,
  });

  final BuildContext context;
  final String nickname;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(nickNameFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(nickNameFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    //Todo: Remove after testing
    _client.idToken = dGraphToken;
    _client.endpoint = dGraphEndpoint;

    final http.Response result = await _client.query(
      setNickNameMutation,
      <String, dynamic>{
        'userID': state.userProfileState!.userProfile!.id,
        'nickname': nickname,
      },
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap.isEmpty) {
      throw SILException(
        cause: acceptTermsTag,
        message: somethingWentWrongText,
      );
    }

    final SetNicknameResponse setNicknameResponse =
        SetNicknameResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    if (setNicknameResponse.acceptTerms) {
      dispatch(
        UpdateUserProfileAction(
          profile: state.userProfileState!.userProfile!.copyWith(
            username: Name.withValue(nickname),
          ),
        ),
      );

      //Navigate to home page
      Navigator.pushReplacementNamed(
        context,
        BWRoutes.home,
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
