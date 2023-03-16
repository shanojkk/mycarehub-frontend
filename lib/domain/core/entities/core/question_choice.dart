import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_choice.freezed.dart';
part 'question_choice.g.dart';

@freezed
class QuestionChoice with _$QuestionChoice {
  factory QuestionChoice({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'questionID') String? questionId,
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'choice') String? choice,
    @JsonKey(name: 'score') int? score,
  }) = _QuestionChoice;

  factory QuestionChoice.fromJson(Map<String, dynamic> json) =>
      _$QuestionChoiceFromJson(json);

  factory QuestionChoice.initial() => QuestionChoice(
        id: UNKNOWN,
        active: false,
        questionId: UNKNOWN,
        value: UNKNOWN,
        choice: UNKNOWN,
        score: 0,
      );
}
