// Flutter imports:
import 'package:afya_moja_core/community_list_item.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class CommunityListViewPage extends StatelessWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder
    const String dontMissAppointmentMessage =
        'Don\'t miss your appointment tomorrow';
    const AssetImage avatarImage = AssetImage('assets/images/wellness2.jpeg');
    const String date = 'July 12 2021';

    final List<Widget> items = <Widget>[
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        lastMessageDate: date,
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        unreadNotificationCount: 4,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroupMessage: true,
        onTap: () =>
            Navigator.pushNamed(context, BWRoutes.communityChatScreenPage),
        lastMessageDate: date,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: communityString),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
            key: communityListViewKey,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, int index) {
              return GestureDetector(child: items[index]);
            },
          ),
        ],
      ),
    );
  }
}
