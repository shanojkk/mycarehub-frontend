import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:pro_health_360/domain/core/entities/core/facility_state.dart';

class UpdateFacilityStateAction extends ReduxAction<AppState> {
  UpdateFacilityStateAction({
    this.facilities,
  });

  final List<Facility>? facilities;

  @override
  Future<AppState> reduce() async {
    final FacilityState facilityState = FacilityState(
      facilities: facilities ?? state.clientState?.facilityState?.facilities,
    );

    final AppState newState = state.copyWith.call(
      clientState:
          state.clientState?.copyWith.call(facilityState: facilityState),
    );

    return newState;
  }
}
