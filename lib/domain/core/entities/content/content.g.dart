// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$_$_ContentFromJson(Map<String, dynamic> json) {
  return _$_Content(
    title: json['title'] as String?,
    body: json['body'] as String?,
    author: json['author'] as String?,
    authorAvatar: json['author_avatar'] as String?,
    heroImage: json['hero_image'] as String?,
    contentType: json['content_type'] as String?,
    publicLink: json['public_link'] as bool?,
    createdAt: json['created_at'] as bool?,
    updatedAt: json['updated_at'] as bool?,
    active: json['active'] as bool? ?? true,
    estimate: json['estimate'] as int?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    likes: json['like_count'] as int?,
    bookmarks: json['bookmark_count'] as int?,
    shares: json['share_count'] as int?,
    views: json['view_count'] as int?,
  );
}

Map<String, dynamic> _$_$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'author': instance.author,
      'author_avatar': instance.authorAvatar,
      'hero_image': instance.heroImage,
      'content_type': instance.contentType,
      'public_link': instance.publicLink,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'estimate': instance.estimate,
      'tags': instance.tags,
      'like_count': instance.likes,
      'bookmark_count': instance.bookmarks,
      'share_count': instance.shares,
      'view_count': instance.views,
    };
