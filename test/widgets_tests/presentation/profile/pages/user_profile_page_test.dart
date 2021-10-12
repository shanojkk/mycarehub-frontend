// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';

void main() {
  testWidgets('UserProfilePage should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return UserProfilePage();
            },
          ),
        ),
      ),
    );

    expect(find.text(myHealthPageProfile), findsOneWidget);
    expect(find.byType(UserDetailsCard), findsWidgets);
    final Finder userProfileListItem = find.byType(InformationListCard);
    final Finder hotlineCallButton = find.byKey(hotlineCallButtonKey);
    expect(userProfileListItem, findsNWidgets(userProfileItems.length));
    expect(hotlineCallButton, findsOneWidget);

    await tester.tap(find.byKey(backAppBarKey));
    await tester.pumpAndSettle();
    expect(find.byType(MyHealthPage), findsNothing);
  });
}
