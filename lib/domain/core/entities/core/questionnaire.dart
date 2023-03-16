import 'package:pro_health_360/domain/core/entities/core/screening_question.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionnaire.freezed.dart';
part 'questionnaire.g.dart';

@freezed
class Questionnaire with _$Questionnaire {
  factory Questionnaire({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'questions') List<ScreeningQuestion?>? screeningQuestions,
  }) = _Questionnaire;

  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);

  factory Questionnaire.initial() => Questionnaire(
        id: UNKNOWN,
        active: false,
        name: UNKNOWN,
        description: UNKNOWN,
        screeningQuestions: <ScreeningQuestion?>[],
      );
}
