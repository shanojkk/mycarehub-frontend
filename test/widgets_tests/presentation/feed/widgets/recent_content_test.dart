// Dart imports:
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/basic.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pro_health_360/application/redux/actions/auth_status_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/presentation/content/widgets/feed_page_content_item.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/pages/content_details_page.dart';
import 'package:pro_health_360/presentation/content/pages/feed_page.dart';
import 'package:pro_health_360/presentation/content/widgets/recent_content_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_zero_state_widget.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('RecentFeedContentWidget', () {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'checkIfUserLikedContent': true,
            'checkIfUserBookmarkedContent': false,
            'listContentCategories': categoriesMock,
            'getContent': <String, dynamic>{
              'items': <dynamic>[
                contentMock.first,
                contentMock.first,
              ]
            }
          }
        }),
        201,
      ),
    );
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );

      store.dispatch(AuthStatusAction(isSignedIn: true));

      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should render recent content and display them correctly',
        (WidgetTester tester) async {
      store.dispatch(AuthStatusAction(isSignedIn: true));

      const Size size = Size(640, 960);
      await tester.binding.setSurfaceSize(size);
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const RecentContentWidget(),
      );

      await tester.pumpAndSettle();

      // feed items renders correctly
      final Finder feedItem = find.byType(FeedPageContentItem);

      expect(feedItem, findsNWidgets(2));
      await tester.ensureVisible(feedItem.first);
      await tester.tap(feedItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(ContentDetailPage), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Should fetch feed items if none are in state',
        (WidgetTester tester) async {
      store.dispatch(UpdateContentStateAction(contentItems: <Content>[]));

      store.dispatch(AuthStatusAction(isSignedIn: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const RecentContentWidget(),
      );

      // verify the contents of the feed items are in state
      final bool? isFeedEmpty =
          store.state.contentState?.feedContentState?.contentItems?.isEmpty;

      expect(isFeedEmpty, isNotNull);
      expect(isFeedEmpty, false);
    });

    testWidgets('View All should navigate to FeedPage',
        (WidgetTester tester) async {
      const Size size = Size(640, 960);
      await tester.binding.setSurfaceSize(size);

      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1;

      store.dispatch(AuthStatusAction(isSignedIn: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const RecentContentWidget(),
      );

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      final Finder viewAllButton = find.byKey(viewAllButtonKey);

      expect(viewAllButton, findsOneWidget);

      await tester.ensureVisible(viewAllButton);
      await tester.pumpAndSettle();
      await tester.tap(viewAllButton);
      await tester.pumpAndSettle();

      expect(find.byType(FeedPage), findsOneWidget);
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should display ContentZeroStateWidget when content list is empty',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listContentCategories': categoriesMock,
              'getContent': <String, dynamic>{'items': <dynamic>[]}
            }
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const RecentContentWidget(),
        );

        await tester.pump();

        expect(find.byType(GenericZeroStateWidget), findsWidgets);

        //Click GenericZeroStateWidget callback button
        await tester.tap(find.byType(MyAfyaHubPrimaryButton));

        expect(find.byType(GenericZeroStateWidget), findsWidgets);
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const RecentContentWidget(),
        );
        store.dispatch(WaitAction<AppState>.add(fetchRecentContentFlag));
        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
  });
}
