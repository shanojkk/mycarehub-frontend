import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';

part 'program_state.g.dart';
part 'program_state.freezed.dart';

@freezed
class ProgramState with _$ProgramState {
  factory ProgramState({
    List<Program?>? programs,
    Program? currentProgram,
  }) = _ProgramState;

  factory ProgramState.fromJson(Map<String, dynamic> json) =>
      _$ProgramStateFromJson(json);

  factory ProgramState.initial() => ProgramState(
        programs: <Program>[],
      );
}
