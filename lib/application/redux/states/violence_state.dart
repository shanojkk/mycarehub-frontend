import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';

part 'violence_state.g.dart';
part 'violence_state.freezed.dart';

@freezed
class ViolenceState with _$ViolenceState {
  factory ViolenceState({
    ScreeningTool? screeningTool,
    bool? errorFetchingQuestions,
    bool? timeoutFetchingQuestions,
    bool? errorAnsweringQuestions,
  }) = _ViolenceState;

  factory ViolenceState.fromJson(Map<String, dynamic> json) =>
      _$ViolenceStateFromJson(json);

  factory ViolenceState.initial() => ViolenceState(
        screeningTool: ScreeningTool.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
        errorAnsweringQuestions: false,
      );
}
