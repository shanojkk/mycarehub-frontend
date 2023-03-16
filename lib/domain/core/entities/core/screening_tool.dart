import 'package:pro_health_360/domain/core/entities/core/questionnaire.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_tool.freezed.dart';
part 'screening_tool.g.dart';

@freezed
class ScreeningTool with _$ScreeningTool {
  factory ScreeningTool({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'questionnaireID') String? questionnaireId,
    @JsonKey(name: 'threshold') int? threshold,
    @JsonKey(name: 'questionnaire') Questionnaire? questionnaire,
  }) = _ScreeningTool;

  factory ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolFromJson(json);

  factory ScreeningTool.initial() => ScreeningTool(
        id: UNKNOWN,
        questionnaireId: UNKNOWN,
        threshold: 0,
        questionnaire: Questionnaire.initial(),
      );
}
