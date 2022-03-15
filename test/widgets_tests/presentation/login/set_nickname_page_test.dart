// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/widgets/mini_content_widget.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/set_nickname_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CongratulationsPage', () {
    late Store<AppState> store;
    late MobileConnectivityChecker connectivityStatus;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'setNickName': true,
            'fetchRecentContent': contentMock,
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

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
      ConnectivityPlatform.instance = fakePlatform;

      connectivityStatus = MobileConnectivityChecker(
        checkInternetCallback: () async => true,
      );
    });

    testWidgets('should validate the input', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SetNickNamePage(connectivityStatus: connectivityStatus),
        );
        await tester.pumpAndSettle();
        final Finder nameInputField = find.byKey(
          nameInputKey,
        );
        final Finder continueButton = find.byKey(continueKey);

        expect(continueButton, findsOneWidget);
        expect(nameInputField, findsOneWidget);

        await tester.ensureVisible(continueButton);
        await tester.pumpAndSettle();
        await tester.tap(continueButton);
        await tester.pumpAndSettle();
        expect(find.text(nameInputValidateString), findsOneWidget);
      });
    });

    testWidgets('Navigates to Home page if input is valid  ',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        store.dispatch(
          UpdateContentStateAction(contentItems: <Content>[mockContent]),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: SetNickNamePage(connectivityStatus: connectivityStatus),
        );
        await tester.pumpAndSettle();

        final Finder nameInputField = find.byKey(
          nameInputKey,
        );
        final Finder continueButton = find.byKey(continueKey);

        expect(continueButton, findsOneWidget);
        expect(nameInputField, findsOneWidget);

        await tester.showKeyboard(nameInputField);
        await tester.enterText(nameInputField, 'test');

        await tester.ensureVisible(continueButton);
        await tester.pumpAndSettle();
        await tester.tap(continueButton);
        await tester.pumpAndSettle();
        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    testWidgets('should show No Internet text when there is no connectivity',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: SetNickNamePage(
          connectivityStatus: MobileConnectivityChecker(
            checkInternetCallback: () async => false,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder nameInputField = find.byKey(
        nameInputKey,
      );
      final Finder continueButton = find.byKey(continueKey);

      expect(continueButton, findsOneWidget);
      expect(nameInputField, findsOneWidget);

      await tester.showKeyboard(nameInputField);
      await tester.enterText(nameInputField, 'test');
      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(noInternetConnection), findsOneWidget);
    });

    testWidgets('should render PlatformLoader', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(WaitAction<AppState>.add('resume_with_pin'));

            return SetNickNamePage(connectivityStatus: connectivityStatus);
          },
        ),
      );

      await tester.pumpAndSettle();
      store.dispatch(WaitAction<AppState>.add(setNickNameFlag));
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(PlatformLoader), findsNWidgets(2));
    });

    testWidgets('Navigates to ContentDetailPage when a link is tapped  ',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: SetNickNamePage(),
      );
      await tester.pumpAndSettle();
      final Finder linkItem = find.byType(MiniContentWidget);
      expect(linkItem, findsNWidgets(2));
      await tester.tap(linkItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(ContentDetailPage), findsOneWidget);
    });

    testWidgets(
        'shows a generic no data widget while fetching welcome content '
        'and refresh the welcome content when prompted',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'no data'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: SetNickNamePage(),
      );
      await tester.pump();

      final Finder genericErrorWidgetButton = find.byKey(
        const Key(
          'error_fetching_content',
        ),
      );
      expect(genericErrorWidgetButton, findsOneWidget);

      await tester.ensureVisible(genericErrorWidgetButton);
      await tester.pumpAndSettle();
      await tester.tap(genericErrorWidgetButton);
      await tester.pumpAndSettle();

      final RawMaterialButton retryBtn = genericErrorWidgetButton.first
          .evaluate()
          .first
          .widget as RawMaterialButton;

      retryBtn.onPressed?.call();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
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
          widget: SetNickNamePage(),
        );

        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
  });
}