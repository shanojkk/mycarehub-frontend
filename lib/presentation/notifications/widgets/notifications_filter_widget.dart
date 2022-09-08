import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';
import 'package:pro_health_360/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:pro_health_360/application/redux/actions/update_notification_filter_state.dart';
import 'package:pro_health_360/application/redux/view_models/notifications/notifications_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';

class NotificationsFilterWidget extends StatelessWidget {
  const NotificationsFilterWidget({
    super.key,
    required this.vm,
  });

  final NotificationsViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 50,
      child: ListView.builder(
        key: notificationFiltersKey,
        scrollDirection: Axis.horizontal,
        itemCount: vm.notificationFilterState?.notificationFilters?.length,
        itemBuilder: (BuildContext context, int index) {
          final List<NotificationFilter?>? filterList =
              vm.notificationFilterState?.notificationFilters;

          final bool isSelected =
              filterList?[index] == vm.notificationFilterState?.selectedFilter;

          bool isRead = false;
          if (filterList?[index]?.name?.compareTo(unread) != 0) {
            isRead = true;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 6,
            ),
            child: CustomChipWidget(
              title: filterList?[index]?.name ?? '',
              gestureKey: Key(index.toString()),
              isSelected: isSelected,
              onTap: () async {
                await StoreProvider.dispatch(
                  context,
                  UpdateNotificationFilterStateAction(
                    selectedFilter: filterList?[index],
                  ),
                );

                StoreProvider.dispatch(
                  context,
                  FetchNotificationsAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                    filters: filterList?[index]?.type?.name,
                    isRead: isRead,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
