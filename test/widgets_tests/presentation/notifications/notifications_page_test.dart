// Package imports:
import 'dart:convert';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:pro_health_360/presentation/notifications/notification_list_item.dart'
    as consumer;
import 'package:pro_health_360/presentation/notifications/notifications_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('NotificationsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render notifications as a list',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const NotificationsPage(bottomNavIndex: 0),
      );

      await tester.pumpAndSettle();

      expect(find.byType(consumer.NotificationListItem), findsNWidgets(2));
    });

    testWidgets('should render notification filters as a list',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const NotificationsPage(bottomNavIndex: 0),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(CustomChipWidget, skipOffstage: false),
        findsNWidgets(4),
      );

      await tester.tap(find.byType(CustomChipWidget).at(3));
      await tester.pumpAndSettle();

      expect(find.byType(consumer.NotificationListItem), findsNWidgets(2));
    });
    testWidgets('should refresh notifications correctly',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const NotificationsPage(
          bottomNavIndex: 0,
        ),
      );
      final Finder notificationListItem =
          find.byType(consumer.NotificationListItem);
      await tester.pumpAndSettle();

      expect(notificationListItem, findsNWidgets(2));
      await tester.ensureVisible(notificationListItem.first);

      await tester.fling(
        find.byKey(notificationsListViewKey),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      expect(notificationListItem, findsNWidgets(2));
    });

    testWidgets(
        'should render no data generic widget if there are no notifications',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'fetchNotifications': <String, dynamic>{
                'notifications': <dynamic>[]
              }
            },
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const NotificationsPage(
          bottomNavIndex: 0,
        ),
        client: mockShortGraphQlClient,
      );

      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);

      await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });
  });
}
