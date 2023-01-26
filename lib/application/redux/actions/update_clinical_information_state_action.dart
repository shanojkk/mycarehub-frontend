import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/client_profile.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';

class UpdateClinicInformationStateAction extends ReduxAction<AppState> {
  final String? facilityName;
  final String? phoneNumber;

  UpdateClinicInformationStateAction({this.facilityName, this.phoneNumber});
  @override
  AppState? reduce() {
    final Facility? newFacility = state
        .clientState?.clientProfile?.defaultFacility
        ?.copyWith(name: facilityName, phone: phoneNumber);

    final ClientProfile? newClientProfile = state.clientState?.clientProfile
        ?.copyWith(defaultFacility: newFacility);

    final ClientState? newState =
        state.clientState?.copyWith(clientProfile: newClientProfile);

    return state.copyWith(clientState: newState);
  }
}
