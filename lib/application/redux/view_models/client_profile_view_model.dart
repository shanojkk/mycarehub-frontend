// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';

class ClientProfileViewModel extends Vm {
  ClientProfileViewModel({
    required this.wait,
    required this.clientState,
    required this.facilityName,
    this.connectivityState,
  }) : super(
          equals: <Object?>[
            wait,
            clientState,
            facilityName,
            connectivityState,
          ],
        );

  final ClientState? clientState;
  final ConnectivityState? connectivityState;
  final String? facilityName;
  final Wait? wait;

  static ClientProfileViewModel fromStore(Store<AppState> store) {
    return ClientProfileViewModel(
      clientState: store.state.clientState,
      wait: store.state.wait,
      facilityName:
          store.state.clientState?.clientProfile?.defaultFacility?.name,
      connectivityState: store.state.connectivityState,
    );
  }
}
