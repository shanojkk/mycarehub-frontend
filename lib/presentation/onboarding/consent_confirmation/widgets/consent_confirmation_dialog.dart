import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/logout_action.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/opt_out_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/shared_themes/constants.dart';

class ConsentConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              areYouReallySureTitle,
              style: boldSize20Text(AppColors.blackColor),
            ),
            size15VerticalSizedBox,
            Text(
              optOutMessage,
              style: normalSize15Text(AppColors.greyTextColor),
            ),
            mediumVerticalSizedBox,
            StoreConnector<AppState, AppStateViewModel>(
              converter: (Store<AppState> store) =>
                  AppStateViewModel.fromStore(store),
              builder: (BuildContext context, AppStateViewModel vm) {
                return vm.wait!.isWaitingFor(optOutFlag)
                    ? const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: PlatformLoader(),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: MyAfyaHubPrimaryButton(
                          buttonColor: Colors.red,
                          text: yesIam,
                          textStyle: boldSize16Text(AppColors.whiteColor),
                          textColor: AppColors.whiteColor,
                          onPressed: () {
                            StoreProvider.dispatch<AppState>(
                              context,
                              OptOutAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                onSuccess: () {
                                  StoreProvider.dispatch(
                                    context,
                                    LogoutAction(
                                      navigationCallback: () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                          AppRoutes.phoneLogin,
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                    ),
                                  );
                                },
                                onError: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getErrorMessage(
                                          optingOutString,
                                        ),
                                      ),
                                      duration: const Duration(
                                        seconds: kShortSnackBarDuration,
                                      ),
                                    ),
                                  );
                                  if (Navigator.canPop(context)) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
