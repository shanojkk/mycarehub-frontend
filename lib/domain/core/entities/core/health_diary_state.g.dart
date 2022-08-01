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
          $enumDecodeNullable(_$MoodTypeEnumMap, json['selectedFilter']),
    );

Map<String, dynamic> _$$_HealthDiaryStateToJson(_$_HealthDiaryState instance) =>
    <String, dynamic>{
      'getClientHealthDiaryEntries': instance.entries,
      'quoteState': instance.quoteState,
      'errorFetchingDiaryEntries': instance.errorFetchingDiaryEntries,
      'timeoutFetchingDiaryEntries': instance.timeoutFetchingDiaryEntries,
      'shouldShareHealthRecord': instance.shouldShareHealthRecord,
      'shouldNotShareHealthRecord': instance.shouldNotShareHealthRecord,
      'selectedFilter': _$MoodTypeEnumMap[instance.selectedFilter],
    };

const _$MoodTypeEnumMap = {
  MoodType.VERY_HAPPY: 'VERY_HAPPY',
  MoodType.HAPPY: 'HAPPY',
  MoodType.NEUTRAL: 'NEUTRAL',
  MoodType.SAD: 'SAD',
  MoodType.VERY_SAD: 'VERY_SAD',
};
