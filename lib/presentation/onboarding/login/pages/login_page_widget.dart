import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:afya_moja_core/phone_input.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/login_page_state_action.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:user_profile/helpers.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({
    Key? key,
    required this.invalidCredentials,
    required this.isWaitingFor,
    required this.login,
  }) : super(key: key);

  final bool invalidCredentials;
  final bool isWaitingFor;
  final VoidCallback login;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController phoneNumberInputController =
        TextEditingController();

    final TextEditingController pinInputController = TextEditingController();

    return OnboardingScaffold(
      title: loginPageTitleString,
      description: loginPageSubTitleString,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      phoneNumberString,
                      style: TextThemes.boldSize14Text(AppColors.greyTextColor),
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  MyAfyaHubPhoneInput(
                    phoneNumberFormatter: formatPhoneNumber,
                    inputController: phoneNumberInputController,
                    labelText: enterPhoneNumberString,
                    onChanged: (String? val) {
                      if (invalidCredentials) {
                        StoreProvider.dispatch(
                          context,
                          LoginPageStateAction(),
                        );
                      }
                      // setState(() {
                      //   phoneNumberText = val?.toString();
                      // });
                    },
                  ),
                  largeVerticalSizedBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      pinString,
                      style: TextThemes.boldSize14Text(AppColors.greyTextColor),
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  CustomTextField(
                    controller: pinInputController,
                    formFieldKey: pinInputKey,
                    borderColor: Colors.grey[200],
                    maxLength: 4,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    hintText: enterYourString,
                    validator: userPinValidator,
                    autovalidateMode: AutovalidateMode.disabled,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String val) {
                      if (invalidCredentials) {
                        StoreProvider.dispatch(
                          context,
                          LoginPageStateAction(),
                        );
                      }
                      // setState(() {
                      //   pin = val;
                      // });
                    },
                  ),
                  if (invalidCredentials) ...<Widget>[
                    const ErrorAlertBox(message: invalidCredentialsErrorMsg),
                  ],
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    BWRoutes.verifySignUpOTP,
                    arguments: <String, int>{
                      'OTP': 1234,
                    },
                  );
                },
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  key: verifyOTPGestureKey,
                  child: Text('    '),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: isWaitingFor
                    ? const SILPlatformLoader(color: AppColors.secondaryColor)
                    : SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: MyAfyaHubPrimaryButton(
                          buttonKey: phoneLoginContinueButtonKey,
                          onPressed: () async {
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
                            if (_formKey.currentState!.validate()) {
                              final String pinText = pinInputController.text;
                              final String phoneNumberText =
                                  phoneNumberInputController.text;

                              if (pinText.isNotEmpty &&
                                  phoneNumberText.isNotEmpty) {
                                StoreProvider.dispatch(
                                  context,
                                  LoginPageStateAction(
                                    pinCode: pinText,
                                    phoneNumber: phoneNumberText,
                                  ),
                                );
                                login();
                              }
                            }
                          },
                          buttonColor: AppColors.secondaryColor,
                          borderColor: Colors.transparent,
                          text: continueString,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
