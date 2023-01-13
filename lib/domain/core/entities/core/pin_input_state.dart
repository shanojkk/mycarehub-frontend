// Package imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_input_state.freezed.dart';
part 'pin_input_state.g.dart';

@freezed
class PINInputState with _$PINInputState {
  factory PINInputState({
    String? healthPagePINInputTime,
    int? pinInputTries,
    String? maxTryTime,
    bool? pinVerified,
  }) = _PINInputState;

  factory PINInputState.fromJson(Map<String, dynamic> json) =>
      _$PINInputStateFromJson(json);

  factory PINInputState.initial() => PINInputState(
        healthPagePINInputTime: UNKNOWN,
        pinInputTries: 0,
        maxTryTime: UNKNOWN,
        pinVerified: false,
      );
}
