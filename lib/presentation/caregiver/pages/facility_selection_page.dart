// ignore_for_file: unused_import

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/redux/actions/fetch_facilities_action.dart';
import 'package:pro_health_360/application/redux/actions/set_client_default_facility_action.dart';
import 'package:pro_health_360/application/redux/actions/update_facility_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:pro_health_360/domain/core/entities/core/facility_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/general_workstation_widget.dart';
import 'package:pro_health_360/presentation/caregiver/widgets/summary_badge_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class FacilitySelectionPage extends StatelessWidget {
  const FacilitySelectionPage({super.key});

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
                  FetchFacilitiesAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              },
              builder: (BuildContext context, AppStateViewModel vm) {
                final FacilityState? facilityState =
                    vm.appState.clientState?.facilityState;
                final List<Facility?>? facilities = facilityState?.facilities;
                final List<Widget> facilitiesWidgetList = <Widget>[];

                if (facilities != null && facilities.isNotEmpty) {
                  for (final Facility? facility in facilities) {
                    final int messagesCount =
                        facility?.workStationDetails?.messages ?? 0;

                    final int notificationsCount =
                        facility?.workStationDetails?.notifications ?? 0;

                    final int surveysCount =
                        facility?.workStationDetails?.surveys ?? 0;

                    final int articlesCount =
                        facility?.workStationDetails?.articles ?? 0;

                    final List<Widget> badgesList = <Widget>[];
                    if (messagesCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title: '${messagesCount.toString()} messages',
                          iconUrl: messageIcon,
                        ),
                      );
                    }
                    if (notificationsCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title:
                              '${notificationsCount.toString()} notifications',
                          iconUrl: notificationIcon,
                        ),
                      );
                    }

                    if (surveysCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title: '${surveysCount.toString()} surveys',
                          iconUrl: surveyIcon,
                        ),
                      );
                    }

                    if (articlesCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title: '${surveysCount.toString()} articles',
                          iconUrl: pdfIcon,
                        ),
                      );
                    }
                    facilitiesWidgetList.add(
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GeneralWorkstationWidget(
                          title: facility?.name ?? '',
                          buttonText: continueString,
                          bodyWidget: Wrap(
                            runSpacing: 12,
                            spacing: 8,
                            children: badgesList,
                          ),
                          buttonWidget:
                              vm.wait!.isWaitingFor(setDefaultFacilityFlag)
                                  ? const PlatformLoader(color: whiteColor)
                                  : null,
                          onButtonCallback: () async {
                            await StoreProvider.dispatch(
                              context,
                              SetClientDefaultFacilityAction(
                                facility: facility!,
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.home,
                              (Route<dynamic> route) => false,
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
                                ...facilitiesWidgetList,
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
