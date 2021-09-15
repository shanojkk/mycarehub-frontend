import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/fetch_user_feed_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

import 'package:mockito/mockito.dart';
import 'package:user_feed/user_feed.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:http/http.dart' as http;
import '../../../../../mock_feed_response.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('FetchUserFeedAction', () {
    late Store<AppState> store;
    late StoreTester<AppState> storeTester;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      storeTester = StoreTester<AppState>.from(store);

      storeTester.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });

    testWidgets('should dispatch action correctly',
        (WidgetTester tester) async {
      final Map<String, dynamic> responseData =
          mockFeedResponse(hasItems: false);
      // mocked response
      final http.Response response = http.Response(
        json.encode(responseData),
        200,
      );

      queryWhenThenAnswer(
          queryString: getFeedQuery,
          variables: <String, dynamic>{
            'flavour': Flavour.CONSUMER.name,
            'persistent': 'BOTH',
            'visibility': 'SHOW',
            'isAnonymous': false,
            'status': null,
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'An error occurred'}))
          .thenReturn(null);
      when(baseGraphQlClientMock.parseError(responseData)).thenReturn(null);

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                toggleLoadingIndicator(
                    context: context, flag: feedRefreshFlag);
                await store.dispatch(
                  FetchUserFeedAction(context: context),
                );
              });
            },
          ));

      await tester.pump();
      expect(store.state.userFeedState!.data.getFeed.uid, isNull);
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();
      expect(store.state.userFeedState!.data.getFeed.uid, isNotNull);
    });

    testWidgets('should dispatch action and timeout',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'statusCode': 408}),
        408,
      );

      queryWhenThenAnswer(
          queryString: getFeedQuery,
          variables: <String, dynamic>{
            'flavour': Flavour.CONSUMER.name,
            'persistent': 'BOTH',
            'visibility': 'SHOW',
            'isAnonymous': false,
            'status': null,
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'An error occurred'}))
          .thenReturn(null);

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                await store.dispatch(
                  FetchUserFeedAction(context: context),
                );
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      expect(
          store.state.miscState!.appErrorState!.contains(AppErrorState(
            isError: false,
            isTimeout: true,
            errorMessage: 'timeout',
            appErrorType: AppErrorType.UserFeedError,
          )),
          true);
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'error': 'Failed to fetch feed'}),
        500,
      );

      queryWhenThenAnswer(
          queryString: getFeedQuery,
          variables: <String, dynamic>{
            'flavour': Flavour.CONSUMER.name,
            'persistent': 'BOTH',
            'visibility': 'SHOW',
            'isAnonymous': false,
            'status': null,
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'Failed to fetch feed'}))
          .thenReturn('err');

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                await store.dispatch(
                  FetchUserFeedAction(context: context),
                );
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      expect(
          store.state.miscState!.appErrorState!.contains(AppErrorState(
            isError: true,
            isTimeout: false,
            errorMessage: 'error',
            appErrorType: AppErrorType.UserFeedError,
          )),
          true);
    });
  });
}
