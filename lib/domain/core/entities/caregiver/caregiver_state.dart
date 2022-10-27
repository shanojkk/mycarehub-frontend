// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';

part 'caregiver_state.freezed.dart';
part 'caregiver_state.g.dart';

@freezed
class CaregiverState with _$CaregiverState {
  factory CaregiverState({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'caregiver_number') String? caregiverNumber,
    List<ManagedClient>? managedClients,
    String? selectedClientId,
    bool? errorFetchingClients,
  }) = _CaregiverState;

  factory CaregiverState.fromJson(Map<String, dynamic> json) =>
      _$CaregiverStateFromJson(json);

  factory CaregiverState.initial() => CaregiverState(
        id: UNKNOWN,
        user: User.initial(),
        caregiverNumber: UNKNOWN,
        managedClients: <ManagedClient>[],
        selectedClientId: UNKNOWN,
        errorFetchingClients: false,
      );
}
