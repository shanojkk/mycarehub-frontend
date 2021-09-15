import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/sil_appbar_user.dart';
import 'package:myafyahub/presentation/engagement/feed/feed_component_wrapper.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_widget.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/sil_sliver_appbar.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

import '../../../../mock_image_httpclient.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('SliverAppBar', () {
    final MockGraphQlClient GraphQlClient = MockGraphQlClient();
    final MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();

    setUpAll(() {
      HttpOverrides.global = BWTestHttpOverrides();
    });

    testWidgets('should contain search widget', (WidgetTester tester) async {
      Store<AppState> store;

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

      await store.dispatch(AuthStatusAction(isAnonymous: false));

      await store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue(
              testFirstName,
            ),
            lastName: Name.withValue(
              testLastName,
            ),
          ),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
          home: CustomScrollView(
            slivers: <Widget>[
              SILSliverAppbar(),
              const SliverToBoxAdapter(
                child: FeedComponentWrapper(),
              ),
            ],
          ),
        ),
      );

      // expect to find the rendered widgets
      await tester.pumpAndSettle();
      expect(find.byType(SILAppbarUser), findsOneWidget);
      expect(find.byType(SearchWidget), findsOneWidget);
      expect(find.text(welcomeMessage), findsOneWidget);
    });
  });
}
