import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/phase_2/widgets/general_workstation_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class ClientCaregiverSelectionPage extends StatelessWidget {
  const ClientCaregiverSelectionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, AppStateViewModel>(
              converter: (Store<AppState> store) =>
                  AppStateViewModel.fromStore(store),
              builder: (BuildContext context, AppStateViewModel vm) {
                return Column(
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(workStationChooserImage),
                    ),
                    mediumVerticalSizedBox,
                    Text(
                      workStationChooserDescription(
                        vm.appState.clientState?.user?.firstName ?? '',
                      ),
                      style: boldSize20Text(AppColors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    largeVerticalSizedBox,
                    GeneralWorkstationWidget(
                      bodyWidget: Text(
                        proceedAsCaregiver,
                        style: normalSize14Text(
                          AppColors.unSelectedReactionIconColor,
                        ),
                      ),
                      onButtonCallback: () =>
                          Navigator.of(context).pushReplacementNamed(
                        AppRoutes.clientSelectionPageRoute,
                      ),
                      title: caregiver,
                      buttonText: proceed,
                    ),
                    mediumVerticalSizedBox,
                    GeneralWorkstationWidget(
                      bodyWidget: Text(
                        proceedAsClient,
                        style: normalSize14Text(
                          AppColors.unSelectedReactionIconColor,
                        ),
                      ),
                      onButtonCallback: () =>
                          Navigator.of(context).pushReplacementNamed(
                        AppRoutes.facilitySelectionPageRoute,
                      ),
                      title: client,
                      buttonText: proceed,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
