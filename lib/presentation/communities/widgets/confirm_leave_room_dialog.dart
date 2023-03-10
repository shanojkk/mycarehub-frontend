import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/leave_room_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';

class ConfirmLeaveRoomDialog extends StatelessWidget {
  const ConfirmLeaveRoomDialog({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              areYouReallySureTitle,
              style: heavySize16Text(),
            ),
            mediumVerticalSizedBox,
            Text(
              leaveRoomDescription,
              style: normalSize14Text(
                AppColors.unSelectedReactionIconColor,
              ),
            ),
            largeVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: confirmLeaveRoomKey,
                buttonColor: Colors.red,
                text: yesIam,
                textStyle: boldSize16Text(AppColors.whiteColor),
                textColor: AppColors.whiteColor,
                onPressed: () {
                  StoreProvider.dispatch<AppState>(
                    context,
                    LeaveRoomAction(
                      roomID: room.roomID!,
                      onSuccess: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.roomListPageRoute);
                      },
                      client: AppWrapperBase.of(context)!.graphQLClient,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
