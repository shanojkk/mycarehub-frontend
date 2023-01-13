import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_group_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class CheckUserIsModeratorAction extends ReduxAction<AppState> {
  final stream.Channel channel;

  CheckUserIsModeratorAction({required this.channel});

  @override
  void before() {
    dispatch(UpdateGroupStateAction(isModerator: false));
  }

  @override
  Future<AppState?> reduce() async {
    final stream.QueryMembersResponse result = await channel.queryMembers(
      filter: stream.Filter.equal('is_moderator', true),
    );

    final String clientId = state.clientState?.id ?? '';

    for (final stream.Member member in result.members) {
      if (member.user?.id == clientId) {
        dispatch(UpdateGroupStateAction(isModerator: true));
        return null;
      }
    }

    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
