// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/profile_banner.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/client_profile_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_profile_form.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StoreConnector<AppState, UserProfileViewModel>(
              converter: (Store<AppState> store) =>
                  UserProfileViewModel.fromStore(store),
              builder: (BuildContext context, UserProfileViewModel vm) {
                final ClientProfileState myAfyaUserProfile =
                    vm.clientProfileState;
                final String firstName = myAfyaUserProfile
                    .myAfyaUserProfile!.userBioData!.firstName!
                    .getValue();

                final String lastName = myAfyaUserProfile
                    .myAfyaUserProfile!.userBioData!.lastName!
                    .getValue();

                return Hero(
                  tag: 'profile_banner',
                  child: Material(
                    child: SILProfileBanner(
                      height: 160,
                      backgroundImagePath: wellnessUmbrellaImgUrl,
                      userPhotoUrl: UNKNOWN,
                      userName: sentenceCaseUserName(
                        firstName: firstName,
                        lastName: lastName,
                      ),
                      primaryPhone: myAfyaUserProfile
                              .myAfyaUserProfile?.primaryPhoneNumber!
                              .getValue() ??
                          'No phone number',
                      profileRoute: BWRoutes.userProfile,
                    ),
                  ),
                );
              },
            ),
            veryLargeVerticalSizedBox,
            largeVerticalSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: EditProfileForm(),
            ),
          ],
        ),
      ),
    );
  }
}
