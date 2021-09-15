import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class SearchPageActionCard extends StatelessWidget {
  const SearchPageActionCard(
      {Key? key,
      required this.actionIcon,
      required this.actionName,
      this.actionRoute,
      this.actionRouteFunc})
      : super(key: key);

  final Icon actionIcon;
  final String actionName;
  final String? actionRoute;

  /// [actionRouteFunc] function that does the actual navigation to the item page.
  /// mostly used items in the home page by updating the bottom nav
  final Function? actionRouteFunc;

  @override
  Widget build(BuildContext context) {
    return SearchContainer(
      actionIcon: actionIcon,
      actionName: actionName,
      actionRoute: actionRoute,
      actionRouteFunc: actionRouteFunc,
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer(
      {Key? key,
      required this.actionIcon,
      required this.actionName,
      this.actionRoute,
      this.actionRouteFunc})
      : super(key: key);

  final Icon actionIcon;
  final String actionName;
  final String? actionRoute;
  final Function? actionRouteFunc;

  void triggerSearchActionEvent({required BuildContext context}) {
    if (actionRoute != null) {
      Navigator.pushReplacementNamed(context, actionRoute!);
    }

    if (actionRouteFunc != null) actionRouteFunc!();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserProfileViewModel>(
        converter: (Store<AppState> store) =>
            UserProfileViewModel.fromStore(store),
        builder: (BuildContext context, UserProfileViewModel vm) {
          return GestureDetector(
            key: searchActionCardKey,
            onTap: () => triggerSearchActionEvent(context: context),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Card(
                elevation: 0,
                color: AppColors.whiteColor,
                child: SizedBox(
                  height: 70,
                  child: Padding(
                    padding: mediumPadding,
                    child: Row(
                      children: <Widget>[
                        actionIcon,
                        smallHorizontalSizedBox,
                        Flexible(
                          child: Text(actionName,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextThemes.boldSize14Text(
                                  Theme.of(context).primaryColorDark)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
