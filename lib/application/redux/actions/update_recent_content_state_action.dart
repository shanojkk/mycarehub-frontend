// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/recent_content_state.dart';

class UpdateRecentContentStateAction extends ReduxAction<AppState> {
  UpdateRecentContentStateAction({
    this.contentItems,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
  });

  final List<Content?>? contentItems;
  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;

  @override
  AppState reduce() {
    final RecentContentState? recentContent =
        state.contentState?.recentContentState?.copyWith(
      contentItems:
          contentItems ?? state.contentState?.recentContentState?.contentItems,
      errorFetchingContent: errorFetchingContent ??
          state.contentState?.recentContentState?.errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent ??
          state.contentState?.recentContentState?.timeoutFetchingContent,
    );

    final AppState newState = state.copyWith(
      contentState:
          state.contentState?.copyWith(recentContentState: recentContent),
    );

    return newState;
  }
}
