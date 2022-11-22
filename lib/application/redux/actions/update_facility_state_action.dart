import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:pro_health_360/domain/core/entities/core/facility_state.dart';

class UpdateFacilityStateAction extends ReduxAction<AppState> {
  UpdateFacilityStateAction({
    this.facilities,
    this.currentFacility,
  });

  final List<Facility>? facilities;
  final Facility? currentFacility;

  @override
  AppState reduce() {
    final FacilityState facilityState = FacilityState(
      facilities: facilities ?? state.clientState?.facilityState?.facilities,
      currentFacility:
          currentFacility ?? state.clientState?.facilityState?.currentFacility,
    );

    final AppState newState = state.copyWith.call(
      clientState:
          state.clientState?.copyWith.call(facilityState: facilityState),
    );

    return newState;
  }
}
