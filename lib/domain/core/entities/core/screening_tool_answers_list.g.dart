// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tool_answers_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningToolAnswersList _$$_ScreeningToolAnswersListFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningToolAnswersList(
      answersList: (json['questionResponses'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScreeningToolAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScreeningToolAnswersListToJson(
        _$_ScreeningToolAnswersList instance) =>
    <String, dynamic>{
      'questionResponses': instance.answersList,
    };
