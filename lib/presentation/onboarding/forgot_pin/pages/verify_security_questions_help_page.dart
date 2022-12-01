import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/pin_reset_service_request_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/shared_themes/constants.dart';

class VerifySecurityQuestionsHelpPage extends StatefulWidget {
  @override
  State<VerifySecurityQuestionsHelpPage> createState() =>
      _VerifySecurityQuestionsHelpPageState();
}

class _VerifySecurityQuestionsHelpPageState
    extends State<VerifySecurityQuestionsHelpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? cccNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                veryLargeVerticalSizedBox,
                SvgPicture.asset(
                  pinRequestSentImage,
                ),
                largeVerticalSizedBox,
                Text(
                  doYouNeedHelpString,
                  style: heavySize20Text(),
                  textAlign: TextAlign.center,
                ),
                smallVerticalSizedBox,
                Text(
                  verifySecurityQuestionHelpMessageString,
                  style: normalSize14Text(
                    darkGreyTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    cccNumberString,
                    style: boldSize14Text(),
                    textAlign: TextAlign.start,
                  ),
                ),
                smallVerticalSizedBox,
                CustomTextField(
                  formFieldKey: cccInputKey,
                  hintText: cccNumberHint,
                  customFillColor: AppColors.greyTextColor.withOpacity(0.08),
                  keyboardType: TextInputType.text,
                  borderColor: Colors.transparent,
                  validator: cccNumberValidator,
                  focusedBorderColor: Colors.transparent,
                  autovalidateMode: AutovalidateMode.disabled,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(15)
                  ],
                  onChanged: (String val) {
                    setState(() {
                      cccNumber = val;
                    });
                  },
                ),
                smallVerticalSizedBox,
                StoreConnector<AppState, AppStateViewModel>(
                  converter: (Store<AppState> store) =>
                      AppStateViewModel.fromStore(store),
                  builder: (BuildContext context, AppStateViewModel vm) {
                    return vm.wait?.isWaitingFor(pinResetServiceRequestFlag) ??
                            false
                        ? const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: PlatformLoader(),
                          )
                        : Column(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: MyAfyaHubPrimaryButton(
                                  buttonKey: askForHelpButtonKey,
                                  text: askForHelpString,
                                  onPressed: () {
                                    final bool? isFormValid =
                                        _formKey.currentState?.validate();
                                    if (isFormValid != null && isFormValid) {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        PINResetServiceRequestAction(
                                          client: AppWrapperBase.of(context)!
                                              .graphQLClient,
                                          cccNumber: cccNumber!,
                                          pinResetServiceRequestEndpoint:
                                              AppWrapperBase.of(context)!
                                                  .customContext!
                                                  .pinResetServiceRequestEndpoint,
                                          onSuccess: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  successfulPINResetRequestString,
                                                ),
                                                duration: Duration(
                                                  seconds:
                                                      kShortSnackBarDuration,
                                                ),
                                              ),
                                            );
                                          },
                                          onError: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getErrorMessage(
                                                    sendingPINResetRequestSting,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                  seconds:
                                                      kShortSnackBarDuration,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              smallVerticalSizedBox,
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: MyAfyaHubPrimaryButton(
                                  buttonKey: tryAgainButtonKey,
                                  text: tryAgainString,
                                  buttonColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  textStyle:
                                      normalSize14Text(AppColors.redColor),
                                  borderColor: Colors.transparent,
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    AppRoutes.phoneLogin,
                                  ),
                                ),
                              )
                            ],
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
