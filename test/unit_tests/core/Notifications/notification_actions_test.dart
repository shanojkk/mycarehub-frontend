// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import '../../../mock_data.dart';

void main() {
  group('NotificationAction', () {
    test('expects to convert NotificationAction from json', () {
      final NotificationActions notificationActions =
          NotificationActions.fromJson(mockNotificationActions);
      expect(notificationActions, isA<NotificationActions>());
    });
  });
}
