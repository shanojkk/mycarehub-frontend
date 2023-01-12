// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/caregiver/caregiver_state.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';

class UpdateCaregiverProfileAction extends ReduxAction<AppState> {
  UpdateCaregiverProfileAction({
    this.id,
    this.user,
    this.caregiverNumber,
    this.managedClients,
    this.selectedClientId,
    this.errorFetchingClients,
  });

  final String? id;
  final User? user;
  final String? caregiverNumber;
  final List<ManagedClient>? managedClients;
  final String? selectedClientId;
  final bool? errorFetchingClients;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      caregiverState: state.caregiverState?.copyWith.call(
        id: this.id ?? state.clientState?.clientProfile?.id,
        user: this.user ?? state.caregiverState?.user,
        caregiverNumber:
            this.caregiverNumber ?? state.caregiverState?.caregiverNumber,
        managedClients:
            this.managedClients ?? state.caregiverState?.managedClients,
        selectedClientId:
            selectedClientId ?? state.caregiverState?.selectedClientId,
        errorFetchingClients:
            errorFetchingClients ?? state.caregiverState?.errorFetchingClients,
      ),
    );

    return newState;
  }
}

class UpdateCaregiverStateAction extends ReduxAction<AppState> {
  UpdateCaregiverStateAction({this.caregiverState});

  final CaregiverState? caregiverState;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith(caregiverState: caregiverState ?? state.caregiverState);

    return newState;
  }
}
