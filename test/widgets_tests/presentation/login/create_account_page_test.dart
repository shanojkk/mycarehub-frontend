import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/signup/widgets/create_account_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

void main() {
  late Store<AppState> store;
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
    store = Store<AppState>(initialState: AppState.initial());
  });

  testWidgets(
      'should createAccount renders correctly and return correct string instances',
      (WidgetTester tester) async {
    BuildContext? _context;
    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: Builder(builder: (BuildContext context) {
        _context = context;
        return CreateAccountPage();
      }),
    );

    await tester.pumpAndSettle();
    expect(find.byType(CreateAccountPage), findsOneWidget);

    expect(_context, isNotNull);

    final OnboardingStrings theStrings = OnboardingStrings.of(_context!)!;

    expect(phoneItems, isA<List<ConsentItem>>());
    expect(phoneItems.length, 3);

    expect(theStrings.wrongPinEntered(),
        'Sorry, you entered the wrong PIN. Please try again');

    expect(theStrings.doneText(), 'Done');

    expect(theStrings.genderText(), 'Gender');

    expect(theStrings.selectDateOfBirthText(), 'Tap to select a date');

    expect(idPhoto('test'), 'Upload a photo of your test');

    expect(noIDUploadText('test'), 'Please upload your test photo');

    final State<StatefulWidget> _state = tester.allStates.singleWhere(
        (State<StatefulWidget> el) =>
            el.toString() == 'CreateAccountPageState');

    // check if it is null
    expect(_state, isNotNull);

    // call the method
    final CreateAccountPageState createAccountPageState =
        _state as CreateAccountPageState;
    createAccountPageState.getAppSignature();

    // assert that is was called
    expect(() => createAccountPageState.getAppSignature(), returnsNormally);
  });
}
