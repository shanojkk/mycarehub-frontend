import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/profile/pages/feedback_page.dart';

void main() {
  testWidgets('FeedbackPage should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const FeedbackPage();
            },
          ),
        ),
      ),
    );
    expect(find.byType(FeedbackPage), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('FeedbackPage pop when sendFeedback is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const FeedbackPage();
            },
          ),
        ),
      ),
    );

    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsNothing);
  });

  testWidgets('FeedbackPage pop when cancel is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const FeedbackPage();
            },
          ),
        ),
      ),
    );

    final Finder cancelRequestButton = find.byKey(cancelFeedbackButtonKey);

    expect(cancelRequestButton, findsOneWidget);

    await tester.ensureVisible(cancelRequestButton);
    await tester.tap(cancelRequestButton);
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackPage), findsNothing);
  });

  testWidgets('FeedbackPage radio buttons are clickable ',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const FeedbackPage();
            },
          ),
        ),
      ),
    );

    final Finder yesRadioButton = find.byKey(yesRadioButtonKey);
    final Finder noRadioButton = find.byKey(noRadioButtonKey);

    expect(yesRadioButton, findsOneWidget);
    expect(noRadioButton, findsOneWidget);

    await tester.tap(yesRadioButton);
    await tester.pumpAndSettle();

    expect(
      (tester.firstWidget(yesRadioButton) as Radio<FollowUpChoice>).value,
      FollowUpChoice.Yes,
    );

    await tester.tap(noRadioButton);
    await tester.pumpAndSettle();

    expect(
      (tester.firstWidget(noRadioButton) as Radio<FollowUpChoice>).value,
      FollowUpChoice.No,
    );
  });
}