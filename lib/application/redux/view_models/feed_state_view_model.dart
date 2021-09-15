import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:user_feed/user_feed.dart';

class FeedViewModel {
  FeedViewModel({
    required this.feed,
    required this.feedErrorState,
  });

  final FeedResponsePayload feed;
  final AppErrorState feedErrorState;

  static FeedViewModel fromStore(Store<AppState> store) {
    return FeedViewModel(
        feed: store.state.userFeedState!,
        feedErrorState: store.state.miscState!.appErrorState!.lastWhere(
          (AppErrorState appErrorState) =>
              appErrorState.appErrorType == AppErrorType.UserFeedError,
          orElse: () => AppErrorState(),
        ));
  }
}
