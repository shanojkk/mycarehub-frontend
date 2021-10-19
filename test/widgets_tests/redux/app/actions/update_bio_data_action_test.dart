import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/actions/update_bio_data_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/basic_details_model.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../mock_utils.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  setupFirebaseAuthMocks();

  group('UpdateBioDataAction', () {
    late Store<AppState> store;

    setUp(() async {
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should show a snackbar when an error has occurred while updating a '
        'user\'s bio data', (WidgetTester tester) async {
      final DateFormat formatter = DateFormat('MM-dd');
      final String date = formatter.format(DateTime.now());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                StoreProvider.dispatch(
                  context,
                  UpdateBioDataAction(
                    flag: updateBasicDetailsFlag,
                    context: context,
                    userBasicDetails: UserBasicDetails()
                      ..firstName.add(Name.withValue(testFirstName))
                      ..lastName.add(Name.withValue(testLastName))
                      ..dateOfBirth.add('2003-$date')
                      ..gender.add(Gender.female),
                  ),
                );
              },
            );
          },
        ),
      );

      final Response response = Response(
        json.encode(<String, dynamic>{
          'error': <String, dynamic>{'error': 'some error'}
        }),
        401,
      );

      queryWhenThenAnswer(
        queryString: updateUserProfileMutation,
        variables: <String, dynamic>{
          'input': <String, dynamic>{
            'firstName': testFirstName,
            'lastName': testLastName,
            'dateOfBirth': '2003-$date',
            'gender': 'female',
          }
        },
        response: response,
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(store.state.miscState!.appErrorState!.isEmpty, true);
    });
  });
}
