// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/content/fetch_content_action.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_content_categories_action.dart';
import 'package:pro_health_360/application/redux/actions/content/view_content_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/content/content_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/feed_content_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/content/widgets/feed_categories_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_zero_state_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/no_connection_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class FeedPage extends StatefulWidget {
  const FeedPage();

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await StoreProvider.dispatch<AppState>(
        context,
        FetchContentCategoriesAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
      final FeedContentState? state = StoreProvider.state<AppState>(context)
          ?.contentState
          ?.feedContentState;

      if (state?.contentItems?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          FetchContentAction(context: context),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: 1,
      appBar: const CustomAppBar(
        title: feedTitle,
        showBackButton: false,
        bottomNavIndex: 1,
      ),
      body: StoreConnector<AppState, ContentViewModel>(
        converter: (Store<AppState> store) =>
            ContentViewModel.fromStore(store.state),
        builder: (BuildContext context, ContentViewModel vm) {
          final List<Content?>? feedItems = vm.feedContentState?.contentItems;
          if (!(vm.connectivityState?.isConnected ?? false)) {
            return const NoConnectionWidget();
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                    left: 12.0,
                    bottom: 8.0,
                    top: 4.0,
                  ),
                  child: FeedCategoriesWidget(
                    listContentCategory: vm.listContentCategory,
                    wait: vm.wait,
                    selectedCategory: vm.selectedCategory,
                  ),
                ),
                if (vm.wait!.isWaitingFor(fetchContentFlag)) ...<Widget>{
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    child: const PlatformLoader(),
                  )
                } else if (vm.feedContentState?.timeoutFetchingContent ??
                    false) ...<Widget>{
                  const GenericTimeoutWidget(
                    route: AppRoutes.home,
                    action: 'fetching your feed',
                  ),
                } else if (vm.feedContentState?.errorFetchingContent ??
                    false) ...<Widget>{
                  GenericErrorWidget(
                    actionKey: helpNoDataWidgetKey,
                    recoverCallback: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchContentAction(context: context),
                      );
                    },
                    messageBody: const <TextSpan>[
                      TextSpan(text: messageBodyGenericErrorWidget)
                    ],
                  ),
                } else ...<Widget>{
                  if (feedItems != null && feedItems.isNotEmpty) ...<Widget>{
                    Flexible(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          StoreProvider.dispatch<AppState>(
                            context,
                            FetchContentAction(context: context),
                          );
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: feedItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Content currentFeedItem =
                                feedItems.elementAt(index)!;
                            final DateTime twoWeeksAgo = DateTime.now()
                                .subtract(const Duration(days: 14));
                            final bool isNew =
                                currentFeedItem.date!.isAfter(twoWeeksAgo);
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 0 ? 15 : 7.5,
                                bottom: 10,
                                right: 12,
                                left: 12,
                              ),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.38,
                                child: ContentItem(
                                  contentDetails: currentFeedItem,
                                  contentDisplayedType:
                                      ContentDisplayedType.FEED,
                                  isNew: isNew,
                                  onPlayAudioTapped: () =>
                                      StoreProvider.dispatch<AppState>(
                                    context,
                                    ViewContentAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      contentID: currentFeedItem.contentID ?? 0,
                                    ),
                                  ),
                                  onTapPdfCallback: () {
                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      ViewContentAction(
                                        client: AppWrapperBase.of(context)!
                                            .graphQLClient,
                                        contentID:
                                            currentFeedItem.contentID ?? 0,
                                      ),
                                    );
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.viewDocumentPage,
                                      arguments: <String, dynamic>{
                                        'pdfTitle': currentFeedItem.documents!
                                            .first.documentData!.title,
                                        'pdfUrl': currentFeedItem
                                            .documents!
                                            .first
                                            .documentData!
                                            .documentMetaData!
                                            .documentDownloadUrl,
                                      },
                                    );
                                  },
                                  onTapCallback: () {
                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      ViewContentAction(
                                        client: AppWrapperBase.of(context)!
                                            .graphQLClient,
                                        contentID:
                                            currentFeedItem.contentID ?? 0,
                                      ),
                                    );
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.contentDetailPage,
                                      arguments: <String, dynamic>{
                                        'payload': ContentDetails(
                                          content: currentFeedItem,
                                          contentDisplayedType:
                                              ContentDisplayedType.FEED,
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  } else if (feedItems != null) ...<Widget>{
                    GenericZeroStateWidget(
                      callBackFunction: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchContentAction(
                            context: context,
                            category: vm.selectedCategory,
                          ),
                        );
                      },
                      iconUrl: contentZeroStateImageUrl,
                      title: contentZeroStateTitle,
                      description: contentZeroStateDescription,
                      buttonText: contentZeroStateButtonText,
                    ),
                  }
                }
              ],
            ),
          );
        },
      ),
    );
  }
}
