import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_event_report_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/pages/message_item_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/generic_error_widget.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/text_themes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class FlaggedMessagePreviewPage extends StatelessWidget {
  const FlaggedMessagePreviewPage({super.key, required this.event});

  final EventReport event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: flaggedMessageString,
        trailingWidget: SizedBox(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const Text(
            flaggedMessagePreviewCopy,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          mediumVerticalSizedBox,
          StoreConnector<AppState, FlaggedMessagePreviewViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchEventReportAction(
                  reportID: event.reportID?.toString() ?? '',
                  client: AppWrapperBase.of(context)!.communitiesClient!,
                ),
              );
            },
            converter: (Store<AppState> store) =>
                FlaggedMessagePreviewViewModel.fromStore(store),
            builder: (BuildContext context, FlaggedMessagePreviewViewModel vm) {
              if (vm.fetchingMessageReport) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 1),
                );
              }

              final EventReport? reportedMessage = vm.selectedFlaggedMessage;

              if (reportedMessage == EventReport.initial() ||
                  reportedMessage?.reportedMessage == null) {
                return GenericErrorWidget(
                  actionText: okThanks,
                  actionKey: emptyBannedMembersKey,
                  headerIconSvgUrl: noBannedMembersImage,
                  messageTitle: noBannedMembers,
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: noBannedMembersDescription,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                  recoverCallback: () {
                    Navigator.of(context).pop();
                  },
                );
              }

              return MessageItemWidget(
                message: reportedMessage!.reportedMessage!,
                roomID: reportedMessage.roomID!,
                isFlaggedMessage: true,
              );
            },
          )
        ],
      ),
    );
  }
}
