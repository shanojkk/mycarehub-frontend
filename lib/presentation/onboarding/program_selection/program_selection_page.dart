import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/programs/list_user_programs_action.dart';
import 'package:pro_health_360/application/redux/actions/programs/set_current_program_action.dart';
import 'package:pro_health_360/application/redux/actions/update_program_state_action.dart';
import 'package:pro_health_360/application/redux/states/program_state.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/widgets/logout_button.dart';
import 'package:pro_health_360/presentation/onboarding/program_selection/widgets/program_card_widget.dart';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class ProgramSelectionPage extends StatelessWidget {
  final IGraphQlClient? graphQlClient;

  const ProgramSelectionPage({super.key, this.graphQlClient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: StoreConnector<AppState, AppStateViewModel>(
                    converter: (Store<AppState> store) =>
                        AppStateViewModel.fromStore(store),
                    onInit: (Store<AppState> store) async {
                      await store.dispatch(
                        ListUserProgramsAction(
                          client: getCustomClient(
                            context: context,
                            graphQlClient: graphQlClient,
                          ),
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
                                organizationName:
                                    program?.organization?.name ?? '',
                                buttonText: continueString,
                                buttonWidget: vm.wait!
                                        .isWaitingFor(setCurrentProgramFlag)
                                    ? const PlatformLoader(color: whiteColor)
                                    : null,
                                onButtonCallback: () async {
                                  StoreProvider.dispatch(
                                    context,
                                    UpdateProgramStateAction(
                                      currentProgram: program,
                                    ),
                                  );
                                  await StoreProvider.dispatch(
                                    context,
                                    SetCurrentProgramAction(
                                      programId: program?.id ?? '',
                                      client: getCustomClient(
                                        context: context,
                                        graphQlClient: graphQlClient,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      }

                      if (vm.wait!.isWaitingFor(fetchProgramsFlag)) {
                        return Container(
                          height: 300,
                          padding: const EdgeInsets.all(20),
                          child: const PlatformLoader(),
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            Center(
                              child: SvgPicture.asset(programSelectionImage),
                            ),
                            smallVerticalSizedBox,
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                if (vm.wait!
                                    .isWaitingFor(setCurrentProgramFlag))
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        switchingYourProgram,
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
                                        selectProgram,
                                        style: boldSize20Text(
                                          AppColors.primaryColor,
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
              const LogoutButton(key: logoutButtonKey)
            ],
          ),
        ),
      ),
    );
  }
}
