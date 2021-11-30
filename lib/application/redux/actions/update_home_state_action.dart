// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/home_state.dart';

class UpdateHomeStateAction extends ReduxAction<AppState> {
  UpdateHomeStateAction({
    this.canRecordMood,
  });

  bool? canRecordMood;

  @override
  AppState reduce() {
    final HomeState? newHomeState = state.homeState?.copyWith(
      canRecordMood: canRecordMood ?? state.homeState?.canRecordMood,
    );

    final AppState newState = state.copyWith(homeState: newHomeState);

    return newState;
  }
}
