import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

import 'package:flutter/material.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

/// [ManageTokenAction] called when a valid auth has been received. In this regarded, [signedIn] will always be [true]
class ManageTokenAction extends ReduxAction<AppState> {
  ManageTokenAction({
    required this.context,
    required this.refreshToken,
    required this.idToken,
    required this.parsedExpiresAt,
    required this.refreshTokenManger,
    this.canExperiment = false,
  });

  final BuildContext context;

  String parsedExpiresAt;
  String idToken;
  String refreshToken;
  RefreshTokenManger refreshTokenManger;
  bool? canExperiment;

  @override
  Future<AppState> reduce() async {
    await dispatch(
      AuthStatusAction(
        signedIn: true,
        idToken: idToken,
        refreshToken: refreshToken,
        expiresAt: parsedExpiresAt,
        isAnonymous: false,
        canExperiment: this.canExperiment,
      ),
    );

    /// start refresh token timer
    this.refreshTokenManger.updateExpireTime(parsedExpiresAt).reset();
    return state;
  }
}
