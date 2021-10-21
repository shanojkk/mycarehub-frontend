// Dart imports:
import 'dart:io';

// Flutter imports:

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:domain_objects/entities.dart' as domain;
import 'package:domain_objects/value_objects.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';

import '../../../../../mock_image_http_client.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('AppBarNotification', () {
    const String title = 'Community';

    late Store<AppState> store;

    setUp(() {
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          profile: domain.UserProfile(
            photoUploadID: '$dir/test/tests_resources/test_file.png',
          ),
        ),
      );
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: domain.BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: domain.UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });

    testWidgets(
        'should navigate to notifications page when notification icon '
        'is tapped', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CustomAppBar(title: title),
      );

      await tester.tap(find.byKey(appBarNotificationKey));
      await tester.pumpAndSettle();

      expect(find.byType(NotificationsPage), findsOneWidget);
    });
  });
}