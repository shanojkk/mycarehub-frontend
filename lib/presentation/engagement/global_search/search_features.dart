import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/sil_bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/entities/core/result.dart';
import 'package:myafyahub/domain/core/entities/core/suggestion.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/popular_search_list.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/result_list.dart';
import 'package:myafyahub/presentation/engagement/global_search/widgets/suggestion_list.dart';

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SearchFeatures extends SearchDelegate<String> {
  late int key;
  final List<Result> topSearchList = results;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        TextButton(
          onPressed: () {
            query = '';
          },
          child:
              const Text(clear, style: TextStyle(color: AppColors.blackColor)),
        ),
      const SizedBox.shrink(),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon
    return IconButton(
        tooltip: 'Back',
        icon: const Icon(UniconsLine.arrow_left),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[Center(child: Text(queryLength))],
      );
    } else {
      key = results.indexWhere(selectResult);
      final List<Result> resultList = results.where(
        (Result p) {
          final bool nameContainsParam = p.name.contains(query);

          final List<String> aliasFoundResults = p.aliases
              .where(
                (String alias) => alias.contains(query),
              )
              .toList();

          return nameContainsParam || aliasFoundResults.isNotEmpty;
        },
      ).toList();

      return resultList.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(child: Text(noQuery)),
            )
          : ResultList(
              query: query,
              topSearchList: topSearchList,
              resultKey: key,
              resultList: resultList,
              topSearchNavigationCallBack: topSearchResultNavigation,
              possibleSearchNavigationCallBack: possibleSearchResultNavigation,
            );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Suggestion> suggestionList = query.isEmpty
        ? <Suggestion>[]
        : suggestions.where(selectSuggestion).toList();

    void suggestionSearchNavigation(int index) {
      suggestions.map((Suggestion suggestion) {
        if (suggestionList[index].name.contains(suggestion.name)) {
          if (suggestion.shouldUpdateBottomNav &&
              suggestion.bottomNavIndex != null) {
            StoreProvider.dispatch<AppState>(
                context,
                BottomNavAction(
                    currentBottomNavIndex: suggestion.bottomNavIndex!));
          }
          Navigator.pushNamed(context, suggestion.route);
        }
      }).toList();
    }

    return suggestionList.isEmpty
        ? query.isEmpty
            ? const PopularSearchList()
            : const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(child: Text(noQuery)),
              )
        : SuggestionList(
            suggestionList: suggestionList,
            suggestionNavigationCallBack: suggestionSearchNavigation,
          );
  }

  bool selectResult(Result element) {
    final bool nameContainsParam = element.name.contains(query);

    final List<String> aliasFoundResults = element.aliases
        .where(
          (String alias) => alias.contains(query),
        )
        .toList();

    return nameContainsParam || aliasFoundResults.isNotEmpty;
  }

  bool selectSuggestion(Suggestion p) {
    final bool nameContainsParam = p.name.contains(query);

    final List<String> aliasFoundResults = p.aliases
        .where(
          (String alias) => alias.contains(query),
        )
        .toList();
    return nameContainsParam || aliasFoundResults.isNotEmpty;
  }

  void topSearchResultNavigation(BuildContext context) {
    results.map((Result result) {
      if (topSearchList[key].name.contains(result.name) ||
          topSearchList[key].aliases.contains(result.aliases)) {
        if (result.shouldUpdateBottomNav && result.bottomNavIndex != null) {
          StoreProvider.dispatch<AppState>(context,
              BottomNavAction(currentBottomNavIndex: result.bottomNavIndex!));
        }
        Navigator.pushNamed(context, result.route);
      }
    }).toList();
  }

  void possibleSearchResultNavigation(BuildContext context, int index) {
    if (results[key]
        .possibleOptions[index]
        .description
        .contains(results[key].possibleOptions[index].description)) {
      if (results[key].shouldUpdateBottomNav &&
          results[key].bottomNavIndex != null) {
        StoreProvider.dispatch<AppState>(
            context,
            BottomNavAction(
                currentBottomNavIndex: results[key].bottomNavIndex!));
      }

      Navigator.pushNamed(context, results[key].possibleOptions[index].route);
    }
  }
}
