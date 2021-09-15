import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:unicons/unicons.dart';

import 'package:myafyahub/application/redux/actions/sil_bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/engagement/global_search/search_features.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/search_content_card.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void showSearchFunction() {
    showSearch(context: context, delegate: SearchFeatures());
  }

  Future<void> homeNavigationFunction({int? toIndex}) async {
    /// update the bottom of the navigation index if provided. Otherwise,leave it intact
    if (toIndex != null) {
      StoreProvider.dispatch<AppState>(
          context, BottomNavAction(currentBottomNavIndex: toIndex));
    }

    await Navigator.pushNamed(context, BWRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key: searchPageKey,
        child: Padding(
          padding: ResponsiveWidget.isLandscape(context: context)
              ? const EdgeInsets.all(40.0)
              : const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              smallVerticalSizedBox,
              // global search
              SILFormTextField(
                  key: searchFormKey,
                  prefixIcon:
                      const Icon(UniconsLine.search, color: Colors.grey),
                  hintText: searchHintText,
                  borderColor: Colors.grey.withOpacity(0.2),
                  //search delegate
                  onTap: () => showSearchFunction()),
              largeVerticalSizedBox,
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
                        actionIcon: Icon(
                          UniconsLine.books,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        actionName: viewLibrary,
                        actionRouteFunc: () async => homeNavigationFunction(
                            toIndex: BottomNavIndex.library.index),
                      ),
                    ),
                  )
                ],
              ),
              veryLargeVerticalSizedBox,

              SizedBox(
                height: 40,
                width: double.infinity,
                child: SILNoBorderButton(
                  buttonKey: searchBackButtonKey,
                  onPressed: () => homeNavigationFunction(),
                  text: 'Back',
                  textColor: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
