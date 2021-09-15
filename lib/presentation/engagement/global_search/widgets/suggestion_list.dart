import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:unicons/unicons.dart';

import 'package:myafyahub/domain/core/entities/core/suggestion.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({
    required this.suggestionList,
    required this.suggestionNavigationCallBack,
  });

  final List<Suggestion> suggestionList;
  final Function suggestionNavigationCallBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Text(suggestedSearchTerms,
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => suggestionNavigationCallBack(index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      UniconsLine.history,
                      color: AppColors.greyColor.withOpacity(0.6),
                      size: 35,
                    ),
                    smallHorizontalSizedBox,
                    Text(
                      suggestionList[index].name,
                      style: TextThemes.boldSize15Text(),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: suggestionList.length,
          ),
        ),
      ],
    );
  }
}
