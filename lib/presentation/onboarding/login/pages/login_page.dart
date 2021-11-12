// Flutter imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/phone_input.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/onboarding/login_page_state_view_model.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page_widget.dart';

/// It consists of [MyAfyaHubPhoneInput] used to user input PhoneNumber,
///  [CustomTextField] to input PIN and [MyAfyaHubPrimaryButton] as submit button
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageStateViewModel>(
      vm: () => LoginPageStateViewModelFactory(),
      builder: (BuildContext context, LoginPageStateViewModel vm) {
        return LoginPageWidget(
          invalidCredentials: vm.invalidCredentials ?? false, isWaitingFor: vm.,
        );
      },
    );
  }
}

class LoginPageStateViewModelFactory extends VmFactory<AppState, LoginPage> {
  @override
  Vm fromStore() {
    // TODO: implement fromStore
    throw UnimplementedError();
  }
}
