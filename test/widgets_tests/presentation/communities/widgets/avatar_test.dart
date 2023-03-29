import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/communities/widgets/avatar.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('Avatar', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());

      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('should return initials if an avatar uri is missing or unknown',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockCommunitiesClient(),
        widget: const Avatar(avatarURI: 'UNKNOWN', displayName: 'Test User'),
      );

      expect(find.byType(Avatar), findsOneWidget);
      expect(find.text('TU'), findsOneWidget);
    });

    testWidgets('should show an avatar', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const Avatar(
          avatarURI: 'some-avatar-uri',
          displayName: 'Test User',
        ),
      );

      await tester.pump();

      expect(find.byType(Avatar), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
