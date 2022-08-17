// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

part 'health_diary_state.freezed.dart';
part 'health_diary_state.g.dart';

@freezed
class HealthDiaryState with _$HealthDiaryState {
  factory HealthDiaryState({
    @JsonKey(name: 'getClientHealthDiaryEntries')
        List<HealthDiaryEntry?>? entries,
    QuoteRelay? quoteState,
    bool? errorFetchingDiaryEntries,
    bool? timeoutFetchingDiaryEntries,
    bool? shouldShareHealthRecord,
    bool? shouldNotShareHealthRecord,
    MoodTypeFilter? selectedFilter,
  }) = _HealthDiaryState;

  factory HealthDiaryState.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryStateFromJson(json);

  factory HealthDiaryState.initial() => HealthDiaryState(
        entries: <HealthDiaryEntry>[],
        quoteState: QuoteRelay.initial(),
        errorFetchingDiaryEntries: false,
        timeoutFetchingDiaryEntries: false,
        shouldShareHealthRecord: false,
        shouldNotShareHealthRecord: true,
        selectedFilter: MoodTypeFilter.ALL,
      );
}
