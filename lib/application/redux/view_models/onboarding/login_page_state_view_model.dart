// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding/login_page_state.dart';

class LoginPageStateViewModel extends Vm {
  LoginPageStateViewModel({
    this.invalidCredentials,
    this.phoneNumber,
    this.pinCode,
    required this.wait,
  }) : super(equals: <Object?>[invalidCredentials, phoneNumber, pinCode]);

  final bool? invalidCredentials;
  final String? phoneNumber;
  final String? pinCode;
  final Wait? wait;

  static LoginPageStateViewModel fromStore(Store<AppState> store) {
    final LoginPageState? loginPageState = store.state.loginPageState;

    return LoginPageStateViewModel(
      invalidCredentials: loginPageState?.invalidCredentials,
      phoneNumber: loginPageState?.phoneNumber,
      pinCode: loginPageState?.pinCode,
      wait: store.state.wait,
    );
  }
}
