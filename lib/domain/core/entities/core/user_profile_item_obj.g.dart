// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_item_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileMenuItem _$ProfileMenuItemFromJson(Map<String, dynamic> json) =>
    ProfileMenuItem(
      iconAssetPath: json['iconAssetPath'] as String,
      title: json['title'] as String,
      route: json['route'] as String,
    );

Map<String, dynamic> _$ProfileMenuItemToJson(ProfileMenuItem instance) =>
    <String, dynamic>{
      'iconAssetPath': instance.iconAssetPath,
      'title': instance.title,
      'route': instance.route,
    };
