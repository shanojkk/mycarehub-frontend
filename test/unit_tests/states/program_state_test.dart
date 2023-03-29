// Package imports:
import 'package:pro_health_360/application/redux/states/program_state.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import '../../mock_data.dart';

void main() {
  group('ProgramState', () {
    test('fromJson works correctly', () {
      final ProgramState fromJson = ProgramState.fromJson(mockProgramState);

      final ProgramState actual = ProgramState(
        programs: <Program>[Program.fromJson(mockProgram)],
        currentProgram: Program.fromJson(mockProgram),
      );

      expect(fromJson, actual);
    });

    test('Initial state is correct', () {
      final ProgramState programState = ProgramState.initial();

      expect(programState.programs, isEmpty);
    });
  });
}
