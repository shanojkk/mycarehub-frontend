// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class LoginPageStateAction extends ReduxAction<AppState> {
  LoginPageStateAction({
    this.phoneNumber,
    this.pinCode,
    this.invalidCredentials = false,
  });

  final bool invalidCredentials;
  final String? phoneNumber;
  final String? pinCode;

  @override
  AppState reduce() {
    final AppState? newState = state.copyWith.loginPageState?.call(
      phoneNumber: phoneNumber ?? UNKNOWN,
      pinCode: pinCode ?? UNKNOWN,
      invalidCredentials: invalidCredentials,
    );

    return newState ?? state;
  }
}
