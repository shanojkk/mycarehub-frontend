import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/program_state.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';

class UpdateProgramStateAction extends ReduxAction<AppState> {
  UpdateProgramStateAction({
    this.programs,
    this.currentProgram,
  });

  final List<Program>? programs;
  final Program? currentProgram;

  @override
  AppState reduce() {
    final ProgramState newProgramState = ProgramState(
      programs: programs ?? state.onboardingState?.programState?.programs,
      currentProgram:
          currentProgram ?? state.onboardingState?.programState?.currentProgram,
    );

    final AppState newState = state.copyWith.call(
      onboardingState: state.onboardingState?.copyWith.call(
        programState: newProgramState,
      ),
    );

    return newState;
  }
}
