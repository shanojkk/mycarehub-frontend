// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TBState _$$_TBStateFromJson(Map<String, dynamic> json) => _$_TBState(
      screeningTool: json['screeningTool'] == null
          ? null
          : ScreeningTool.fromJson(
              json['screeningTool'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
      errorAnsweringQuestions: json['errorAnsweringQuestions'] as bool?,
    );

Map<String, dynamic> _$$_TBStateToJson(_$_TBState instance) =>
    <String, dynamic>{
      'screeningTool': instance.screeningTool,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
      'errorAnsweringQuestions': instance.errorAnsweringQuestions,
    };
