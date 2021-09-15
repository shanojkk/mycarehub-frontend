import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/feed_content_callbacks.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';

import '../../mocks.dart';
import '../../test_helpers.dart';

void main() {
  final MockGraphQlClient GraphQlClient = MockGraphQlClient();

  testWidgets('should run feed callbacks when called',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    store.dispatch(UpdateUserProfileAction(
      profile: UserProfile(
        primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
        primaryEmailAddress: EmailAddress.withValue('s@g.com'),
      ),
    ));

    late BuildContext _context;

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            _context = context;
            return const SizedBox();
          },
        ),
      ),
    );

    await tester.pump();
    final Map<String, Function> callbacks =
        getFeedContentCallbacks(context: _context);

    expect(callbacks[kGetMedicine], returnsNormally);
    expect(callbacks[kVerifyEmail], returnsNormally);
    expect(callbacks[kGetTest], returnsNormally);
    expect(callbacks[kGetConsultation], returnsNormally);
  });

  testWidgets('should run kGetMedicine  callback', (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    late Function? callback;

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              callback =
                  getFeedContentCallbacks(context: context)[kGetMedicine];
            });
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(() => callback!(), returnsNormally);
  });

  testWidgets('should run kVerifyEmail  callback', (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    late Function? callback;

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              callback =
                  getFeedContentCallbacks(context: context)[kVerifyEmail];
            });
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(() => callback!(), returnsNormally);
  });

  testWidgets('should run kGetTest  callback', (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    late Function? callback;

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              callback = getFeedContentCallbacks(context: context)[kGetTest];
            });
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(() => callback!(), returnsNormally);
  });

  testWidgets('should run kGetConsultation  callback',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    late Function? callback;

    await buildTestWidget(
      tester: tester,
      store: store,
      client: GraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              callback =
                  getFeedContentCallbacks(context: context)[kGetConsultation];
            });
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(() => callback!(), returnsNormally);
  });
}
