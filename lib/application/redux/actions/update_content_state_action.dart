// Flutter imports:

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

class UpdateContentStateAction extends ReduxAction<AppState> {
  UpdateContentStateAction({
    this.contentItems,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
  });

  final List<Content?>? contentItems;
  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;

  @override
  Future<AppState> reduce() async {
    final AppState newState = state.copyWith.contentState!.call(
      contentItems: contentItems ?? state.contentState!.contentItems,
      errorFetchingContent: state.contentState!.errorFetchingContent,
      timeoutFetchingContent: state.contentState!.timeoutFetchingContent,
    );

    return newState;
  }
}
