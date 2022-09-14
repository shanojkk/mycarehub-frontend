// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';

class MoreMenuDropDown extends StatelessWidget {
  ///
  /// [MoreMenuDropDown] used within the community chat screen to provide more options.
  ///
  const MoreMenuDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      key: popupMenuButtonKey,
      onSelected: (int result) async {
        switch (result) {
          case 1:

            /// Notify user
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('$exitGroupText $comingSoonText'),
              ),
            );
            break;
          case 2:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('$groupInfoText  $comingSoonText'),
              ),
            );
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        PopupMenuItem<int>(
          key: groupInfoMenuItemKeyKey,
          value: 2,
          child: Text(
            groupInfoText,
            style: normalSize14Text(),
          ),
        ),
        PopupMenuItem<int>(
          key: exitGroupMenuItemKeyKey,
          value: 1,
          child: Text(exitGroupText, style: normalSize14Text()),
        ),
      ],
      child: const Icon(Icons.more_vert),
    );
  }
}
