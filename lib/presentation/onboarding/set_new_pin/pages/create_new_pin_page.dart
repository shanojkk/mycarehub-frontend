// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [CreateNewPINPage] has two [CustomTextField] to create new user PIN
///
/// The [CustomTextField] for confirm PIN validates if it matches the
/// PIN entered in the above [CustomTextField]

class CreateNewPINPage extends StatefulWidget {
  @override
  _CreateNewPINPageState createState() => _CreateNewPINPageState();
}

class _CreateNewPINPageState extends State<CreateNewPINPage> {
  late String confirmPin = '';
  late String pin = '';
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: createNewPINTitleString,
      description: createNewPINSubTitleString,
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          pinString,
                          style: TextThemes.boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      CustomTextField(
                        formFieldKey: pinInputKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        borderColor: Colors.grey[200],
                        maxLength: 4,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: userPinValidator,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String val) {
                          setState(() {
                            pin = val;
                          });
                        },
                      ),
                      verySmallVerticalSizedBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          confirmPinString,
                          style: TextThemes.boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        formFieldKey: confirmPinInputKey,
                        borderColor: Colors.grey[200],
                        maxLength: 4,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: userPinValidator,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String val) {
                          setState(() {
                            confirmPin = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                veryLargeVerticalSizedBox,
                if (vm.appState.wait!.isWaitingFor(createPinFlag)) ...<Widget>{
                  const SILPlatformLoader(
                    color: AppColors.secondaryColor,
                  )
                },
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: createPINContinueButtonKey,
                      onPressed: vm.appState.wait!.isWaitingFor(createPinFlag)
                          ? null
                          : () async {
                              if (!InternetConnectivitySubject()
                                  .connectivitySubject
                                  .valueOrNull!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(noInternetConnection),
                                  ),
                                );
                                return;
                              }
                              if (!confirmPinValidator(pin, confirmPin)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(pinMustMatchString),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }
                              if (_formKey.currentState!.validate()) {
                                setUserPIN(
                                  context: context,
                                  newPIN: pin,
                                  confirmPIN: confirmPin,
                                  flavour: Flavour.CONSUMER.name,
                                );
                              }
                            },
                      buttonColor: vm.appState.wait!.isWaitingFor(createPinFlag)
                          ? Colors.grey
                          : AppColors.secondaryColor,
                      borderColor: vm.appState.wait!.isWaitingFor(createPinFlag)
                          ? Colors.grey
                          : AppColors.secondaryColor,
                      text: saveAndContinueButtonText,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}