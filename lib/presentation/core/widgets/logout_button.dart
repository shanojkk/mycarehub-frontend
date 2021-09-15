import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:shared_ui_components/buttons.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key, this.addBorder = false}) : super(key: key);

  final bool addBorder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) => logoutUser(context: context),
      builder: (BuildContext context, Function callback) {
        return SILNoBorderButton(
          buttonKey: logoutButtonKey,
          onPressed: callback,
          text: logoutButtonText,
          textColor: AppColors.redColor,
        );
      },
    );
  }
}
