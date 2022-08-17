// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthDiaryState _$$_HealthDiaryStateFromJson(Map<String, dynamic> json) =>
    _$_HealthDiaryState(
      entries: (json['getClientHealthDiaryEntries'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HealthDiaryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      quoteState: json['quoteState'] == null
          ? null
          : QuoteRelay.fromJson(json['quoteState'] as Map<String, dynamic>),
      errorFetchingDiaryEntries: json['errorFetchingDiaryEntries'] as bool?,
      timeoutFetchingDiaryEntries: json['timeoutFetchingDiaryEntries'] as bool?,
      shouldShareHealthRecord: json['shouldShareHealthRecord'] as bool?,
      shouldNotShareHealthRecord: json['shouldNotShareHealthRecord'] as bool?,
      selectedFilter:
          $enumDecodeNullable(_$MoodTypeFilterEnumMap, json['selectedFilter']),
    );

Map<String, dynamic> _$$_HealthDiaryStateToJson(_$_HealthDiaryState instance) =>
    <String, dynamic>{
      'getClientHealthDiaryEntries': instance.entries,
      'quoteState': instance.quoteState,
      'errorFetchingDiaryEntries': instance.errorFetchingDiaryEntries,
      'timeoutFetchingDiaryEntries': instance.timeoutFetchingDiaryEntries,
      'shouldShareHealthRecord': instance.shouldShareHealthRecord,
      'shouldNotShareHealthRecord': instance.shouldNotShareHealthRecord,
      'selectedFilter': _$MoodTypeFilterEnumMap[instance.selectedFilter],
    };

const _$MoodTypeFilterEnumMap = {
  MoodTypeFilter.ALL: 'ALL',
  MoodTypeFilter.VERY_HAPPY: 'VERY_HAPPY',
  MoodTypeFilter.HAPPY: 'HAPPY',
  MoodTypeFilter.NEUTRAL: 'NEUTRAL',
  MoodTypeFilter.SAD: 'SAD',
  MoodTypeFilter.VERY_SAD: 'VERY_SAD',
};
