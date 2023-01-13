// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/FAQS/fetch_faqs_content_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/FAQs/faqs_content_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_zero_state_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class ProfileFaqsPage extends StatefulWidget {
  @override
  _ProfileFaqsPageState createState() => _ProfileFaqsPageState();
}

class _ProfileFaqsPageState extends State<ProfileFaqsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch<AppState>(
        context,
        // retrieve the FAQS
        FetchFAQSContentAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: faqsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: StoreConnector<AppState, FAQsContentViewModel>(
            converter: (Store<AppState> store) =>
                FAQsContentViewModel.fromStore(store.state),
            builder: (BuildContext context, FAQsContentViewModel vm) {
              if (vm.wait?.isWaitingFor(getFAQsFlag) ?? false) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                );
              } else if (vm.timeoutFetchingFAQs ?? false) {
                return GenericErrorWidget(
                  actionKey: helpNoDataWidgetKey,
                  recoverCallback: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      FetchFAQSContentAction(
                        client: AppWrapperBase.of(context)!.graphQLClient,
                      ),
                    );
                  },
                  messageTitle: '',
                  messageBody: <TextSpan>[
                    TextSpan(text: getErrorMessage(fetchingFAQsString))
                  ],
                );
              } else if (vm.errorFetchingFAQs ?? false) {
                return GenericErrorWidget(
                  actionKey: helpNoDataWidgetKey,
                  recoverCallback: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      FetchFAQSContentAction(
                        client: AppWrapperBase.of(context)!.graphQLClient,
                      ),
                    );
                  },
                  messageTitle: '',
                  messageBody: <TextSpan>[
                    TextSpan(text: getErrorMessage(fetchingFAQsString))
                  ],
                );
              } else {
                final List<Content?>? faqsContent = vm.faqItems;

                if ((faqsContent?.isNotEmpty ?? false) &&
                    (faqsContent != null)) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        // retrieve the FAQS
                        FetchFAQSContentAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: faqsContent.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Content currentSavedItem =
                            faqsContent.elementAt(index)!;

                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 15 : 7.5,
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.38,
                            child: ContentItem(
                              contentDetails: currentSavedItem,
                              contentDisplayedType:
                                  ContentDisplayedType.BOOKMARK,
                              showReactions: false,
                              onTapPdfCallback: () =>
                                  Navigator.of(context).pushNamed(
                                AppRoutes.viewDocumentPage,
                                arguments: <String, dynamic>{
                                  'pdfTitle': currentSavedItem
                                      .documents!.first.documentData!.title,
                                  'pdfUrl': currentSavedItem
                                      .documents!
                                      .first
                                      .documentData!
                                      .documentMetaData!
                                      .documentDownloadUrl,
                                },
                              ),
                              onTapCallback: () =>
                                  Navigator.of(context).pushNamed(
                                AppRoutes.contentDetailPage,
                                arguments: <String, dynamic>{
                                  'payload': ContentDetails(
                                    content: currentSavedItem,
                                    contentDisplayedType:
                                        ContentDisplayedType.BOOKMARK,
                                  ),
                                  'showReactions': false,
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (faqsContent != null) {
                  return GenericZeroStateWidget(
                    callBackFunction: () {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchFAQSContentAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                    iconUrl: contentZeroStateImageUrl,
                    title: noFAQsTitle,
                    description: noFAQsDescription,
                    buttonText: contentZeroStateButtonText,
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
