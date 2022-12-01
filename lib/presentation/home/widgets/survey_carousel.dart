import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/redux/actions/surveys/fetch_available_surveys_action.dart';
import 'package:pro_health_360/application/redux/actions/update_misc_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/misc_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

class SurveyCarousel extends StatelessWidget {
  const SurveyCarousel();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) {
        return AppStateViewModel.fromStore(store);
      },
      onInit: (Store<AppState> store) async {
        store.dispatch(
          FetchAvailableSurveysAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
          ),
        );
      },
      builder: (BuildContext context, AppStateViewModel state) {
        final MiscState miscState = state.appState.miscState!;
        if (miscState.availableSurveysList?.isEmpty ?? true) {
          return const SizedBox();
        }
        return Column(
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
                        surveys,
                        style: veryBoldSize16Text(AppColors.secondaryColor),
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
                      cacheExtent: 4,
                      itemCount: miscState.availableSurveysList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HomePageCarouselItem(
                          type: HomePageCarouselItemType.SURVEY,
                          title: miscState.availableSurveysList![index].title!,
                          description: '',
                          onTap: () async {
                            final String encodedUrl = Uri.encodeFull(
                              miscState.availableSurveysList![index].link!,
                            );
                            StoreProvider.dispatch(
                              context,
                              UpdateMiscStateAction(
                                selectedSurvey:
                                    miscState.availableSurveysList![index],
                              ),
                            );
                            await AnalyticsService().logEvent(
                              name: viewSurveyEvent,
                              eventType: AnalyticsEventType.NAVIGATION,
                              parameters: <String, dynamic>{
                                'surveyTitle':
                                    miscState.availableSurveysList![index].title
                              },
                            );
                            Navigator.of(context).pushNamed(
                              AppRoutes.customWebviewPage,
                              arguments: <String, dynamic>{
                                'url': encodedUrl,
                                'appBarTitle': surveys
                              },
                            );
                          },
                          beginButtonKey: phq9surveyKey,
                          buttonTitle: respondString,
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
