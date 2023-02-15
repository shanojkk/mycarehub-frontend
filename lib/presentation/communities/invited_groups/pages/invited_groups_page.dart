import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';

class InvitedGroupsPage extends StatelessWidget {
  const InvitedGroupsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: groupInvitesString),
      body: Container(),
    );
  }
}
