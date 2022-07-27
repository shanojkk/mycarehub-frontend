import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/notification_filter_state.dart';

class NotificationsViewModel extends Vm {
  final Wait wait;
  final List<NotificationDetails?> notifications;
  final NotificationFilterState? notificationFilterState;

  NotificationsViewModel({
    required this.wait,
    required this.notifications,
    required this.notificationFilterState,
  }) : super(equals: <Object?>[wait, notifications, notificationFilterState]);

  factory NotificationsViewModel.fromStore(Store<AppState> store) {
    return NotificationsViewModel(
      wait: store.state.wait!,
      notifications:
          store.state.clientState?.notifications ?? <NotificationDetails>[],
      notificationFilterState: store.state.clientState?.notificationFilterState,
    );
  }
}
