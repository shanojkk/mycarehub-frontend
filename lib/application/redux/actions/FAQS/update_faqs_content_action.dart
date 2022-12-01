// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';

class UpdateFAQsContentAction extends ReduxAction<AppState> {
  UpdateFAQsContentAction({
    this.profileFAQs,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
  });

  final List<Content?>? profileFAQs;
  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;

  @override
  AppState reduce() {
    final FAQsContentState? newFAQsContentState =
        state.miscState?.profileFAQsContentState?.copyWith(
      profileFAQs:
          profileFAQs ?? state.miscState?.profileFAQsContentState?.profileFAQs,
      errorFetchingFAQs: errorFetchingFAQs ??
          state.miscState?.profileFAQsContentState?.errorFetchingFAQs,
      timeoutFetchingFAQs: timeoutFetchingFAQs ??
          state.miscState?.profileFAQsContentState?.timeoutFetchingFAQs,
    );

    return state.copyWith(
      miscState: state.miscState?.copyWith(
        profileFAQsContentState: newFAQsContentState,
      ),
    );
  }
}
