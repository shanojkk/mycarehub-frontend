import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';

part 'alcohol_substance_use_state.g.dart';
part 'alcohol_substance_use_state.freezed.dart';

@freezed
class AlcoholSubstanceUseState with _$AlcoholSubstanceUseState {
  factory AlcoholSubstanceUseState({
    ScreeningTool? screeningTool,
    bool? errorFetchingQuestions,
    bool? timeoutFetchingQuestions,
    bool? errorAnsweringQuestions,
  }) = _AlcoholSubstanceUseState;

  factory AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$AlcoholSubstanceUseStateFromJson(json);

  factory AlcoholSubstanceUseState.initial() => AlcoholSubstanceUseState(
        screeningTool: ScreeningTool.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
        errorAnsweringQuestions: false,
      );
}
