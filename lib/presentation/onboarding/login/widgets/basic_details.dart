import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

import 'package:myafyahub/application/redux/actions/update_bio_data_action.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

import 'package:myafyahub/domain/core/entities/login/basic_details_model.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_ui_components/platform_loader.dart';

class BasicDetails extends StatefulWidget {
  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateOfBirthTextController = TextEditingController();

  UserBasicDetails userBasicDetails = UserBasicDetails();

  @override
  void initState() {
    super.initState();
    BeWellFacebookEvents().logger.logEvent(name: 'view_basic_details_page');
  }

  Future<void> updateBioDataFunction(
      String? dateOfBirthFromState, Gender? genderFromState) async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      if (genderFromState == null &&
          userBasicDetails.gender.valueOrNull == null) {
        showFeedbackBottomSheet(
          context: context,
          modalContent: genderRequired,
          imageAssetPath: errorIconUrl,
        );
        return;
      }
      if (dateOfBirthFromState == null) {
        showFeedbackBottomSheet(
          context: context,
          modalContent: dobRequired,
          imageAssetPath: errorIconUrl,
        );
        return;
      }

      await StoreProvider.dispatch<AppState>(
        context,
        UpdateBioDataAction(
          flag: updateBasicDetailsFlag,
          context: context,
          userBasicDetails: userBasicDetails,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onBoardingStringsClass =
        OnboardingStrings.of(context)!;
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        /// get the values from state
        final String firstNameFromState = vm
            .appState.userProfileState!.userProfile!.userBioData!.firstName!
            .getValue();
        final String lastNameFromState = vm
            .appState.userProfileState!.userProfile!.userBioData!.lastName!
            .getValue();
        final Gender? genderFromState =
            vm.appState.userProfileState!.userProfile!.userBioData!.gender;
        final String? dateOfBirthFromState =
            vm.appState.userProfileState!.userProfile!.userBioData!.dateOfBirth;

        return Form(
          key: _formKey,
          child: Padding(
            padding: ResponsiveWidget.isLargeScreen(context)
                ? EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isLandscape(context: context)
                        ? 400
                        : 200.0,
                    vertical: 50)
                : const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// get names if null
                if (firstNameFromState == UNKNOWN ||
                    !vm.appState.wait!
                        .isWaitingFor(updateBasicDetailsFlag)) ...<Widget>[
                  Text(onBoardingStringsClass.firstNameRequiredText()),
                  mediumVerticalSizedBox,
                  SILFormTextField(
                    key: firstNameKey,
                    enabled:
                        !vm.appState.wait!.isWaitingFor(updateBasicDetailsFlag),
                    autoFocus: true,
                    labelText: firstNameLabel,
                    borderColor: Colors.white24,
                    validator: (dynamic value) {
                      if (value.toString().isEmpty) {
                        return firstNameRequiredString;
                      }
                      return null;
                    },
                    onSaved: (dynamic value) {
                      userBasicDetails.setUserProfileVariables(
                          value.toString().trim(), BasicDetailType.firstName);
                    },
                  ),
                  largeVerticalSizedBox,
                ],

                // last name
                if (lastNameFromState == UNKNOWN ||
                    !vm.appState.wait!
                        .isWaitingFor(updateBasicDetailsFlag)) ...<Widget>[
                  Text(onBoardingStringsClass.lastNameRequiredText()),
                  smallVerticalSizedBox,
                  SILFormTextField(
                    key: lastNameKey,
                    enabled:
                        !vm.appState.wait!.isWaitingFor(updateBasicDetailsFlag),
                    labelText: onBoardingStringsClass.lastNameText(),
                    borderColor: Colors.white24,
                    validator: (dynamic value) {
                      if (value.toString().isEmpty) {
                        return onBoardingStringsClass.lastNameRequiredText();
                      }
                      return null;
                    },
                    onSaved: (dynamic value) {
                      userBasicDetails.setUserProfileVariables(
                          value.toString().trim(), BasicDetailType.lastName);
                    },
                  ),
                ],

                /// get gender if null
                if (genderFromState == Gender.unknown ||
                    !vm.appState.wait!
                        .isWaitingFor(updateBasicDetailsFlag)) ...<Widget>[
                  largeVerticalSizedBox,
                  Text(onBoardingStringsClass.genderText()),
                  smallVerticalSizedBox,
                  SILSelectOptionField(
                    dropDownInputKey: genderOptionFieldKey,
                    hintText: onBoardingStringsClass.selectGenderText(),
                    value: userBasicDetails.gender.valueOrNull!.toString(),
                    // focusNode: _gender,
                    options: userBasicDetails.genderTypes,
                    retainOptionCase: false,
                    onChanged: (dynamic value) {
                      userBasicDetails.setUserProfileVariables(
                          value.toString(), BasicDetailType.gender);
                      setState(() {});
                    },
                    onSaved: (dynamic value) {
                      userBasicDetails.setUserProfileVariables(
                          value.toString().trim(), BasicDetailType.gender);
                    },
                  ),
                ],

                /// get dob if null
                if (dateOfBirthFromState == null ||
                    dateOfBirthFromState == UNKNOWN ||
                    !vm.appState.wait!
                        .isWaitingFor(updateBasicDetailsFlag)) ...<Widget>[
                  largeVerticalSizedBox,
                  Text(onBoardingStringsClass.dateOfBirthText()),
                  smallVerticalSizedBox,
                  SILDatePickerField(
                    controller: dateOfBirthTextController,
                    labelText: onBoardingStringsClass.selectDateOfBirthText(),
                    onSaved: (dynamic value) {
                      userBasicDetails.setUserProfileVariables(
                          value.toString(), BasicDetailType.dateOfBirth);
                    },
                  ),
                ],

                /// submit the data
                mediumVerticalSizedBox,
                if (vm.appState.wait!
                    .isWaitingFor(updateBasicDetailsFlag)) ...<Widget>[
                  const Center(child: SILPlatformLoader()),
                  size15VerticalSizedBox,
                ],

                if (!vm.appState.wait!.isWaitingFor(updateBasicDetailsFlag))
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: SILPrimaryButton(
                      buttonKey: primaryButtonKey,
                      onPressed: () => updateBioDataFunction(
                          dateOfBirthFromState, genderFromState),
                      buttonColor: Theme.of(context).accentColor,
                      text: onBoardingStringsClass.saveContinueText(),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
