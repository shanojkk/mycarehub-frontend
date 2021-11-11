// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:myafyahub/application/core/services/utils.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';
import '../feed_item_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage();

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: libraryTitle, showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildChoiceChips(context),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: feedItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final FeedDetails feedDetails = feedItems.elementAt(index);
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 15 : 7.5),
                      child: FeedItem(
                        feedDetails: feedDetails,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChips(BuildContext context) {
    final List<String> _choices = <String>[
      allString,
      recommendedString,
      exerciseString,
      dietString,
    ];
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 1 : 7.5),
            child: ChoiceChip(
              label: Text(
                _choices[index],
                style: TextThemes.normalSize16Text().copyWith(
                  color: _choiceIndex == index
                      ? AppColors.whiteColor
                      : AppColors.secondaryColor,
                ),
              ),
              labelStyle: const TextStyle(color: AppColors.whiteColor),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              selected: _choiceIndex == index,
              selectedColor: AppColors.secondaryColor,
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                });
              },
              backgroundColor: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}