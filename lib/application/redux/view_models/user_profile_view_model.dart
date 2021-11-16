// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/client_profile_state.dart';

class UserProfileViewModel extends Vm {
  final ClientProfileState clientProfileState;

  UserProfileViewModel({required this.clientProfileState})
      : super(equals: <Object?>[clientProfileState]);

  static UserProfileViewModel fromStore(Store<AppState> store) {
    return UserProfileViewModel(
      clientProfileState: store.state.clientProfileState!,
    );
  }
}
