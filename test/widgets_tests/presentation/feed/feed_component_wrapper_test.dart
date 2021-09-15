import 'dart:async';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/app_review_action.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/save_user_feed_action.dart';
import 'package:myafyahub/application/redux/actions/update_app_error_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/engagement/feed/feed_component_wrapper.dart';
import 'package:myafyahub/presentation/engagement/home/pages/feed_page.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';

import '../../../mock_feed_response.dart';
import '../../../mock_image_httpclient.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

void main() {
  group(' FeedComponentWrapper', () {
    final MockGraphQlClient GraphQlClient = MockGraphQlClient();

    setUpAll(() {
      HttpOverrides.global = BWTestHttpOverrides();
    });

    testWidgets('should feedComponentWrapper correctly',
        (WidgetTester tester) async {
      BuildContext? _context;
      await tester.runAsync(() async {
        Store<AppState> store;
        final AppState state = AppState.initial();
        store = Store<AppState>(initialState: state);
        store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                _context = context;
                return const FeedComponentWrapper();
              },
            ),
          ),
        );
        // expect to find the rendered widgets
        await tester.pumpAndSettle();
        expect(find.byType(FeedComponentWrapper), findsOneWidget);
        expect(_context, isNotNull);
        final void Function(Timer p1) updater =
            periodicFeedRefreshFunc(_context!) as void Function(Timer);

        final void Function(Timer p1) boundCallback =
            Zone.current.bindUnaryCallbackGuarded<Timer>(updater);

        Zone.current.createPeriodicTimer(
            const Duration(milliseconds: 100), boundCallback);
      });
    });

    testWidgets('should show refresh indicator', (WidgetTester tester) async {
      await tester.runAsync(() async {
        final AppState _state = AppState.initial();
        final AppState state = _state.copyWith.userFeedState!.call(
            data: GetFeedData.fromJson(
                mockFeedResponse()['data'] as Map<String, dynamic>));

        final Store<AppState> _store = Store<AppState>(initialState: state);
        _store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: _store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                return const FeedComponentWrapper();
              },
            ),
          ),
        );
        // // expect to find the rendered widgets
        expect(find.byType(FeedComponentWrapper), findsOneWidget);
      });
    });

    testWidgets('shows the timeout error when the feed state has a timeout',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        Store<AppState> store;
        final AppState state = AppState.initial();
        store = Store<AppState>(initialState: state);
        store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                StoreProvider.dispatch<AppState>(
                  context,
                  UpdateAppErrorStateAction(
                    errorMessage: 'timeout error message',
                    errorType: AppErrorType.UserFeedError,
                    isTimeout: true,
                  ),
                );

                return const FeedComponentWrapper();
              },
            ),
          ),
        );

        expect(find.byType(FeedComponentWrapper), findsOneWidget);

        expect(find.byType(GenericTimeoutWidget), findsOneWidget);
        expect(find.byKey(genericRetryButtonKey), findsOneWidget);
        expect(find.text('Retry'), findsOneWidget);
        await tester.tap(find.text('Retry'));
        await tester.pumpAndSettle();
      });
    });

    testWidgets('shows the fetching data error when the feed state has no data',
        (WidgetTester tester) async {
      Store<AppState> store;
      final AppState state = AppState.initial();
      store = Store<AppState>(initialState: state);
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );
      await store.dispatch(
        SaveUserFeedAction(
          userFeedState: FeedResponsePayload.fromJson(mockInvalidFeedResponse),
        ),
      );

      final Set<AppErrorState>? errorState =
          store.state.miscState!.appErrorState;
      final AppErrorState newErrorState = AppErrorState(
        errorMessage: 'error',
        isError: true,
        isTimeout: false,
        appErrorType: AppErrorType.UserFeedError,
      );
      errorState!.add(newErrorState);

      await tester.runAsync(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            client: GraphQlClient,
            widget: Material(child: Builder(builder: (BuildContext context) {
              return const FeedComponentWrapper();
            })));

        // expect to find the rendered widgets
        await tester.pumpAndSettle();
        expect(find.byType(FeedComponentWrapper), findsOneWidget);
        expect(find.byType(GenericNoData), findsOneWidget);
        expect(find.byKey(genericNoDataButtonKey), findsOneWidget);

        await tester.tap(find.byKey(genericNoDataButtonKey));
        await tester.pump();

        expect(store.state.miscState!.appErrorState, errorState);
      });
    });
    testWidgets('should show refresh indicator', (WidgetTester tester) async {
      await tester.runAsync(() async {
        final UserProfileState profileState =
            UserProfileState.initial().copyWith.userProfile!.call(
          covers: <Cover>[
            Cover.fromJson(<String, dynamic>{
              'payer_name': 'JICK',
              'payer_slade_code': 123,
              'member_number': '123255',
              'member_name': 'Bewell Test'
            })
          ],
        );
        final FeedResponsePayload feedState = FeedResponsePayload(
            data: GetFeedData.fromJson(
                mockFeedResponse()['data'] as Map<String, dynamic>));
        final Store<AppState> _store = Store<AppState>(
            initialState: AppState.initial().copyWith.call(
                userProfileState: profileState, userFeedState: feedState));
        _store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: _store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                return const FeedComponentWrapper();
              },
            ),
          ),
        );
        // // expect to find the rendered widgets
        expect(find.byType(FeedComponentWrapper), findsOneWidget);
      });
    });

    testWidgets('should show GenericNoData when feed is invalid',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final AppState _state = AppState.initial();
        final Store<AppState> _store = Store<AppState>(initialState: _state);
        await _store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        await _store.dispatch(
          SaveUserFeedAction(
            userFeedState:
                FeedResponsePayload.fromJson(mockFeedResponse(hasItems: false)),
          ),
        );

        final Set<AppErrorState>? errorState =
            _store.state.miscState!.appErrorState;
        await _store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: _store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                return const FeedComponentWrapper(
                  refreshDuration: 1,
                );
              },
            ),
          ),
        );
        await tester.pump(const Duration(seconds: 3));
        await tester.pumpAndSettle();
        // // expect to find the rendered widgets
        expect(find.byType(FeedComponentWrapper), findsOneWidget);
        expect(find.byType(GenericNoData), findsOneWidget);
        await tester.tap(find.byKey(genericNoDataButtonKey));
        await tester.pump();

        expect(_store.state.miscState!.appErrorState, errorState);
      });
    });
    testWidgets('should show bottom rating sheet correctly',
        (WidgetTester tester) async {
      BuildContext? _context;
      await tester.runAsync(() async {
        Store<AppState> store;
        final AppState state = AppState.initial();

        store = Store<AppState>(initialState: state);
        store.dispatch(
          UpdateUserProfileAction(
            profile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            ),
          ),
        );
        store.dispatch(AppReviewAction(
          days: 10,
          launches: 10,
        ));

        store.dispatch(
          AuthStatusAction(
            canExperiment: true,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                _context = context;
                return const FeedPage();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        final Finder laterButton = find.text('Later');
        expect(laterButton, findsOneWidget);
        await tester.tap(laterButton);
        await tester.pumpAndSettle();

        expect(_context, isNotNull);
        final void Function(Timer p1) updater =
            periodicFeedRefreshFunc(_context!) as void Function(Timer);

        final void Function(Timer p1) boundCallback =
            Zone.current.bindUnaryCallbackGuarded<Timer>(updater);

        Zone.current.createPeriodicTimer(
            const Duration(milliseconds: 100), boundCallback);
      });
    });
  });
}
