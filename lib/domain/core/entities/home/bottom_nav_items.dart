// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class BottomNavItem {
  const BottomNavItem(
      {required this.iconUrl,
      required this.text,
      required this.onTapRoute,
      required this.index,
      this.onTapRouteArguments});

  final String iconUrl;
  final int index;
  final String onTapRoute;
  final Map<String, dynamic>? onTapRouteArguments;
  final String text;
}

enum BottomNavIndex { home, feed, community, myHealth }

List<BottomNavItem> bottomNavItems = <BottomNavItem>[
  BottomNavItem(
    iconUrl: homeIconSvgPath,
    text: 'Home',
    onTapRoute: BWRoutes.home,
    index: BottomNavIndex.home.index,
  ),
  BottomNavItem(
    iconUrl: feedIconSvgPath,
    text: 'Feed',
    onTapRoute: BWRoutes.library,
    index: BottomNavIndex.feed.index,
  ),
  BottomNavItem(
    iconUrl: communityIconSvgPath,
    text: 'Community',
    onTapRoute: BWRoutes.library,
    index: BottomNavIndex.feed.index,
  ),
  BottomNavItem(
    iconUrl: myHealthIconSvgPath,
    text: 'My Health',
    onTapRoute: BWRoutes.library,
    index: BottomNavIndex.feed.index,
  ),
];
