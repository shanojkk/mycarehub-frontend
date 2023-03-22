// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningQuestion _$$_ScreeningQuestionFromJson(Map<String, dynamic> json) =>
    _$_ScreeningQuestion(
      id: json['id'] as String?,
      active: json['active'] as bool?,
      questionText: json['text'] as String?,
      questionType:
          $enumDecodeNullable(_$QuestionTypeEnumMap, json['questionType']),
      responseValueType: $enumDecodeNullable(
          _$QuestionResponseValueTypeEnumMap, json['responseValueType']),
      required: json['required'] as bool?,
      selectMultiple: json['selectMultiple'] as bool?,
      sequence: json['sequence'] as int?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : QuestionChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScreeningQuestionToJson(
        _$_ScreeningQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'text': instance.questionText,
      'questionType': _$QuestionTypeEnumMap[instance.questionType],
      'responseValueType':
          _$QuestionResponseValueTypeEnumMap[instance.responseValueType],
      'required': instance.required,
      'selectMultiple': instance.selectMultiple,
      'sequence': instance.sequence,
      'choices': instance.choices,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.OPEN_ENDED: 'OPEN_ENDED',
  QuestionType.CLOSE_ENDED: 'CLOSE_ENDED',
};

const _$QuestionResponseValueTypeEnumMap = {
  QuestionResponseValueType.STRING: 'STRING',
  QuestionResponseValueType.NUMBER: 'NUMBER',
  QuestionResponseValueType.BOOLEAN: 'BOOLEAN',
  QuestionResponseValueType.TIME: 'TIME',
  QuestionResponseValueType.DATE: 'DATE',
  QuestionResponseValueType.DATE_TIME: 'DATE_TIME',
};
