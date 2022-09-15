import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/phase_2/widgets/general_workstation_widget.dart';
import 'package:pro_health_360/phase_2/widgets/summary_badge_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class FacilitySelectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> facilities = <String>[
      'Aga Khan',
      'Nanyuki Hospital',
    ];

    final List<Widget> facilitiesWidgetList = <Widget>[];

    if (facilities.isNotEmpty) {
      for (final String facility in facilities) {
        facilitiesWidgetList.add(
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GeneralWorkstationWidget(
              title: facility,
              bodyWidget: Wrap(
                runSpacing: 12,
                spacing: 8,
                children: const <Widget>[
                  SummaryBadgeWidget(
                    title: '23 notifications',
                    iconUrl: notificationIcon,
                  ),
                  SummaryBadgeWidget(
                    title: '3 surveys',
                    iconUrl: surveyIcon,
                  ),
                  SummaryBadgeWidget(
                    title: '400 messages',
                    iconUrl: messageIcon,
                  ),
                  SummaryBadgeWidget(
                    title: '3 new articles',
                    iconUrl: pdfIcon,
                  ),
                ],
              ),
              buttonText: continueString,
            ),
          ),
        );
      }
    }

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
                    smallVerticalSizedBox,
                    Text(
                      welcomeFacilitySelectionDescription(
                        vm.appState.clientState?.user?.firstName ?? '',
                      ),
                      style: boldSize20Text(AppColors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                    Text(
                      noOfFacilitiesDescription('2'),
                      style: normalSize14Text(
                        AppColors.unSelectedReactionIconColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                    ...facilitiesWidgetList,
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