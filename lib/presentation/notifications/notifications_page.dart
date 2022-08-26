import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/notifications/fetch_notification_filters_action.dart';
import 'package:pro_health_360/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/notifications/notifications_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/notifications/notification_list_item.dart'
    as consumer;
import 'package:pro_health_360/presentation/notifications/widgets/notifications_filter_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({required this.bottomNavIndex});

  final int bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: bottomNavIndex,
      appBar: CustomAppBar(
        title: notificationsText,
        trailingWidget: const SizedBox(),
        bottomNavIndex: bottomNavIndex,
      ),
      body: StoreConnector<AppState, NotificationsViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchNotificationFiltersAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
          store.dispatch(
            FetchNotificationsAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            NotificationsViewModel.fromStore(store),
        builder: (BuildContext context, NotificationsViewModel vm) {
          final List<NotificationDetails?> notifications = vm.notifications;
          final List<Widget> notificationsWidgetList = <Widget>[];
          if (notifications.isNotEmpty) {
            notifications
                .map(
                  (NotificationDetails? notification) =>
                      notificationsWidgetList.add(
                    consumer.NotificationListItem(
                      notificationDetails: notification,
                    ),
                  ),
                )
                .toList();
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                NotificationsFilterWidget(vm: vm),
                Flexible(
                  child: RefreshIndicator(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      key: notificationsListViewKey,
                      child: Column(
                        children: <Widget>[
                          if (vm.wait.isWaitingFor(fetchNotificationsFlag))
                            Container(
                              height: 300,
                              padding: const EdgeInsets.all(20),
                              child: const PlatformLoader(),
                            )
                          else if (notifications.isEmpty)
                            GenericErrorWidget(
                              actionKey: helpNoDataWidgetKey,
                              recoverCallback: () async {
                                // check the active filter first and apply it as a param to
                                // the fetch action
                                final NotificationFilter? selectedFilter =
                                    vm.notificationFilterState?.selectedFilter;
                                bool isRead = false;
                                if ((vm.notificationFilterState?.selectedFilter
                                                ?.name ??
                                            '')
                                        .compareTo(unread) !=
                                    0) {
                                  isRead = true;
                                }
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  FetchNotificationsAction(
                                    filters: selectedFilter?.type?.name,
                                    isRead: isRead,
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                  ),
                                );
                              },
                              headerIconSvgUrl: noNotificationsImageSvgPath,
                              messageTitle: noNotificationsTitle,
                              messageBody: <TextSpan>[
                                TextSpan(
                                  text: noNotificationsDescription,
                                  style: normalSize16Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ],
                            )
                          else
                            ...notificationsWidgetList
                        ],
                      ),
                    ),
                    onRefresh: () async {
                      final NotificationFilter? selectedFilter =
                          vm.notificationFilterState?.selectedFilter;

                      bool isRead = false;
                      if ((vm.notificationFilterState?.selectedFilter?.name ??
                                  '')
                              .compareTo(unread) !=
                          0) {
                        isRead = true;
                      }
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchNotificationsAction(
                          filters: selectedFilter?.type?.name,
                          isRead: isRead,
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
