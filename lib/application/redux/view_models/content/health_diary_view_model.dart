// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class HealthDiaryViewModel extends Vm {
  HealthDiaryViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.diaryEntries,
    this.selectedFilter,
    required this.quotes,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            diaryEntries,
            quotes,
            selectedFilter,
          ],
        );

  factory HealthDiaryViewModel.fromStore(AppState state) {
    return HealthDiaryViewModel(
      wait: state.wait,
      selectedFilter: state.clientState!.healthDiaryState?.selectedFilter,
      errorFetchingContent:
          state.clientState!.healthDiaryState?.errorFetchingDiaryEntries ??
              false,
      timeoutFetchingContent:
          state.clientState!.healthDiaryState?.timeoutFetchingDiaryEntries ??
              false,
      diaryEntries:
          state.clientState!.healthDiaryState?.entries ?? <HealthDiaryEntry>[],
      quotes:
          state.clientState!.healthDiaryState?.quoteState?.quotes ?? <Quote>[],
    );
  }

  final List<HealthDiaryEntry?>? diaryEntries;
  final bool? errorFetchingContent;
  final List<Quote> quotes;
  final bool? timeoutFetchingContent;
  final Wait? wait;
  final MoodTypeFilter? selectedFilter;
}
