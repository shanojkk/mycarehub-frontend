// Package imports:
import 'package:domain_objects/value_objects.dart';
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
    @JsonKey(name: 'mood') String? mood,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'entryType') String? entryType,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
  }) = _HealthDiaryEntry;

  factory HealthDiaryEntry.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryEntryFromJson(json);

  factory HealthDiaryEntry.initial() => HealthDiaryEntry(
        mood: UNKNOWN,
        note: UNKNOWN,
        entryType: UNKNOWN,
        createdAt: UNKNOWN,
        active: false,
      );
}