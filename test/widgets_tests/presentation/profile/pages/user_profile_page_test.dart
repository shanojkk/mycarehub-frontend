// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/my_afya_user_profile.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:afya_moja_core/information_list_card.dart';
import 'package:myafyahub/presentation/profile/pages/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';

import '../../../../test_helpers.dart';

void main() {
  group('MyAfyaUserProfilePage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(
          profile: MyAfyaUserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      expect(find.byType(UserDetailsCard), findsWidgets);
      final Finder MyAfyaUserProfileListItem = find.byType(InformationListCard);
      final Finder hotlineCallButton = find.byKey(hotlineCallButtonKey);

      expect(
        MyAfyaUserProfileListItem,
        findsNWidgets(MyAfyaUserProfileItems.length),
      );
      expect(hotlineCallButton, findsOneWidget);
    });

    testWidgets('navigates to PersonalInformationPage correctly',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(
          profile: MyAfyaUserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: UserProfilePage(),
      );
      final Finder personalInformationButton =
          find.text('Personal information');
      expect(personalInformationButton, findsOneWidget);

      await tester.ensureVisible(personalInformationButton);
      await tester.tap(personalInformationButton);
      await tester.pumpAndSettle();
      expect(find.byType(PersonalInformationPage), findsOneWidget);
    });
  });
}
