// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgramState _$$_ProgramStateFromJson(Map<String, dynamic> json) =>
    _$_ProgramState(
      programs: (json['programs'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Program.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentProgram: json['currentProgram'] == null
          ? null
          : Program.fromJson(json['currentProgram'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProgramStateToJson(_$_ProgramState instance) =>
    <String, dynamic>{
      'programs': instance.programs,
      'currentProgram': instance.currentProgram,
    };
