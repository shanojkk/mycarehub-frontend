// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/update_content_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_saved_content_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/pages/content_details_page.dart';
import 'package:pro_health_360/presentation/content/widgets/like_content_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:pro_health_360/presentation/profile/saved_posts/saved_posts_page.dart';
import 'package:pro_health_360/presentation/profile/saved_posts/widgets/no_saved_content_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import '../../../mock_data.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('SavedPostsPage', () {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'getUserBookmarkedContent': <String, dynamic>{
              'items': <dynamic>[contentMock.first, contentMock.first]
            }
          }
        }),
        201,
      ),
    );
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should fetch feed items and display them correctly',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const SavedPostPage(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(2));
      });
    });

    testWidgets('should display zero state widget',
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
              'getUserBookmarkedContent': <String, dynamic>{
                'items': <dynamic>[]
              }
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
          widget: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.savedPosts);
                  },
                );
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
        await tester.tap(find.byType(MyAfyaHubPrimaryButton));
        await tester.pumpAndSettle();

        expect(find.byType(NoSavedContentWidget), findsOneWidget);
        await tester.pumpAndSettle();

        final Finder okThanksButton = find.byKey(okThanksButtonKey);

        expect(okThanksButton, findsOneWidget);
        await tester.tap(okThanksButton);
        await tester.pumpAndSettle();
        expect(okThanksButton, findsNothing);
      });
    });

    testWidgets('should refresh feed display items correctly',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const SavedPostPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsNWidgets(2));

        await tester.fling(
          find.byType(ContentItem).first,
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();
        expect(find.byType(ContentItem), findsNWidgets(2));
      });
    });

    testWidgets('navigates to the detail view of a feed item',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(
          UpdateContentStateAction(
            contentItems: <Content>[
              Content.fromJson(
                contentMock.first,
              ),
            ],
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const SavedPostPage(),
        );

        await tester.pumpAndSettle();

        final Finder contentItem = find.byType(ContentItem);
        expect(contentItem, findsNWidgets(2));

        await tester.tap(contentItem.first);
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsOneWidget);
        final Finder likeButton = find.byType(LikeContentWidget);

        expect(likeButton, findsOneWidget);

        await tester.ensureVisible(likeButton);
        await tester.pumpAndSettle();
        await tester.tap(likeButton);
        await tester.pumpAndSettle();

        expect(find.text('Like'), findsNothing);
      });
    });
    testWidgets('navigates to the document page', (WidgetTester tester) async {
      final MockShortGraphQlClient mockSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserBookmarkedContent': <String, dynamic>{
                'items': <dynamic>[documentContentMock]
              }
            }
          }),
          201,
        ),
      );
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        store.dispatch(
          UpdateContentStateAction(
            contentItems: <Content>[
              Content.fromJson(
                documentContentMock,
              ),
            ],
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockSILGraphQlClient,
          widget: const SavedPostPage(),
        );

        await tester.pumpAndSettle();

        final Finder contentItem = find.byType(ContentItem);
        expect(contentItem, findsOneWidget);

        await tester.tap(contentItem);
      });
    });

    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
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
          widget: const SavedPostPage(),
        );
        store.dispatch(WaitAction<AppState>.add(fetchSavedContentFlag));
        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });

    testWidgets('shows a generic timeout widget while fetching the feed',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'timeout'}),
            201,
          ),
        );
        store.dispatch(UpdateContentStateAction(timeoutFetchingContent: true));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const SavedPostPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericTimeoutWidget), findsOneWidget);
      });
    });

    testWidgets(
        'shows a generic no data widget while fetching the feed '
        'and refresh the feed when prompted', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'no data'}),
            201,
          ),
        );

        store.dispatch(
          UpdateSavedContentStateAction(errorFetchingContent: true),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: const SavedPostPage(),
        );

        await tester.pump();

        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });
  });
}
