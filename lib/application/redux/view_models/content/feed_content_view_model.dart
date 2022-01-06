// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

class FeedContentViewModel extends Vm {
  FeedContentViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.feedItems,
    this.recentContentItems,
    this.selectedCategory,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            feedItems,
            recentContentItems,
            selectedCategory
          ],
        );

  factory FeedContentViewModel.fromStore(AppState state) {
    return FeedContentViewModel(
      wait: state.wait,
      errorFetchingContent:
          state.contentState?.feedContentState?.errorFetchingContent,
      timeoutFetchingContent:
          state.contentState?.feedContentState?.timeoutFetchingContent,
      feedItems: state.contentState?.feedContentState?.contentItems,
      recentContentItems: state.contentState?.recentContentState?.contentItems,
      selectedCategory:
          state.contentState?.feedContentState?.selectedCategory,
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<Content?>? feedItems;
  final List<Content?>? recentContentItems;
  final Wait? wait;
  final ContentCategory? selectedCategory;
}
