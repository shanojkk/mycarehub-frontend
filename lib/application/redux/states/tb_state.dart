import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';

part 'tb_state.g.dart';
part 'tb_state.freezed.dart';

@freezed
class TBState with _$TBState {
  factory TBState({
    ScreeningTool? screeningTool,
    bool? errorFetchingQuestions,
    bool? timeoutFetchingQuestions,
    bool? errorAnsweringQuestions,
  }) = _TBState;

  factory TBState.fromJson(Map<String, dynamic> json) =>
      _$TBStateFromJson(json);

  factory TBState.initial() => TBState(
        screeningTool: ScreeningTool.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
        errorAnsweringQuestions: false,
      );
}
