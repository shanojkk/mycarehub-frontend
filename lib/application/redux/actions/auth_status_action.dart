import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:domain_objects/entities.dart';

class AuthStatusAction extends ReduxAction<AppState> {
  AuthStatusAction({
    this.idToken,
    this.refreshToken,
    this.expiresAt,
    this.isAnonymous,
    this.canExperiment,
    this.signedIn,
    this.uid,
    this.signedInTime,
    this.isChangePin,
  });

  final String? idToken;
  final String? expiresAt;
  final String? refreshToken;
  final bool? isAnonymous;
  final bool? canExperiment;
  final bool? signedIn;
  final String? uid;
  final String? signedInTime;
  final bool? isChangePin;

  @override
  AppState reduce() {
    final AuthCredentialResponse authFromState = state.userProfileState!.auth!;
    final AppState newState = state.copyWith.userProfileState!.call(
      isSignedIn: this.signedIn ?? state.userProfileState!.isSignedIn,
      signedInTime: this.signedInTime ?? state.userProfileState!.signedInTime,
      auth: AuthCredentialResponse(
        idToken: idToken ?? authFromState.idToken,
        expiresIn: expiresAt ?? authFromState.expiresIn,
        refreshToken: refreshToken ?? authFromState.refreshToken,
        isAnonymous: isAnonymous ?? authFromState.isAnonymous,
        canExperiment: canExperiment ?? authFromState.canExperiment,
        uid: uid ?? authFromState.uid,
        isChangePin: isChangePin ?? authFromState.isChangePin,
      ),
    );

    return newState;
  }
}
