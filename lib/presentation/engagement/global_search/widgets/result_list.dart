import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:unicons/unicons.dart';

import 'package:myafyahub/domain/core/entities/core/result.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:shared_themes/spaces.dart';

class ResultList extends StatelessWidget {
  const ResultList({
    required this.query,
    required this.topSearchList,
    required this.resultKey,
    required this.resultList,
    required this.topSearchNavigationCallBack,
    required this.possibleSearchNavigationCallBack,
  });

  final String query;
  final List<Result> topSearchList;
  final int resultKey;
  final List<Result> resultList;
  final Function topSearchNavigationCallBack;
  final Function possibleSearchNavigationCallBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verySmallVerticalSizedBox,

        // results for text
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('$result${' "$query"'}',
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold)),
        ),

        // top result
        GestureDetector(
          key: searchTopResultKey,
          onTap: () => topSearchNavigationCallBack(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 130,
              width: 72,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //image for the result

                  topSearchList[resultKey].image,
                  verySmallHorizontalSizedBox,
                  Center(
                      child: Text(
                    topSearchList[resultKey].name,
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          ),
        ),

        // what you can do
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 30, left: 30),
          child: Text(whatYouCanDo,
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ),

        /// possible options
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ListTile(
                key: searchPossibleResultKey,
                onTap: () => possibleSearchNavigationCallBack(context, index),
                tileColor: const Color(0xFFF6F7FB),
                leading: results[resultKey].possibleOptions[index].iconUrl,
                title: Text(
                  results[resultKey].possibleOptions[index].description,
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: const Icon(UniconsLine.arrow_right),
              ),
            ),
            itemCount: resultList.length,
          ),
        ),
      ],
    );
  }
}
