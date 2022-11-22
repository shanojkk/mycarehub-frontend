import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/notification_filter_state.dart';
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';

class UpdateNotificationFilterStateAction extends ReduxAction<AppState> {
  UpdateNotificationFilterStateAction({
    this.selectedFilter,
    this.notificationFilters,
  });

  final NotificationFilter? selectedFilter;
  final List<NotificationFilter>? notificationFilters;

  @override
  AppState reduce() {
    final NotificationFilterState notificationFilterState =
        NotificationFilterState(
      selectedFilter: selectedFilter ??
          state.clientState?.notificationFilterState?.selectedFilter,
      notificationFilters: notificationFilters ??
          state.clientState?.notificationFilterState?.notificationFilters,
    );

    final AppState newState = state.copyWith.call(
      clientState: state.clientState?.copyWith
          .call(notificationFilterState: notificationFilterState),
    );

    return newState;
  }
}
