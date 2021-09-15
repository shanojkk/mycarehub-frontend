import 'dart:io';

import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/popular_search_list.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_content_card.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_widget.dart';
import 'package:myafyahub/presentation/medical_tests/medical_tests_landing_page.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/global_search/search_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/engagement/library/library.dart';

import 'package:shared_ui_components/inputs.dart';

import '../../../mock_image_httpclient.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('should test search page', () {
    late Store<AppState> store;

    const String wellnessQuery = 'well';
    const String libraryQuery = 'lib';
    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          userProfileState: UserProfileState(
            onboardingTourComplete: true,
            profileSetupComplete: true,
            maskedPhoneNumbers: <PhoneNumber>[],
            unmaskedPhoneNumbers: <PhoneNumber>[],
            communicationSettings: CommunicationSettings(
              allowEmail: true,
              allowPush: true,
              allowText: true,
              allowWhatsApp: true,
            ),
            auth: AuthCredentialResponse.fromJson(
                <String, dynamic>{'uid': 'ajskdhbskjbdjhaskdbkash'}),
            userProfile: UserProfile.initial().copyWith(
              id: '123',
              username: Name.withValue('ddsa'),
              primaryPhoneNumber: PhoneNumber.withValue('0715710345'),
              primaryEmailAddress:
                  EmailAddress.withValue('bobwere47@gmail.com'),
              secondaryPhoneNumbers: <PhoneNumber>[
                PhoneNumber.withValue('0715710345'),
              ],
              secondaryEmailAddresses: <EmailAddress>[
                EmailAddress.withValue('bobwere47@gmail.com'),
              ],
              termsAccepted: true,
              suspended: false,
              photoUploadID: 'dskfdsn',
              homeAddress: Address(
                formattedAddress: '',
                latitude: '',
                locality: '',
                longitude: '',
                name: '',
                placeID: '',
              ),
              userBioData: BioData.initial().copyWith(
                  dateOfBirth: '23 May 2019',
                  firstName: Name.withValue('bob'),
                  lastName: Name.withValue('were'),
                  gender: Gender.female),
            ),
          ),
        ),
      );
      HttpOverrides.global = BWTestHttpOverrides();
    });

    testWidgets('should test search page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );
      await tester.pumpAndSettle();
      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);
    });

    testWidgets('should test library SearchPageActionCard widget',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(
            child: SearchPage(),
          );
        }),
      );
      await tester.pumpAndSettle();

      final Finder actionCard = find.byKey(searchActionCardKey);
      expect(actionCard, findsWidgets);

      expect(find.text(viewLibrary), findsOneWidget);
      await tester.tap(find.text(viewLibrary));
      await tester.pumpAndSettle();

      expect(store.state.miscState!.bottomNavObj!.currentBottomNavIndex, 1);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should test search field', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );
      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      final Finder searchField = find.text('Search');
      expect(searchField, findsOneWidget);
      await tester.tap(searchField);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'query');
    });

    testWidgets('should build suggestions', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );
      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), 'query');
      await tester.pumpAndSettle();
    });

    testWidgets('suggestion items should navigate when tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );
      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), wellnessQuery);
      await tester.pumpAndSettle();

      expect(find.text(wellnessQuery), findsOneWidget);
    });

    testWidgets('suggestion aliases items should navigate to page when tapped',
        (WidgetTester tester) async {
      final MockNavigatorObserver observer = MockNavigatorObserver();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: MaterialApp(
          navigatorObservers: <NavigatorObserver>[observer],
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const SearchPage(),
        ),
      );
      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);
      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      const String medicalTestAlias = 'test';

      await tester.enterText(find.byType(TextField), medicalTestAlias);
      await tester.pumpAndSettle();

      expect(find.text('Get Tested'), findsOneWidget);
      await tester.tap(find.text('Get Tested'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 10));
      await tester.pumpAndSettle();

      expect(find.byType(MedicalTestsLandingPage), findsOneWidget);
    });
    testWidgets('should build results with query longer than 3',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), 'query');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'build results items should return ResultList and navigate when topSearch is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), libraryQuery);
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();

      expect(find.text(libraryQuery), findsOneWidget);
      await tester.tap(find.byKey(searchTopResultKey));
      await tester.pumpAndSettle();
      expect(find.byType(Library), findsOneWidget);
    });

    testWidgets(
        'build results items should return ResultList and navigate when possibleSearch is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), libraryQuery);
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();

      final Finder clearButton = find.text(clear);
      expect(clearButton, findsOneWidget);

      expect(find.text(libraryQuery), findsOneWidget);
      await tester.tap(find.byKey(searchPossibleResultKey));
      await tester.pumpAndSettle();
      expect(find.byType(Library), findsOneWidget);
    });

    testWidgets('should build result with query less than 3',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), 'qu');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'should show result when user presses search and query exist on build result',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.enterText(find.byType(TextField), wellnessQuery);
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();
    });

    testWidgets('back button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      final Finder backButton = find.byKey(searchBackButtonKey);
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);

      // verify(mockObserver.didPush(sampleRoute, any));
    });

    testWidgets('cancel query button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), wellnessQuery);
      await tester.pumpAndSettle();
      final Finder clearButton = find.text(clear);
      expect(clearButton, findsOneWidget);
      await tester.tap(clearButton);

      expect(find.text(wellnessQuery), findsNothing);
    });

    testWidgets('search back button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchPage());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchPageScaffold = find.byKey(searchPageKey);
      expect(searchPageScaffold, findsOneWidget);

      expect(find.text(searchHintText), findsOneWidget);

      final Finder searchForm = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == searchFormKey);
      expect(searchForm, findsOneWidget);

      await tester.tap(searchForm);

      await tester.pumpAndSettle();
      final Finder backButton = find.byType(IconButton);
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);

      // verify(mockObserver.didPop(sampleRoute, any));
    });
    testWidgets('should open search box on pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchWidget());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchGestureDetector = find.byKey(sliverSearchKey);
      expect(searchGestureDetector, findsOneWidget);

      await tester.tap(searchGestureDetector);
      await tester.pumpAndSettle();
      expect(find.text(searchPageSubtitle), findsOneWidget);
      expect(find.byType(PopularSearchList), findsOneWidget);
      expect(find.byType(SearchPageActionCard), findsNWidgets(1));
    });

    testWidgets('should not have clear button if query is empty',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchWidget());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchGestureDetector = find.byKey(sliverSearchKey);
      expect(searchGestureDetector, findsOneWidget);

      final Finder clearButton = find.text(clear);

      await tester.tap(searchGestureDetector);
      await tester.pumpAndSettle();

      expect(find.text(searchPageSubtitle), findsOneWidget);
      expect(clearButton, findsNothing);

      await tester.enterText(find.byType(TextField), wellnessQuery);
      await tester.pumpAndSettle();
      expect(clearButton, findsOneWidget);
    });

    testWidgets('should trigger bottom navigation',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return const Center(child: SearchWidget());
        }),
      );

      await tester.pumpAndSettle();

      final Finder searchGestureDetector = find.byKey(sliverSearchKey);
      expect(searchGestureDetector, findsOneWidget);

      final Finder clearButton = find.text(clear);

      await tester.tap(searchGestureDetector);
      await tester.pumpAndSettle();

      expect(find.text(searchPageSubtitle), findsOneWidget);
      expect(clearButton, findsNothing);

      await tester.enterText(find.byType(TextField), 'lib');
      await tester.pumpAndSettle();
      expect(clearButton, findsOneWidget);

      final Finder libTab = find.text('Library');

      expect(libTab, findsOneWidget);
      await tester.tap(libTab);
      await tester.pumpAndSettle();

      expect(store.state.miscState!.bottomNavObj!.currentBottomNavIndex, 1);
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
