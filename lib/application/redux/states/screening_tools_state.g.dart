// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tools_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningToolsState _$$_ScreeningToolsStateFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningToolsState(
      violenceState: json['violenceState'] == null
          ? null
          : ViolenceState.fromJson(
              json['violenceState'] as Map<String, dynamic>),
      contraceptiveState: json['contraceptiveState'] == null
          ? null
          : ContraceptiveState.fromJson(
              json['contraceptiveState'] as Map<String, dynamic>),
      tbState: json['tbState'] == null
          ? null
          : TBState.fromJson(json['tbState'] as Map<String, dynamic>),
      alcoholSubstanceUseState: json['alcoholSubstanceUseState'] == null
          ? null
          : AlcoholSubstanceUseState.fromJson(
              json['alcoholSubstanceUseState'] as Map<String, dynamic>),
      availableScreeningTools: json['availableScreeningTools'] == null
          ? null
          : AvailableScreeningTools.fromJson(
              json['availableScreeningTools'] as Map<String, dynamic>),
      selectedTool: json['selectedTool'] == null
          ? null
          : ScreeningTool.fromJson(
              json['selectedTool'] as Map<String, dynamic>),
      responses: json['responses'] == null
          ? null
          : ScreeningToolAnswersList.fromJson(
              json['responses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScreeningToolsStateToJson(
        _$_ScreeningToolsState instance) =>
    <String, dynamic>{
      'violenceState': instance.violenceState,
      'contraceptiveState': instance.contraceptiveState,
      'tbState': instance.tbState,
      'alcoholSubstanceUseState': instance.alcoholSubstanceUseState,
      'availableScreeningTools': instance.availableScreeningTools,
      'selectedTool': instance.selectedTool,
      'responses': instance.responses,
    };
