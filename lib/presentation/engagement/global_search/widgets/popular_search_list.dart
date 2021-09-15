import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/sil_bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_content_card.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

class PopularSearchList extends StatelessWidget {
  const PopularSearchList({Key? key}) : super(key: key);

  Future<void> homeNavigationFunction(
      {int? toIndex, required BuildContext context}) async {
    /// update the bottom of the navigation index if provided. Otherwise,leave it intact
    if (toIndex != null) {
      StoreProvider.dispatch<AppState>(
          context, BottomNavAction(currentBottomNavIndex: toIndex));
    }

    await Navigator.pushNamed(context, BWRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          mediumVerticalSizedBox,
          Container(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              searchPageSubtitle,
              style: TextThemes.boldSize16Text(
                  AppColors.blackColor.withOpacity(0.7)),
            ),
          ),
          mediumVerticalSizedBox,
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: SearchPageActionCard(
                    key: searchPageActionLibraryKey,
                    actionIcon: Icon(
                      UniconsLine.books,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    actionName: viewLibrary,
                    actionRouteFunc: () async => homeNavigationFunction(
                      toIndex: BottomNavIndex.library.index,
                      context: context,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
