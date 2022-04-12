// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';

class ClientProfileViewModel extends Vm {
  ClientProfileViewModel({
    required this.clientState,
    this.wait,
  }) : super(equals: <Object?>[clientState, wait]);

  final ClientState? clientState;
  final Wait? wait;

  static ClientProfileViewModel fromStore(Store<AppState> store) {
    return ClientProfileViewModel(
      clientState: store.state.clientState,
      wait: store.state.wait,
    );
  }
}
