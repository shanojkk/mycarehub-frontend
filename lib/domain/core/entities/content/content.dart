// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  factory Content({
    // The title of the piece of content
    @JsonKey(name: 'title') required String? title,
    // Could be normal text, MD or Html
    @JsonKey(name: 'body') required String? body,
    @JsonKey(name: 'author') required String? author,
    @JsonKey(name: 'author_avatar') required String? authorAvatar,
    @JsonKey(name: 'hero_image') required String? heroImage,

    // The type of the content; can be audio/video/article etc
    @JsonKey(name: 'content_type') String? contentType,

    // A link that is safe for sharing
    @JsonKey(name: 'public_link') bool? publicLink,
    @JsonKey(name: 'created_at') bool? createdAt,
    @JsonKey(name: 'updated_at') bool? updatedAt,
    @JsonKey(name: 'active', defaultValue: true) bool? active,

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
