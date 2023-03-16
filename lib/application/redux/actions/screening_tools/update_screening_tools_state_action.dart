import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/alcohol_substance_use_state.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/contraceptive_state.dart';
import 'package:pro_health_360/application/redux/states/screening_tools_state.dart';
import 'package:pro_health_360/application/redux/states/tb_state.dart';
import 'package:pro_health_360/application/redux/states/violence_state.dart';
import 'package:pro_health_360/domain/core/entities/core/available_screening_tools.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool_answers_list.dart';

class UpdateScreeningToolsState extends ReduxAction<AppState> {
  UpdateScreeningToolsState({
    this.violenceState,
    this.contraceptiveState,
    this.tbState,
    this.alcoholSubstanceUseState,
    this.availableScreeningTools,
    this.selectedTool,
    this.responses,
  });

  final AlcoholSubstanceUseState? alcoholSubstanceUseState;
  final AvailableScreeningTools? availableScreeningTools;
  final ContraceptiveState? contraceptiveState;
  final TBState? tbState;
  final ViolenceState? violenceState;
  final ScreeningTool? selectedTool;
  final ScreeningToolAnswersList? responses;

  @override
  AppState reduce() {
    final ScreeningToolsState newScreeningToolsState = ScreeningToolsState(
      alcoholSubstanceUseState: alcoholSubstanceUseState ??
          state.miscState?.screeningToolsState?.alcoholSubstanceUseState,
      violenceState:
          violenceState ?? state.miscState?.screeningToolsState?.violenceState,
      contraceptiveState: contraceptiveState ??
          state.miscState?.screeningToolsState?.contraceptiveState,
      tbState: tbState ?? state.miscState?.screeningToolsState?.tbState,
      availableScreeningTools: availableScreeningTools ??
          state.miscState?.screeningToolsState?.availableScreeningTools,
      selectedTool:
          selectedTool ?? state.miscState?.screeningToolsState?.selectedTool,
      responses: responses ?? state.miscState?.screeningToolsState?.responses,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState
          ?.copyWith(screeningToolsState: newScreeningToolsState),
    );
    return newState;
  }
}
