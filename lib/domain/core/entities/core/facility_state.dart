import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';

part 'facility_state.freezed.dart';
part 'facility_state.g.dart';

@freezed
class FacilityState with _$FacilityState {
  factory FacilityState({
    List<Facility?>? facilities,
  }) = _FacilityState;

  factory FacilityState.fromJson(Map<String, dynamic> json) =>
      _$FacilityStateFromJson(json);

  factory FacilityState.initial() => FacilityState(
        facilities: <Facility?>[],
      );
}
