import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:user_feed/user_feed.dart';
import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/sil_bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class SILBottomNavigationBar extends StatelessWidget {
  const SILBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final AppState state = StoreProvider.state<AppState>(context)!;
    final String appContext =
        getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

    return BottomNavigationBar(
      key: silBottomNavKey,
      currentIndex: currentIndex,
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: AppColors.greyColor,
      onTap: (int v) {
        StoreProvider.dispatch<AppState>(
            context, BottomNavAction(currentBottomNavIndex: v));

        if (BottomNavIndex.home.index == v) {
          publishEvent(
            hasAccessedFeedEvent(appContext),
            EventObject(
              firstName: state
                  .userProfileState!.userProfile!.userBioData!.firstName!
                  .getValue(),
              lastName: state
                  .userProfileState!.userProfile!.userBioData!.lastName!
                  .getValue(),
              uid: state.userProfileState!.auth!.uid,
              primaryPhoneNumber: state
                  .userProfileState!.userProfile!.primaryPhoneNumber!
                  .getValue(),
              flavour: Flavour.CONSUMER.name,
              timestamp: DateTime.now(),
            ),
          );
        }
        if (BottomNavIndex.library.index == v) {
          publishEvent(
            hasNavigatedToLibraryPageEvent(appContext),
            EventObject(
              firstName: state
                  .userProfileState!.userProfile!.userBioData!.firstName!
                  .getValue(),
              lastName: state
                  .userProfileState!.userProfile!.userBioData!.lastName!
                  .getValue(),
              uid: state.userProfileState!.auth!.uid,
              primaryPhoneNumber: state
                  .userProfileState!.userProfile!.primaryPhoneNumber!
                  .getValue(),
              flavour: Flavour.CONSUMER.name,
              timestamp: DateTime.now(),
            ),
          );
        }
      },
      items: bottomNavItems
          .map(
            (BottomNavItem navItem) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                navItem.iconUrl,
                color: AppColors.greyColor,
              ),
              activeIcon: SvgPicture.asset(
                navItem.iconUrl,
                color: Theme.of(context).primaryColor,
              ),
              label: navItem.text,
            ),
          )
          .toList(),
    );
  }
}
