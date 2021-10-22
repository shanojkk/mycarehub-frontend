// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  factory Content({
    // The title of the piece of content
    @JsonKey(name: 'title') String? title,
    // Could be normal text, MD or Html
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'author_avatar') String? authorAvatar,
    @JsonKey(name: 'hero_image') String? heroImage,

    // The type of the content; can be audio/video/article etc
    @JsonKey(name: 'content_type') String? contentType,

    // A link that is safe for sharing
    @JsonKey(name: 'public_link') String? publicLink,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'active', defaultValue: true) bool? active,

    // Whether this piece of content is marked as new content
    @JsonKey(name: 'is_new', defaultValue: true) bool? isNew,

    // estimated time to read an article or video/audio length
    @JsonKey(name: 'estimate') int? estimate,
    @JsonKey(name: 'tags') List<String>? tags,

    // Metadata about a piece of content
    @JsonKey(name: 'like_count') int? likes,
    @JsonKey(name: 'bookmark_count') int? bookmarks,
    @JsonKey(name: 'share_count') int? shares,
    @JsonKey(name: 'view_count') int? views,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
