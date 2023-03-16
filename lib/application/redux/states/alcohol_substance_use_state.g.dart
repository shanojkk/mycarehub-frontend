// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlcoholSubstanceUseState _$$_AlcoholSubstanceUseStateFromJson(
        Map<String, dynamic> json) =>
    _$_AlcoholSubstanceUseState(
      screeningTool: json['screeningTool'] == null
          ? null
          : ScreeningTool.fromJson(
              json['screeningTool'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
      errorAnsweringQuestions: json['errorAnsweringQuestions'] as bool?,
    );

Map<String, dynamic> _$$_AlcoholSubstanceUseStateToJson(
        _$_AlcoholSubstanceUseState instance) =>
    <String, dynamic>{
      'screeningTool': instance.screeningTool,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
      'errorAnsweringQuestions': instance.errorAnsweringQuestions,
    };
