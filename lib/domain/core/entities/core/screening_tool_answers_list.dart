import 'package:pro_health_360/domain/core/entities/core/screening_tool_answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_tool_answers_list.freezed.dart';
part 'screening_tool_answers_list.g.dart';

@freezed
class ScreeningToolAnswersList with _$ScreeningToolAnswersList {
  factory ScreeningToolAnswersList({
    @JsonKey(name: 'questionResponses') List<ScreeningToolAnswer?>? answersList,
  }) = _ScreeningToolAnswersList;

  factory ScreeningToolAnswersList.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolAnswersListFromJson(json);

  factory ScreeningToolAnswersList.initial() => ScreeningToolAnswersList(
        answersList: <ScreeningToolAnswer?>[],
      );
}
