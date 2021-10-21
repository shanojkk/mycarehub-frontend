import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';

import '../../../mocks.dart';

void main() {
  group('NotificationDetails', () {
    test('expects to convert NotificationDetails from json', () {
      final NotificationDetails mockNotificationDetails =
          NotificationDetails.fromJson(mockNotification);
      expect(mockNotificationDetails, isA<NotificationDetails>());
    });
  });
}