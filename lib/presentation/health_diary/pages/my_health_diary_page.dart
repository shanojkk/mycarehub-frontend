import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/fetch_health_diary_action.dart';
import 'package:pro_health_360/application/redux/actions/update_health_diary_state.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/content/health_diary_view_model.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/entities/home/bottom_nav_items.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:pro_health_360/presentation/health_diary/pages/empty_health_diary.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/health_diary_entry_widget.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/health_diary_filter_widget.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class MyHealthDiaryPage extends StatefulWidget {
  const MyHealthDiaryPage();

  @override
  State<MyHealthDiaryPage> createState() => _MyHealthDiaryPageState();
}

class _MyHealthDiaryPageState extends State<MyHealthDiaryPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await StoreProvider.dispatch<AppState>(
        context,
        UpdateHealthDiaryStateActon(
          selectedFilter: MoodTypeFilter.ALL,
        ),
      );
      await StoreProvider.dispatch<AppState>(
        context,
        FetchHealthDiaryAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: 3,
      appBar: CustomAppBar(
        title: myHealthDiaryString,
        leadingWidget: SvgPicture.asset(
          backIconPath,
          color: AppColors.secondaryColor,
        ),
        bottomNavIndex: 3,
      ),
      body: StoreConnector<AppState, HealthDiaryViewModel>(
        converter: (Store<AppState> store) =>
            HealthDiaryViewModel.fromStore(store.state),
        builder: (BuildContext context, HealthDiaryViewModel vm) {
          final List<Widget> filters = <Widget>[];
          final List<Widget> diaryEntries = <Widget>[];
          final List<HealthDiaryEntry?>? entries = vm.diaryEntries;
          final MoodTypeFilter? selectedMood = vm.selectedFilter;

          for (final MoodTypeFilter mood in MoodTypeFilter.values) {
            final bool isSelected = vm.selectedFilter == mood;
            filters.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomChipWidget(
                  title: mood.name,
                  gestureKey: Key(mood.name),
                  isSelected: isSelected,
                  onTap: () async {
                    await StoreProvider.dispatch(
                      context,
                      UpdateHealthDiaryStateActon(
                        selectedFilter: mood,
                      ),
                    );
                    StoreProvider.dispatch(
                      context,
                      FetchHealthDiaryAction(
                        client: AppWrapperBase.of(context)!.graphQLClient,
                        filter: (mood.value == MoodTypeFilter.ALL.value)
                            ? null
                            : mood.value,
                      ),
                    );
                  },
                ),
              ),
            );
          }

          if (entries?.isNotEmpty ?? false) {
            for (int i = 0; i < entries!.length; i++) {
              diaryEntries.add(
                HealthDiaryEntryWidget(
                  diaryEntry: entries[i]!,
                  index: i,
                ),
              );
            }
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                HealthDiaryFiltersWidget(filters: filters),
                Flexible(
                  child: RefreshIndicator(
                    child: SingleChildScrollView(
                      key: healthDiaryListKey,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          if (vm.wait!.isWaitingFor(fetchHealthDiaryFlag))
                            Container(
                              height: 300,
                              padding: const EdgeInsets.all(20),
                              child: const PlatformLoader(),
                            )
                          else if (vm.timeoutFetchingContent ?? false)
                            const GenericTimeoutWidget(
                              route: AppRoutes.home,
                              action: 'fetching your diary',
                            )
                          else if (vm.errorFetchingContent ?? false)
                            GenericErrorWidget(
                              actionKey: helpNoDataWidgetKey,
                              recoverCallback: () async {
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  FetchHealthDiaryAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                  ),
                                );
                              },
                              messageBody: const <TextSpan>[
                                TextSpan(text: healthDiaryErrorDetail)
                              ],
                            )
                          else if (vm.diaryEntries?.isEmpty ?? true)
                            EmptyHealthDiary(
                              refreshCallback: () => navigateToNewPage(
                                route: AppRoutes.home,
                                context: context,
                                bottomNavIndex: BottomNavIndex.home.index,
                              ),
                            )
                          else
                            ...diaryEntries
                        ],
                      ),
                    ),
                    onRefresh: () async {
                      StoreProvider.dispatch(
                        context,
                        FetchHealthDiaryAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          filter: selectedMood?.value,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
