// Package imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_diary_entry.freezed.dart';
part 'health_diary_entry.g.dart';

@freezed
class HealthDiaryEdge with _$HealthDiaryEdge {
  factory HealthDiaryEdge({
    @JsonKey(name: 'getClientHealthDiaryEntries')
        List<HealthDiaryEntry>? entries,
  }) = _HealthDiaryEdge;

  factory HealthDiaryEdge.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryEdgeFromJson(json);
}

@freezed
class HealthDiaryEntry with _$HealthDiaryEntry {
  factory HealthDiaryEntry({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'mood') String? mood,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'entryType') String? entryType,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'sharedAt') String? sharedAt,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
        bool? shareWithHealthWorker,
  }) = _HealthDiaryEntry;

  factory HealthDiaryEntry.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryEntryFromJson(json);

  factory HealthDiaryEntry.initial() => HealthDiaryEntry(
        mood: UNKNOWN,
        note: UNKNOWN,
        entryType: UNKNOWN,
        createdAt: UNKNOWN,
        active: false,
        id: UNKNOWN,
        shareWithHealthWorker: false,
        sharedAt:
            DateTime.now().subtract(const Duration(minutes: 10)).toString(),
      );
}
