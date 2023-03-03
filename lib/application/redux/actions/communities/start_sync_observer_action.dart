import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:pro_health_360/application/redux/actions/communities/sync_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/sync_params.dart';

import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class StartSyncObserverAction extends ReduxAction<AppState> {
  StartSyncObserverAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(startingSyncObserverFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(startingSyncObserverFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final int? interval = store.state.chatState?.syncState?.syncInterval;
    final Timer? syncObserver = store.state.chatState?.syncState?.syncObserver;
    final int? backOff = store.state.chatState?.syncState?.backOff;

    Future<void> onSync(Timer timer) async {
      final String accessToken =
          store.state.chatState?.userProfile?.accessToken ?? UNKNOWN;
      final String lastSince =
          store.state.chatState?.syncResponse?.nextBatch ?? UNKNOWN;

      if (accessToken == UNKNOWN) {
        if (kDebugMode) {
          print(
            '-----SYNC Observer: Skipping sync. Access token is not available',
          );
        }
        return;
      }

      if (lastSince == UNKNOWN) {
        if (kDebugMode) {
          print(
            '-----SYNC Observer: Skipping sync. Last since is not available',
          );
        }
        return;
      }

      if (backOff != 0) {
        final int? lastAttemptMilliseconds =
            store.state.chatState?.syncState?.lastAttempt;
        final DateTime lastAttempt = DateTime.fromMillisecondsSinceEpoch(
          lastAttemptMilliseconds!,
        );

        final List<int> backOffs = fibonacci(backOff!);
        final int backoffFactor = backOffs[backOffs.length - 1];
        final int backoffLimit =
            DateTime.now().difference(lastAttempt).compareTo(
                  Duration(milliseconds: 1000 * backoffFactor),
                );

        if (backoffLimit != 1) {
          return;
        }

        if (kDebugMode) {
          print('[syncObserver] backoff timeout, trying again');
        }
      }

      if (kDebugMode) {
        print('[syncObserver] running sync');
      }

      /// Synchronize
      dispatch(SyncAction(syncParams: SyncParams(client: client)));
    }

    if (syncObserver == null || !syncObserver.isActive) {
      final AppState? newState = state.copyWith.chatState?.syncState?.call(
        syncObserver: Timer.periodic(Duration(milliseconds: interval!), onSync),
      );

      return newState;
    }

    return state;
  }
}
