// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/set_nickname_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/client_profile_view_model.dart';
import 'package:pro_health_360/domain/core/entities/profile/edit_information_item.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/personal_information_widget.dart';
import 'package:pro_health_360/presentation/profile/widgets/edit_info_button_widget.dart';

/// [SettingsPage] is used to display the client's settings
///
/// the nickname will be accessed from the state
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: settingsPageTitle),
      body: SafeArea(
        child: StoreConnector<AppState, ClientProfileViewModel>(
          converter: (Store<AppState> store) =>
              ClientProfileViewModel.fromStore(store),
          builder: (BuildContext context, ClientProfileViewModel vm) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        largeVerticalSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nickNameString,
                              style: boldSize15Text(
                                AppColors.secondaryColor,
                              ),
                            ),
                            EditInformationButtonWidget(
                              editInformationItem: nickNameEditInfo(
                                vm.clientState?.clientProfile?.user?.username ??
                                    UNKNOWN,
                              ),
                              submitFunction:
                                  (EditInformationItem editInformationItem) {
                                final String newNickname = editInformationItem
                                    .editInformationInputItem[0]
                                    .inputController
                                    .text;

                                ///Set username/NickName to the new nickname
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  UpdateOnboardingStateAction(
                                    nickName: newNickname,
                                  ),
                                );

                                StoreProvider.dispatch<AppState>(
                                  context,
                                  SetNicknameAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    flag: editInformationFlag,
                                    shouldNavigate: false,
                                    onSuccess: () {
                                      showTextSnackbar(
                                        ScaffoldMessenger.of(context),
                                        content: nicknameSuccessString,
                                      );
                                    },
                                    onError: (String error) {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        UpdateUserProfileAction(
                                          nickName: vm
                                                  .clientState
                                                  ?.clientProfile
                                                  ?.user
                                                  ?.username ??
                                              '',
                                        ),
                                      );

                                      showTextSnackbar(
                                        ScaffoldMessenger.of(context),
                                        content: error,
                                      );
                                    },
                                  ),
                                );

                                ///Will return to the previous page after submitting
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        smallVerticalSizedBox,
                        PersonalInformationWidget(
                          description:
                              vm.clientState?.clientProfile?.user?.username ??
                                  UNKNOWN,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text(
                        copyrightDescriptionString,
                        style: normalSize10Text(Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
