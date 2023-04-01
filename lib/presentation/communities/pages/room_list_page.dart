import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/sign_in_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/sync_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/widgets/room_list_item_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/sync_params.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await StoreProvider.dispatch(
        context,
        SignInAction(
          username: 'abiudrn',
          password: 'abiudrn',
          client: AppWrapperBase.of(context)!.communitiesClient,
        ),
      );
    });

    super.initState();
  }

  Future<void> onRefresh(BuildContext context) async {
    StoreProvider.dispatch<AppState>(
      context,
      SyncAction(
        syncParams: SyncParams(
          fullState: true,
          fullSync: true,
          client: AppWrapperBase.of(context)!.communitiesClient!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversations'),
      bottomNavigationBar: const BottomNavBar(bottomNavIndex: 2),
      body: RefreshIndicator(
        onRefresh: () async => onRefresh(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: StoreConnector<AppState, RoomListViewModel>(
                  converter: (Store<AppState> store) {
                    return RoomListViewModel.fromStore(store);
                  },
                  onInit: (Store<AppState> store) {},
                  builder: (BuildContext context, RoomListViewModel vm) {
                    if (vm.syncing) {
                      return Center(
                        child: Column(
                          children: <Widget>[
                            const Text(syncingString),
                            mediumVerticalSizedBox,
                            const CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }

                    if (vm.rooms?.isEmpty ?? true) {
                      return GenericErrorWidget(
                        actionText: viewInvites,
                        actionKey: emptyChatsNewRoomKey,
                        headerIconSvgUrl: noChatImage,
                        messageTitle: noConversationsAvailable,
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: noConversationsDescription,
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                        recoverCallback: () {},
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: vm.rooms?.length ?? 0,
                      itemBuilder: (BuildContext context, int i) {
                        final Room? currentRoom = vm.rooms?[i];

                        return RoomListItemWidget(currentRoom: currentRoom!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
