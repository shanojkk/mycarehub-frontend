// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningTool _$$_ScreeningToolFromJson(Map<String, dynamic> json) =>
    _$_ScreeningTool(
      id: json['id'] as String?,
      active: json['active'] as bool?,
      questionnaireId: json['questionnaireID'] as String?,
      threshold: json['threshold'] as int?,
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(
              json['questionnaire'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScreeningToolToJson(_$_ScreeningTool instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'questionnaireID': instance.questionnaireId,
      'threshold': instance.threshold,
      'questionnaire': instance.questionnaire,
    };
