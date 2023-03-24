import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class SetBackoffAction extends ReduxAction<AppState> {
  SetBackoffAction({required this.backoff});

  final int? backoff;

  @override
  Future<AppState?> reduce() async {
    return state.copyWith.chatState?.syncState?.call(backOff: backoff);
  }
}

class SetLastAttempt extends ReduxAction<AppState> {
  SetLastAttempt({required this.lastAttempt});

  final int lastAttempt;

  @override
  Future<AppState?> reduce() async {
    return state.copyWith.chatState?.syncState?.call(lastAttempt: lastAttempt);
  }
}
