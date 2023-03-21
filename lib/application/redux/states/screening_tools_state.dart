import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/redux/states/alcohol_substance_use_state.dart';
import 'package:pro_health_360/application/redux/states/contraceptive_state.dart';
import 'package:pro_health_360/application/redux/states/tb_state.dart';
import 'package:pro_health_360/application/redux/states/violence_state.dart';
import 'package:pro_health_360/domain/core/entities/core/available_screening_tools.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool_answers_list.dart';

part 'screening_tools_state.g.dart';
part 'screening_tools_state.freezed.dart';

@freezed
class ScreeningToolsState with _$ScreeningToolsState {
  factory ScreeningToolsState({
    ViolenceState? violenceState,
    ContraceptiveState? contraceptiveState,
    TBState? tbState,
    AlcoholSubstanceUseState? alcoholSubstanceUseState,
    AvailableScreeningTools? availableScreeningTools,
    ScreeningTool? selectedTool,
    ScreeningToolAnswersList? responses,
  }) = _ScreeningToolsState;

  factory ScreeningToolsState.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolsStateFromJson(json);

  factory ScreeningToolsState.initial() => ScreeningToolsState(
        violenceState: ViolenceState.initial(),
        contraceptiveState: ContraceptiveState.initial(),
        tbState: TBState.initial(),
        alcoholSubstanceUseState: AlcoholSubstanceUseState.initial(),
        availableScreeningTools: AvailableScreeningTools.initial(),
        responses: ScreeningToolAnswersList.initial(),
      );
}
