import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/communities/start_sync_observer_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/sync_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_user_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/sync_params.dart';
import 'package:sghi_core/communities/models/user.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SignInAction extends ReduxAction<AppState> {
  SignInAction({
    required this.username,
    required this.password,
    required this.client,
    this.onSuccess,
  });

  final String? username;
  final String? password;
  final Function()? onSuccess;
  final IGraphQlClient? client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(signInFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(signInFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final User? userProfile = await ChatAPI.signIn(
      client: client!,
      username: username,
      password: password,
    );

    if (userProfile != null) {
      dispatch(
        UpdateUserStateAction(isSignedIn: true, userProfile: userProfile),
      );

      final String accessToken =
          state.chatState?.userProfile?.accessToken ?? '';

      /// Sync with the API first
      dispatch(
        SyncAction(
          syncParams: SyncParams(
            accessToken: accessToken,
            fullState: true,
            fullSync: true,
            forceFull: true,
            client: client!,
          ),
        ),
      );

      dispatch(StartSyncObserverAction(client: client!));

      onSuccess?.call();

      return state;
    }
    return null;
  }
}
