// Flutter imports:
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/client_profile_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class UserDetailsCard extends StatelessWidget {
  /// [UserDetailsCard] is a shared widget used in [UserProfilePage]

  const UserDetailsCard();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientProfileViewModel>(
      converter: (Store<AppState> store) =>
          ClientProfileViewModel.fromStore(store),
      builder: (BuildContext context, ClientProfileViewModel vm) {
        final User? user = vm.clientState?.clientProfile?.user;
        final String phone = user?.primaryContact?.value ?? phoneNotRecorded;
        final String name = getDisplayName(user);
        final String cccNumber =
            vm.clientState?.clientProfile?.cccNumber ?? UNKNOWN;
        final String nickName =
            vm.clientState?.clientProfile?.user?.username ?? '';
        final String hospitalName =
            vm.clientState?.facilityState?.currentFacility?.name ?? '';
        final String programName = StoreProvider.state<AppState>(context)
                ?.onboardingState
                ?.programState
                ?.currentProgram
                ?.name ??
            '';

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.whiteColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.1),
                    ),
                    child: Text(
                      extractNamesInitials(name: name),
                      style: const TextStyle(
                        fontSize: 22,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  mediumHorizontalSizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: const TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          phone,
                          style: const TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          hospitalName,
                          style: const TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              smallVerticalSizedBox,
              const Divider(),
              smallVerticalSizedBox,
              const Text(
                yourInformation,
                style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              size15VerticalSizedBox,
              RichText(
                text: TextSpan(
                  text: 'CCC Number: ',
                  style: normalSize14Text(AppColors.greyTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: cccNumber,
                      style: veryHeavySize14Text(AppColors.greyTextColor),
                    )
                  ],
                ),
              ),
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  text: 'Nickname: ',
                  style: normalSize14Text(AppColors.greyTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: nickName,
                      style: veryHeavySize14Text(AppColors.greyTextColor),
                    )
                  ],
                ),
              ),
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  text: 'Selected program: ',
                  style: normalSize14Text(AppColors.greyTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: programName,
                      style: veryHeavySize14Text(AppColors.greyTextColor),
                    )
                  ],
                ),
              ),
              smallVerticalSizedBox,
              const Divider(),
              smallVerticalSizedBox,
              Text(
                yourCurrentHospitalDescription('hospitalName'),
                style: normalSize14Text(
                  AppColors.unSelectedReactionIconColor,
                ),
              ),
              size15VerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: changeFacilityKey,
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.facilitySelectionPageRoute,
                      (Route<dynamic> route) => false,
                    );
                  },
                  text: changeMyFacility,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
