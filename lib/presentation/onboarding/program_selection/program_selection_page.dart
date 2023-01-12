import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/programs/list_user_programs_action.dart';
import 'package:pro_health_360/application/redux/actions/programs/set_current_program_action.dart';
import 'package:pro_health_360/application/redux/states/program_state.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';
import 'package:pro_health_360/presentation/onboarding/program_selection/widgets/program_card_widget.dart';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ProgramSelectionPage extends StatelessWidget {
  const ProgramSelectionPage({super.key});

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
              onInit: (Store<AppState> store) async {
                await store.dispatch(
                  ListUserProgramsAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              },
              builder: (BuildContext context, AppStateViewModel vm) {
                final ProgramState? programState =
                    vm.appState.onboardingState?.programState;
                final List<Program?>? programs = programState?.programs;
                final List<Widget> programsWidgetList = <Widget>[];

                if (programs != null && programs.isNotEmpty) {
                  for (final Program? program in programs) {
                    programsWidgetList.add(
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ProgramCardWidget(
                          programName: program?.name ?? '',
                          organizationName: program?.organization?.name ?? '',
                          buttonText: continueString,
                          buttonWidget:
                              vm.wait!.isWaitingFor(setDefaultFacilityFlag)
                                  ? const PlatformLoader(color: whiteColor)
                                  : null,
                          onButtonCallback: () async {
                            await StoreProvider.dispatch(
                              context,
                              SetCurrentProgramAction(
                                programId: program?.id ?? '',
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                onFailure: (String message) {
                                  // TODO(Byron): Add logic here
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }

                if (vm.wait!.isWaitingFor(fetchFacilitiesFlag)) {
                  return Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    child: const PlatformLoader(),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Center(
                        child: SvgPicture.asset(hospitalBuildingImage),
                      ),
                      smallVerticalSizedBox,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if (vm.wait!.isWaitingFor(setDefaultFacilityFlag))
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  switchingYourFacility,
                                  style: boldSize18Text(),
                                  textAlign: TextAlign.center,
                                ),
                                smallVerticalSizedBox,
                                const SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: PlatformLoader(),
                                  ),
                                )
                              ],
                            )
                          else
                            Column(
                              children: <Widget>[
                                Text(
                                  welcomeFacilitySelectionDescription,
                                  style: boldSize20Text(AppColors.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                                smallVerticalSizedBox,
                                Text(
                                  noOfFacilitiesDescription,
                                  style: normalSize14Text(
                                    AppColors.unSelectedReactionIconColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                smallVerticalSizedBox,
                                ...programsWidgetList,
                              ],
                            )
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
