import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/check_if_new_user_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/widgets/bewell_scaffold.dart';
import 'package:myafyahub/presentation/onboarding/widgets/scaffold_header.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:sms_autofill/sms_autofill.dart';

/// [PhoneSignUp] page avails inputs for phone number and allow communications checkbox
/// the continue button on this page navigates the user to the verify OTP page
///

class CreateAccountPage extends StatefulWidget {
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  String? appSignature;

  void getAppSignature() {
    SmsAutoFill()
        .getAppSignature
        .then((String signature) => appSignature = signature);
  }

  @override
  void initState() {
    super.initState();
    BeWellFacebookEvents().logger.logEvent(name: 'view_create_account_page');

    /// clear any active flags
    clearAllFlags(context);

    // listen for appSignature
    getAppSignature();
  }

  @override
  void didChangeDependencies() {
    if (signUpPhoneNumber == null) {
      /// reset signup state upon entering this page
      StoreProvider.dispatch(
        context,
        PhoneSignUpStateAction(accountExists: false),
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    phoneNumberInputController.dispose();
    super.dispose();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateAccountPageState';
  }

  final TextEditingController phoneNumberInputController =
      TextEditingController();

  String? signUpPhoneNumber;
  bool communicationsAccepted = false;
  Function phoneSignUpFunction(OnboardingStrings strings) {
    return () async {
      if (signUpPhoneNumber == null ||
          !validatePhoneNumber(signUpPhoneNumber!)) {
        showFeedbackBottomSheet(
          context: context,
          modalContent: strings.phoneRequiredText(),
          imageAssetPath: errorIconUrl,
        );
        return;
      }

      if (!communicationsAccepted) {
        showFeedbackBottomSheet(
          context: context,
          modalContent: strings.communicationPermRequiredText(),
          imageAssetPath: errorIconUrl,
        );
        return;
      }

      await StoreProvider.dispatch(
        context,
        PhoneSignUpStateAction(
            phoneNumber: signUpPhoneNumber,
            acceptCommunicationTerms: communicationsAccepted),
      );

      await StoreProvider.dispatch<AppState>(
        context,
        CheckIfNewUserAction(
          context: context,
          flag: phoneNumberEntryFlag,
          appSignature: appSignature ?? testAppSignature,
        ),
      );
    };
  }

  void phoneNumberUsageBottomSheetCallback() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;
    return BeWellScaffold(
      gradient: defaultGradient(Theme.of(context).primaryColor),
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 180,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: preferredPaddingOnStretchedScreens(context: context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ScaffoldHeader(
                      title: onboardingStrings.gladToMeetYouText(),
                      description:
                          onboardingStrings.createAccountWithPhoneText(),
                      backFunc: () {
                        Navigator.pushReplacementNamed(
                            context, BWRoutes.landing);
                      },
                    ),
                    veryLargeVerticalSizedBox,
                    veryLargeVerticalSizedBox,
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8)),
                      child: SILPhoneInput(
                        phoneNumberFormatter: formatPhoneNumber,
                        inputController: phoneNumberInputController,
                        labelText: onboardingStrings.phoneNumberText(),
                        labelStyle: TextThemes.boldSize16Text(),
                        onChanged: (String? value) {
                          if (vm
                              .appState.miscState!.phoneSignUp!.accountExists) {
                            StoreProvider.dispatch(context,
                                PhoneSignUpStateAction(accountExists: false));
                          }
                          setState(() {
                            signUpPhoneNumber = value?.toString();
                          });
                        },
                      ),
                    ),
                    mediumVerticalSizedBox,
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //CheckBox
                    SILCheckbox(
                      checkboxKey: phoneSignUpCheckboxKey,
                      value: communicationsAccepted,
                      text: onboardingStrings.allowPhoneNumberUsageText(),
                      onChanged: (dynamic value) {
                        communicationsAccepted = value as bool;
                        setState(() {});
                      },
                      child: RichText(
                        text: TextSpan(
                          text: onboardingStrings.allowPhoneNumberUsageText(),
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(
                              text: checkBoxActionText,
                              style: const TextStyle(
                                  color: AppColors.whiteColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = showPhoneNoUsage(context,
                                        phoneNumberUsageBottomSheetCallback)
                                    as void Function()?,
                            )
                          ],
                        ),
                      ),
                    ),

                    mediumVerticalSizedBox,
                    if (vm.appState.wait!
                        .isWaitingFor(phoneNumberEntryFlag)) ...<Widget>[
                      const Center(
                        child: SILPlatformLoader(),
                      ),
                    ],

                    if (!vm.appState.wait!.isWaitingFor(phoneNumberEntryFlag))
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: SILPrimaryButton(
                          buttonKey: enterSignUpNumberButtonKey,
                          onPressed: phoneSignUpFunction(onboardingStrings)
                              as void Function()?,
                          buttonColor: (signUpPhoneNumber == null ||
                                  !validatePhoneNumber(signUpPhoneNumber!) ||
                                  !communicationsAccepted)
                              ? Colors.grey[200]
                              : Theme.of(context).primaryColor,
                          textColor: (signUpPhoneNumber == null ||
                                  !validatePhoneNumber(signUpPhoneNumber!) ||
                                  !communicationsAccepted)
                              ? Colors.grey[400]
                              : AppColors.whiteColor,
                          borderColor: Colors.transparent,
                          text: onboardingStrings.continueText(),
                        ),
                      ),
                    mediumVerticalSizedBox,
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
