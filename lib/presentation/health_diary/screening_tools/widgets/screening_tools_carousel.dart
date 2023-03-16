// Flutter imports:
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/fetch_available_screening_tools_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/screening_tools/screening_tools_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

// Package imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class ScreeningToolsCarousel extends StatelessWidget {
  const ScreeningToolsCarousel();

  String getNextNavigationRoute(String toolName) {
    switch (toolName) {
      case 'TB Assessment':
        return AppRoutes.tuberculosisAssessmentPage;

      case 'Violence Assessment':
        return AppRoutes.violenceAssessmentPage;

      case 'Alcohol and Substance Assessment':
        return AppRoutes.alcoholSubstanceUsePage;

      default:
        return AppRoutes.contraceptiveAssessmentPage;
    }
  }

  Key getScreeningToolsButtonKey(String toolName) {
    switch (toolName) {
      case 'Violence Assessment':
        return violenceKey;

      case 'Alcohol and Substance Assessment':
        return alcoholUseKey;

      case 'TB Assessment':
        return tuberculosisKey;

      default:
        return contraceptiveKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScreeningToolsViewModel>(
      converter: (Store<AppState> store) {
        return ScreeningToolsViewModel.fromStore(store);
      },
      onInit: (Store<AppState> store) async {
        store.dispatch(
          FetchAvailableScreeningToolsAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
          ),
        );
      },
      builder: (BuildContext context, ScreeningToolsViewModel vm) {
        final int itemCount =
            vm.availableScreeningTools?.availableScreeningTools?.length ?? 0;

        return (vm.availableScreeningTools?.errorFetchingQuestions ?? false) ||
                (vm.availableScreeningTools?.timeoutFetchingQuestions ??
                    false || itemCount <= 0)
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              assessmentToolsTitle,
                              style:
                                  veryBoldSize16Text(AppColors.secondaryColor),
                            ),
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(verticalScrollIconSvgPath),
                                verySmallHorizontalSizedBox,
                                Text(
                                  scrollForMoreString,
                                  style: boldSize13Text(
                                    AppColors.greyTextColor.withOpacity(0.8),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        smallVerticalSizedBox,
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: itemCount,
                            itemBuilder: (BuildContext context, int index) {
                              final ScreeningTool screeningTool = vm
                                  .availableScreeningTools!
                                  .availableScreeningTools![index];

                              return HomePageCarouselItem(
                                type: HomePageCarouselItemType.SCREENING_TOOL,
                                title: screeningTool.questionnaire!.name!,
                                description:
                                    screeningTool.questionnaire!.description!,
                                onTap: () async {
                                  StoreProvider.dispatch(
                                    context,
                                    UpdateScreeningToolsState(
                                      selectedTool: screeningTool,
                                    ),
                                  );
                                  Navigator.of(context).pushNamed(
                                    getNextNavigationRoute(
                                      screeningTool.questionnaire?.name ?? '',
                                    ),
                                  );
                                  AnalyticsService().logEvent(
                                    name: viewScreeningToolEvent,
                                    eventType: AnalyticsEventType.NAVIGATION,
                                    parameters: <String, String>{
                                      'screeningToolType':
                                          screeningTool.questionnaire?.name ??
                                              ''
                                    },
                                  );
                                },
                                buttonTitle: beginString,
                                beginButtonKey: getScreeningToolsButtonKey(
                                  screeningTool.questionnaire?.name ?? '',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
