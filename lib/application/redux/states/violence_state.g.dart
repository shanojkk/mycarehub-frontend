// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violence_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolenceState _$$_ViolenceStateFromJson(Map<String, dynamic> json) =>
    _$_ViolenceState(
      screeningTool: json['screeningTool'] == null
          ? null
          : ScreeningTool.fromJson(
              json['screeningTool'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
      errorAnsweringQuestions: json['errorAnsweringQuestions'] as bool?,
    );

Map<String, dynamic> _$$_ViolenceStateToJson(_$_ViolenceState instance) =>
    <String, dynamic>{
      'screeningTool': instance.screeningTool,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
      'errorAnsweringQuestions': instance.errorAnsweringQuestions,
    };
