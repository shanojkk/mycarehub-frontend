import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class CommunitiesLogoutAction extends ReduxAction<AppState> {
  CommunitiesLogoutAction();

  @override
  Future<AppState?> reduce() async {
    state.chatState?.syncState?.syncObserver?.cancel();

    return state;
  }
}
