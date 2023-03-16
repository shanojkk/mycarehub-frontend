import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_tool_answer.freezed.dart';
part 'screening_tool_answer.g.dart';

@freezed
class ScreeningToolAnswer with _$ScreeningToolAnswer {
  factory ScreeningToolAnswer({
    @JsonKey(name: 'questionID') String? questionId,
    @JsonKey(name: 'response') String? response,
  }) = _ScreeningToolAnswer;

  factory ScreeningToolAnswer.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolAnswerFromJson(json);

  factory ScreeningToolAnswer.initial() => ScreeningToolAnswer(
        questionId: UNKNOWN,
        response: UNKNOWN,
      );
}
