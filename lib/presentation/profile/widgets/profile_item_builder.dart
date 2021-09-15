import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:myafyahub/domain/core/entities/core/profile_page_items.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/text_themes.dart';

class ProfileItemBuilder extends StatelessWidget {
  final ProfileItemType section;
  final ValueChanged<ProfileItems> onSelect;

  final BuildContext context;

  const ProfileItemBuilder({
    required this.context,
    required this.section,
    required this.onSelect,
  });
  @override
  Widget build(BuildContext context) {
    final ProfileSubject profileSubject = ProfileSubject();
    return Container(
      color: Colors.grey.withOpacity(0.1),
      child: Column(
        children: <Widget>[
          ...profileItems
              .where((ProfileItems item) => item.section == section)
              .toList()
              .map(
                (ProfileItems profileItem) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 1.0),
                  color: (profileSubject.selectedTile.valueOrNull! ==
                              profileItem.text &&
                          ResponsiveWidget.deviceType(context) !=
                              DeviceScreensType.Mobile)
                      ? profileSubject.color.valueOrNull
                      : AppColors.whiteColor,
                  child: ListTile(
                    selectedTileColor: profileSubject.color.valueOrNull,
                    dense: true,
                    title: Text(
                      profileItem.text,
                      style: TextThemes.boldSize14Text(),
                    ),
                    trailing: Icon(profileItem.iconData, size: 20),
                    onTap: () async =>
                        // navigate to item page
                        onSelect(profileItem),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
