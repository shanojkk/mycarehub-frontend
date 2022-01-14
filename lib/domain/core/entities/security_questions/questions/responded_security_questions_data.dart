// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/security_questions/questions/security_question.dart';

part 'responded_security_questions_data.freezed.dart';
part 'responded_security_questions_data.g.dart';

@freezed
class RespondedSecurityQuestionsData with _$RespondedSecurityQuestionsData {
  factory RespondedSecurityQuestionsData({
    @JsonKey(name: 'getUserRespondedSecurityQuestions')
        required List<SecurityQuestion> securityQuestions,
  }) = _RespondedSecurityQuestionsData;

  factory RespondedSecurityQuestionsData.fromJson(Map<String, dynamic> json) =>
      _$RespondedSecurityQuestionsDataFromJson(json);
}
