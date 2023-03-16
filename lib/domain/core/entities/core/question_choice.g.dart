// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionChoice _$$_QuestionChoiceFromJson(Map<String, dynamic> json) =>
    _$_QuestionChoice(
      id: json['id'] as String?,
      active: json['active'] as bool?,
      questionId: json['questionID'] as String?,
      value: json['value'] as String?,
      choice: json['choice'] as String?,
      score: json['score'] as int?,
    );

Map<String, dynamic> _$$_QuestionChoiceToJson(_$_QuestionChoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'questionID': instance.questionId,
      'value': instance.value,
      'choice': instance.choice,
      'score': instance.score,
    };
