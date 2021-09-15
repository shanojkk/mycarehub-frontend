import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/sil_appbar_user.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:domain_objects/value_objects.dart';

import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class SILSliverAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: sliverAppBarKey,
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: ResponsiveWidget.isLargeScreen(context)
          ? 250
          : isSmallScreenAndOnLandscape(context: context)
              ? 10
              : 180,
      toolbarHeight: 40,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  AppColors.redColor.withOpacity(0.7), BlendMode.dstATop),
              image: const AssetImage(blendedBackgroundImg),
              fit: BoxFit.cover,
            ),
          ),
          padding: ResponsiveWidget.isLargeScreen(context)
              ? const EdgeInsets.fromLTRB(number20, 0, number20, 40)
              : const EdgeInsets.fromLTRB(5, 0, 5, 10),
          child: StoreConnector<AppState, UserProfileViewModel>(
            converter: (Store<AppState> store) =>
                UserProfileViewModel.fromStore(store),
            builder: (BuildContext context, UserProfileViewModel vm) {
              final UserProfileState userProfile = vm.userProfileState;
              final String displayName = getDisplayName(userProfile);
              final String? firstName = userProfile.auth!.isAnonymous!
                  ? UNKNOWN
                  : toBeginningOfSentenceCase(displayName.split(' ').first);
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      preferredPaddingOnStretchedScreens(context: context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const SILAppbarUser(),
                    smallVerticalSizedBox,
                    Text(
                      getGreetingMessage(firstName),
                      style: TextThemes.boldSize24Text(AppColors.whiteColor),
                    ),
                    size15VerticalSizedBox,
                    const Flexible(child: SearchWidget()),
                    smallVerticalSizedBox,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
