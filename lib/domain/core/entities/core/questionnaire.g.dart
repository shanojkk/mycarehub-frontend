// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Questionnaire _$$_QuestionnaireFromJson(Map<String, dynamic> json) =>
    _$_Questionnaire(
      id: json['id'] as String?,
      active: json['active'] as bool?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      screeningQuestions: (json['questions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionnaireToJson(_$_Questionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'name': instance.name,
      'description': instance.description,
      'questions': instance.screeningQuestions,
    };
