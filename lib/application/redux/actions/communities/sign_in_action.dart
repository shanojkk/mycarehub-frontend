import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/communities/start_sync_observer_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/sync_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/sync_params.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SignInAction extends ReduxAction<AppState> {
  SignInAction({required this.client});

  final IGraphQlClient client;

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
    final String? accessToken = state.clientState?.communityToken;

    if (accessToken?.isNotEmpty ?? false) {
      /// Sync with the API first
      dispatch(
        SyncAction(
          syncParams: SyncParams(
            accessToken: accessToken,
            fullState: true,
            fullSync: true,
            forceFull: true,
            client: client,
          ),
        ),
      );

      dispatch(StartSyncObserverAction(client: client));
      return state;
    }

    return null;
  }
}
