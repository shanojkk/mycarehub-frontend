import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/redux/actions/caregiver/fetch_managed_clients_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/phase_2/widgets/general_workstation_widget.dart';
import 'package:pro_health_360/phase_2/widgets/summary_badge_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class ClientSelectionPage extends StatelessWidget {
  const ClientSelectionPage();

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
                  FetchManagedClientsAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              },
              builder: (BuildContext context, AppStateViewModel vm) {
                final List<ManagedClient>? managedClients =
                    vm.appState.caregiverState?.managedClients;
                final List<Widget> clientWidgets = <Widget>[];
                if (managedClients?.isNotEmpty ?? false) {
                  for (final ManagedClient client in managedClients!) {
                    clientWidgets.add(
                      Column(
                        children: <Widget>[
                          GeneralWorkstationWidget(
                            title: client.user?.name ?? '',
                            bodyWidget: Wrap(
                              runSpacing: 12,
                              spacing: 8,
                              children: <Widget>[
                                if ((client.workStationDetails?.notifications ??
                                        0) >
                                    0)
                                  SummaryBadgeWidget(
                                    title:
                                        '${client.workStationDetails!.notifications.toString()} ${notificationsText.toLowerCase()}',
                                    iconUrl: notificationIcon,
                                  ),
                                if ((client.workStationDetails?.surveys ?? 0) >
                                    0)
                                  SummaryBadgeWidget(
                                    title:
                                        '${client.workStationDetails!.surveys.toString()} ${surveys.toLowerCase()}',
                                    iconUrl: surveyIcon,
                                  ),
                              ],
                            ),
                            buttonText: continueString,
                            onButtonCallback: () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.home,
                              (Route<dynamic> route) => false,
                            ),
                          ),
                          smallVerticalSizedBox,
                        ],
                      ),
                    );
                  }
                }

                return Column(
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(workStationChooserImage),
                    ),
                    mediumVerticalSizedBox,
                    if (vm.wait!.isWaitingFor(fetchManagedClientsFlag))
                      const Center(child: PlatformLoader())
                    else if (vm.appState.caregiverState?.errorFetchingClients ??
                        false)
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        recoverCallback: () {
                          StoreProvider.dispatch<AppState>(
                            context,
                            FetchManagedClientsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                            ),
                          );
                        },
                        messageTitle: messageTitleGenericErrorWidget,
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: getErrorMessage(fetchingPatientsString),
                            style: normalSize16Text(AppColors.greyTextColor),
                          ),
                        ],
                      )
                    else ...<Widget>{
                      Text(
                        clientSelectionTitle(
                          vm.appState.clientState?.user?.firstName ?? '',
                        ),
                        style: boldSize20Text(AppColors.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      mediumVerticalSizedBox,
                      Text(
                        clientSelectionDescription('2'),
                        style: normalSize14Text(
                          AppColors.unSelectedReactionIconColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      mediumVerticalSizedBox,
                      ...clientWidgets,
                    }
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
