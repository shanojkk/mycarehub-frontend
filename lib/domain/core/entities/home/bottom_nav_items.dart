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

enum BottomNavIndex {
  home,
  library,
}

List<BottomNavItem> bottomNavItems = <BottomNavItem>[
  BottomNavItem(
      iconUrl: homeNavItemIconUrl,
      text: 'Home',
      onTapRoute: BWRoutes.home,
      index: BottomNavIndex.home.index),
  BottomNavItem(
      iconUrl: libraryNavItemIconUrl,
      text: 'Library',
      onTapRoute: BWRoutes.library,
      index: BottomNavIndex.library.index),
];
