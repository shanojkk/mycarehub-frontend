import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/engagement/global_search/search_features.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:unicons/unicons.dart';
import 'package:user_feed/user_feed.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: sliverSearchKey,
      onTap: () {
        final AppState state = StoreProvider.state<AppState>(context)!;
        final String appContext =
            getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

        showSearch(
          context: context,
          delegate: SearchFeatures(),
        );

        // capture search metrics
        publishEvent(
          hasNavigatedToSearchPageEvent(appContext),
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
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.whiteColor.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              UniconsLine.search,
              color: Colors.white70,
            ),
            smallHorizontalSizedBox,
            Flexible(
              child: Text(
                welcomeMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
