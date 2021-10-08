// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

// Project imports:
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/pin_input_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/key_pad_widget.dart';

import '../../../../mock_image_httpclient.dart';
import '../../../../test_helpers.dart';

void main() {
  group('PinInputPage renders correctly', () {
    late Store<AppState> store;

    setUp(() {
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = BWTestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
              photoUploadID: '$dir/test/tests_resources/test_file.png'),
        ),
      );
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });
    testWidgets('1, 2, 3 buttons are tappable', (WidgetTester tester) async {
      final TextEditingController _pinController = TextEditingController();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return MaterialApp(
            home: PINInputPage(
              pinController: _pinController,
              pin: '2345',
            ),
          );
        }),
      );

      expect(find.byType(KeyPadWidget), findsOneWidget);
      final Finder numberOneButton = find.text('1');
      final Finder numberTwoButton = find.text('2');
      final Finder numberThreeButton = find.text('3');

      expect(numberOneButton, findsOneWidget);
      expect(numberTwoButton, findsOneWidget);
      expect(numberThreeButton, findsOneWidget);

      await tester.tap(numberOneButton);
      await tester.tap(numberTwoButton);
      await tester.tap(numberThreeButton);
      expect(_pinController.text, equals('123'));
    });
    testWidgets('4, 5,  and 6,  buttons are tappable',
        (WidgetTester tester) async {
      final TextEditingController _pinController = TextEditingController();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return MaterialApp(
            home: PINInputPage(
              pinController: _pinController,
              pin: '6464',
            ),
          );
        }),
      );
      expect(find.text(enterChatPINString), findsOneWidget);
      final Finder numberFourButton = find.text('4');
      final Finder numberFiveButton = find.text('5');
      final Finder numberSixButton = find.text('6');

      expect(numberFiveButton, findsOneWidget);
      expect(numberSixButton, findsOneWidget);
      expect(numberFourButton, findsOneWidget);

      await tester.tap(numberFiveButton);
      await tester.tap(numberSixButton);
      await tester.tap(numberFourButton);
      expect(_pinController.text, equals('564'));

      await tester.tap(numberFiveButton);
      await tester.tap(numberSixButton);
      await tester.tap(numberFourButton);
      await tester.tap(numberSixButton);
      await tester.tap(numberFourButton);
      expect(_pinController.text, equals('6464'));
    });
    testWidgets('7, 8, 9, 0 and backSpace buttons work correctly',
        (WidgetTester tester) async {
      final TextEditingController _pinController = TextEditingController();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return MaterialApp(
              home: MaterialApp(
            home: PINInputPage(
              pinController: _pinController,
              pin: '2345',
            ),
          ));
        }),
      );
      expect(find.text(forgotPINString), findsOneWidget);
      final Finder numberSevenButton = find.text('7');
      final Finder numberEightButton = find.text('8');
      final Finder numberNineButton = find.text('9');
      final Finder numberZeroButton = find.text('0');
      final Finder backSpaceButton = find.byKey(keyPadBackSpaceButtonKey);

      expect(numberNineButton, findsOneWidget);
      expect(numberZeroButton, findsOneWidget);
      expect(backSpaceButton, findsOneWidget);
      expect(numberSevenButton, findsOneWidget);
      expect(numberEightButton, findsOneWidget);

      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(backSpaceButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);

      expect(_pinController.text, equals('978'));
      expect(find.text('978'), findsOneWidget);

      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);

      await tester.pumpAndSettle(const Duration(minutes: 6));

      expect(find.text(wrongPINString), findsNothing);
      expect(_pinController.text, equals('07'));
    });
  });
}
