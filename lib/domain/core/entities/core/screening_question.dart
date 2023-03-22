import 'package:pro_health_360/domain/core/entities/core/question_choice.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_question.freezed.dart';
part 'screening_question.g.dart';

@freezed
class ScreeningQuestion with _$ScreeningQuestion {
  factory ScreeningQuestion({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'text') String? questionText,
    @JsonKey(name: 'questionType') QuestionType? questionType,
    @JsonKey(name: 'responseValueType')
        QuestionResponseValueType? responseValueType,
    @JsonKey(name: 'required') bool? required,
    @JsonKey(name: 'selectMultiple') bool? selectMultiple,
    @JsonKey(name: 'sequence') int? sequence,
    @JsonKey(name: 'choices') List<QuestionChoice?>? choices,
  }) = _ScreeningQuestion;

  factory ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$ScreeningQuestionFromJson(json);

  factory ScreeningQuestion.initial() => ScreeningQuestion(
        id: UNKNOWN,
        active: false,
        questionText: UNKNOWN,
        required: false,
        selectMultiple: false,
        sequence: 0,
        choices: <QuestionChoice>[],
      );
}
