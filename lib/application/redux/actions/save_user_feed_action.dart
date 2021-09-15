import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:user_feed/user_feed.dart';

class SaveUserFeedAction extends ReduxAction<AppState> {
  SaveUserFeedAction({required this.userFeedState});

  final FeedResponsePayload userFeedState;

  @override
  Future<AppState> reduce() async {
    final AppState newState =
        state.copyWith.userFeedState!.call(data: userFeedState.data);
    return newState;
  }
}
