import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_flagged_messages_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/event_report.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/widgets/flagged_message_item.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/generic_error_widget.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/text_themes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class FlaggedMessagesPage extends StatelessWidget {
  const FlaggedMessagesPage({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: flaggedMessagesString,
        trailingWidget: SizedBox(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const Text(
            flaggedMessagesCopy,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          mediumVerticalSizedBox,
          StoreConnector<AppState, FlaggedMessagesViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchFlaggedMessagesAction(
                  roomID: room.roomID!,
                  client: AppWrapperBase.of(context)!.communitiesClient!,
                ),
              );
            },
            converter: (Store<AppState> store) =>
                FlaggedMessagesViewModel.fromStore(store),
            builder: (BuildContext context, FlaggedMessagesViewModel vm) {
              if (vm.fetchingMembers) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 1),
                );
              }

              final List<EventReport?>? flaggedMessageEvents =
                  vm.flaggedMessageEvents;

              if (flaggedMessageEvents?.isEmpty ?? true) {
                return GenericErrorWidget(
                  actionText: okThanks,
                  actionKey: emptyFlaggedMessagesKey,
                  headerIconSvgUrl: noBannedMembersImage,
                  messageTitle: noFlaggedMessagesTitle,
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: noFlaggedMessagesDescription,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                  recoverCallback: () {
                    Navigator.of(context).pop();
                  },
                );
              }

              return ListView.builder(
                itemCount: flaggedMessageEvents?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final EventReport currentEvent =
                      flaggedMessageEvents![index]!;

                  return FlaggedReportListItem(
                    report: currentEvent,
                    optionKey: Key(currentEvent.eventID!),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
