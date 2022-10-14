// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_item_obj.g.dart';

@JsonSerializable()

/// A configuration for the user profile menu items
///
/// They contain an [iconAssetPath] which is a link to an image, a [title] and
/// the [route] to navigate the user to
///
/// ```dart
/// ProfileMenuItem(
///    iconAssetPath: profileIcon,
///    route: AppRoutes.personalInfo,
///    title: 'Personal information',
///  )
/// ```
class ProfileMenuItem {
  ProfileMenuItem({
    required this.iconAssetPath,
    required this.title,
    required this.route,
  });

  factory ProfileMenuItem.fromJson(Map<String, dynamic> json) =>
      _$ProfileMenuItemFromJson(json);

  /// The icon asset path
  final String iconAssetPath;

  /// The title of the menu item
  final String title;

  /// The route to navigate the user to
  final String route;

  Map<String, dynamic> toJson() => _$ProfileMenuItemToJson(this);
}
