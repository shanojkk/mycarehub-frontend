import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/user.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  UpdateUserStateAction({this.isSignedIn, this.userProfile});

  final bool? isSignedIn;
  final User? userProfile;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.chatState
        ?.call(userProfile: userProfile ?? state.chatState?.userProfile)
        .copyWith
        .chatState
        ?.userProfile
        ?.call(
          isSignedIn: isSignedIn ?? state.chatState?.userProfile?.isSignedIn,
        );

    return newState;
  }
}
