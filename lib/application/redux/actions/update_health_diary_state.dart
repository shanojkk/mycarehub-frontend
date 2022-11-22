// Flutter imports:

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/health_diary_state.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class UpdateHealthDiaryStateActon extends ReduxAction<AppState> {
  UpdateHealthDiaryStateActon({
    this.diaryEntries,
    this.errorFetchingDiaryEntries,
    this.timeoutFetchingEntries,
    this.shouldNotShareHealthRecord,
    this.shouldShareHealthRecord,
    this.quoteState,
    this.selectedFilter,
  });

  final List<HealthDiaryEntry?>? diaryEntries;
  final QuoteRelay? quoteState;
  final bool? errorFetchingDiaryEntries;
  final bool? timeoutFetchingEntries;
  final bool? shouldShareHealthRecord;
  final bool? shouldNotShareHealthRecord;
  final MoodTypeFilter? selectedFilter;

  @override
  AppState? reduce() {
    final HealthDiaryState diaryState = HealthDiaryState(
      entries: diaryEntries ?? state.clientState?.healthDiaryState?.entries,
      quoteState: quoteState ?? state.clientState?.healthDiaryState?.quoteState,
      errorFetchingDiaryEntries: errorFetchingDiaryEntries ??
          state.clientState?.healthDiaryState?.errorFetchingDiaryEntries,
      timeoutFetchingDiaryEntries: timeoutFetchingEntries ??
          state.clientState?.healthDiaryState?.timeoutFetchingDiaryEntries,
      shouldShareHealthRecord: shouldShareHealthRecord ??
          state.clientState?.healthDiaryState?.shouldShareHealthRecord,
      shouldNotShareHealthRecord: shouldNotShareHealthRecord ??
          state.clientState?.healthDiaryState?.shouldNotShareHealthRecord,
      selectedFilter:
          selectedFilter ?? state.clientState?.healthDiaryState?.selectedFilter,
    );

    final AppState newState = state.copyWith.call(
      clientState:
          state.clientState?.copyWith.call(healthDiaryState: diaryState),
    );

    return newState;
  }
}
