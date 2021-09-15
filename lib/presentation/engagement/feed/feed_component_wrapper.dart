import 'dart:async';

import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/core/services/feed_content_callbacks.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/feed_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/date_time_constants.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/domain/core/value_objects/extensions.dart';
import 'package:user_feed/user_feed.dart';

class FeedComponentWrapper extends StatefulWidget {
  const FeedComponentWrapper(
      {this.refreshDuration = kFeedAutoRefreshTimeInSeconds});

  final int refreshDuration;

  @override
  _FeedComponentWrapperState createState() => _FeedComponentWrapperState();
}

class _FeedComponentWrapperState extends State<FeedComponentWrapper> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      final FeedResponsePayload userFeed =
          StoreProvider.state<AppState>(context)!.userFeedState!;

      /// check if the feed is called before fetching. When the app
      /// has just bootstrapped, the initial feed will always be of type
      ///  invalid. Check `app_state.dart` for details
      if (!userFeed.isValid()) {
        await fetchFeed(context)();
      }

      timer = Timer.periodic(Duration(seconds: widget.refreshDuration),
          periodicFeedRefreshFunc(context) as void Function(Timer));
    });

    showFeedShimmer.stream.listen((bool event) {
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  Widget _buildNoDataWidget() => GenericNoData(
        type: GenericNoDataTypes.ErrorInData,
        actionText: 'Retry',
        recoverCallback: () async {
          await fetchFeed(context)(showRefreshIndicator: true);
        },
        messageBody: noFeedDataMessage,
      );

  @override
  void dispose() {
    if (timer != null) {
      this.timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeedViewModel>(
      converter: (Store<AppState> store) => FeedViewModel.fromStore(store),
      builder: (BuildContext context, FeedViewModel vm) {
        /// show loading indicator as the feed loads

        if (showFeedShimmer.stream.value) {
          return const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: FeedLoadingShimmer(
              flavor: Flavour.CONSUMER,
              feedItemShimmerPadding: 10,
              globalActionShimmerHorizontalPadding: 10,
              nudgeShimmerPadding: 10,
            ),
          );
        }

        final AppErrorState feedErrorState = vm.feedErrorState;

        /// check if the error is a timeout error and return an appropriate widget

        if (feedErrorState.isTimeout != null) {
          reportErrorToSentry(context, 'Time out fetching feed');
          return feedErrorState.isTimeout ?? false
              ? Center(
                  child: GenericTimeoutWidget(
                    action: 'fetching your feed',
                    route: BWRoutes.home,
                    recoverActionText: 'Retry',
                    recoverCallback: () async {
                      await fetchFeed(context)(showRefreshIndicator: true);
                    },
                  ),
                )
              : Center(child: _buildNoDataWidget());
        }

        final FeedResponsePayload userFeed = vm.feed;

        if (!userFeed.isValid()) {
          return _buildNoDataWidget();
        }

        return FeedComponent(
          userFeed: userFeed,
          flavour: Flavour.CONSUMER,
          isSmallScreen: true,
          feedbackGroundColor: Colors.grey[100],
          feedContentCallbacks: getFeedContentCallbacks(context: context),
        );
      },
    );
  }
}
