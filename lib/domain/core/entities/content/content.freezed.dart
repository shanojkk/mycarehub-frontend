// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
class _$ContentTearOff {
  const _$ContentTearOff();

  _Content call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'author_avatar') String? authorAvatar,
      @JsonKey(name: 'hero_image') String? heroImage,
      @JsonKey(name: 'content_type') String? contentType,
      @JsonKey(name: 'public_link') String? publicLink,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'active', defaultValue: true) bool? active,
      @JsonKey(name: 'is_new', defaultValue: true) bool? isNew,
      @JsonKey(name: 'estimate') int? estimate,
      @JsonKey(name: 'tags') List<String>? tags,
      @JsonKey(name: 'like_count') int? likes,
      @JsonKey(name: 'bookmark_count') int? bookmarks,
      @JsonKey(name: 'share_count') int? shares,
      @JsonKey(name: 'view_count') int? views}) {
    return _Content(
      title: title,
      body: body,
      author: author,
      authorAvatar: authorAvatar,
      heroImage: heroImage,
      contentType: contentType,
      publicLink: publicLink,
      createdAt: createdAt,
      updatedAt: updatedAt,
      active: active,
      isNew: isNew,
      estimate: estimate,
      tags: tags,
      likes: likes,
      bookmarks: bookmarks,
      shares: shares,
      views: views,
    );
  }

  Content fromJson(Map<String, Object> json) {
    return Content.fromJson(json);
  }
}

/// @nodoc
const $Content = _$ContentTearOff();

/// @nodoc
mixin _$Content {
// The title of the piece of content
  @JsonKey(name: 'title')
  String? get title =>
      throw _privateConstructorUsedError; // Could be normal text, MD or Html
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_avatar')
  String? get authorAvatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'hero_image')
  String? get heroImage =>
      throw _privateConstructorUsedError; // The type of the content; can be audio/video/article etc
  @JsonKey(name: 'content_type')
  String? get contentType =>
      throw _privateConstructorUsedError; // A link that is safe for sharing
  @JsonKey(name: 'public_link')
  String? get publicLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: true)
  bool? get active =>
      throw _privateConstructorUsedError; // Whether this piece of content is marked as new content
  @JsonKey(name: 'is_new', defaultValue: true)
  bool? get isNew =>
      throw _privateConstructorUsedError; // estimated time to read an article or video/audio length
  @JsonKey(name: 'estimate')
  int? get estimate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<String>? get tags =>
      throw _privateConstructorUsedError; // Metadata about a piece of content
  @JsonKey(name: 'like_count')
  int? get likes => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookmark_count')
  int? get bookmarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_count')
  int? get shares => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int? get views => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'author_avatar') String? authorAvatar,
      @JsonKey(name: 'hero_image') String? heroImage,
      @JsonKey(name: 'content_type') String? contentType,
      @JsonKey(name: 'public_link') String? publicLink,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'active', defaultValue: true) bool? active,
      @JsonKey(name: 'is_new', defaultValue: true) bool? isNew,
      @JsonKey(name: 'estimate') int? estimate,
      @JsonKey(name: 'tags') List<String>? tags,
      @JsonKey(name: 'like_count') int? likes,
      @JsonKey(name: 'bookmark_count') int? bookmarks,
      @JsonKey(name: 'share_count') int? shares,
      @JsonKey(name: 'view_count') int? views});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  final Content _value;
  // ignore: unused_field
  final $Res Function(Content) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? author = freezed,
    Object? authorAvatar = freezed,
    Object? heroImage = freezed,
    Object? contentType = freezed,
    Object? publicLink = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? isNew = freezed,
    Object? estimate = freezed,
    Object? tags = freezed,
    Object? likes = freezed,
    Object? bookmarks = freezed,
    Object? shares = freezed,
    Object? views = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatar: authorAvatar == freezed
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      heroImage: heroImage == freezed
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      publicLink: publicLink == freezed
          ? _value.publicLink
          : publicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNew: isNew == freezed
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      estimate: estimate == freezed
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarks: bookmarks == freezed
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as int?,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int?,
      views: views == freezed
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'author_avatar') String? authorAvatar,
      @JsonKey(name: 'hero_image') String? heroImage,
      @JsonKey(name: 'content_type') String? contentType,
      @JsonKey(name: 'public_link') String? publicLink,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'active', defaultValue: true) bool? active,
      @JsonKey(name: 'is_new', defaultValue: true) bool? isNew,
      @JsonKey(name: 'estimate') int? estimate,
      @JsonKey(name: 'tags') List<String>? tags,
      @JsonKey(name: 'like_count') int? likes,
      @JsonKey(name: 'bookmark_count') int? bookmarks,
      @JsonKey(name: 'share_count') int? shares,
      @JsonKey(name: 'view_count') int? views});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$ContentCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? author = freezed,
    Object? authorAvatar = freezed,
    Object? heroImage = freezed,
    Object? contentType = freezed,
    Object? publicLink = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? isNew = freezed,
    Object? estimate = freezed,
    Object? tags = freezed,
    Object? likes = freezed,
    Object? bookmarks = freezed,
    Object? shares = freezed,
    Object? views = freezed,
  }) {
    return _then(_Content(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatar: authorAvatar == freezed
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      heroImage: heroImage == freezed
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      publicLink: publicLink == freezed
          ? _value.publicLink
          : publicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNew: isNew == freezed
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      estimate: estimate == freezed
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarks: bookmarks == freezed
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as int?,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int?,
      views: views == freezed
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content implements _Content {
  _$_Content(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'body') this.body,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'author_avatar') this.authorAvatar,
      @JsonKey(name: 'hero_image') this.heroImage,
      @JsonKey(name: 'content_type') this.contentType,
      @JsonKey(name: 'public_link') this.publicLink,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'active', defaultValue: true) this.active,
      @JsonKey(name: 'is_new', defaultValue: true) this.isNew,
      @JsonKey(name: 'estimate') this.estimate,
      @JsonKey(name: 'tags') this.tags,
      @JsonKey(name: 'like_count') this.likes,
      @JsonKey(name: 'bookmark_count') this.bookmarks,
      @JsonKey(name: 'share_count') this.shares,
      @JsonKey(name: 'view_count') this.views});

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentFromJson(json);

  @override // The title of the piece of content
  @JsonKey(name: 'title')
  final String? title;
  @override // Could be normal text, MD or Html
  @JsonKey(name: 'body')
  final String? body;
  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'author_avatar')
  final String? authorAvatar;
  @override
  @JsonKey(name: 'hero_image')
  final String? heroImage;
  @override // The type of the content; can be audio/video/article etc
  @JsonKey(name: 'content_type')
  final String? contentType;
  @override // A link that is safe for sharing
  @JsonKey(name: 'public_link')
  final String? publicLink;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'active', defaultValue: true)
  final bool? active;
  @override // Whether this piece of content is marked as new content
  @JsonKey(name: 'is_new', defaultValue: true)
  final bool? isNew;
  @override // estimated time to read an article or video/audio length
  @JsonKey(name: 'estimate')
  final int? estimate;
  @override
  @JsonKey(name: 'tags')
  final List<String>? tags;
  @override // Metadata about a piece of content
  @JsonKey(name: 'like_count')
  final int? likes;
  @override
  @JsonKey(name: 'bookmark_count')
  final int? bookmarks;
  @override
  @JsonKey(name: 'share_count')
  final int? shares;
  @override
  @JsonKey(name: 'view_count')
  final int? views;

  @override
  String toString() {
    return 'Content(title: $title, body: $body, author: $author, authorAvatar: $authorAvatar, heroImage: $heroImage, contentType: $contentType, publicLink: $publicLink, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, isNew: $isNew, estimate: $estimate, tags: $tags, likes: $likes, bookmarks: $bookmarks, shares: $shares, views: $views)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Content &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.authorAvatar, authorAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.authorAvatar, authorAvatar)) &&
            (identical(other.heroImage, heroImage) ||
                const DeepCollectionEquality()
                    .equals(other.heroImage, heroImage)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.publicLink, publicLink) ||
                const DeepCollectionEquality()
                    .equals(other.publicLink, publicLink)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.isNew, isNew) ||
                const DeepCollectionEquality().equals(other.isNew, isNew)) &&
            (identical(other.estimate, estimate) ||
                const DeepCollectionEquality()
                    .equals(other.estimate, estimate)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.bookmarks, bookmarks) ||
                const DeepCollectionEquality()
                    .equals(other.bookmarks, bookmarks)) &&
            (identical(other.shares, shares) ||
                const DeepCollectionEquality().equals(other.shares, shares)) &&
            (identical(other.views, views) ||
                const DeepCollectionEquality().equals(other.views, views)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(authorAvatar) ^
      const DeepCollectionEquality().hash(heroImage) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(publicLink) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(isNew) ^
      const DeepCollectionEquality().hash(estimate) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(bookmarks) ^
      const DeepCollectionEquality().hash(shares) ^
      const DeepCollectionEquality().hash(views);

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentToJson(this);
  }
}

abstract class _Content implements Content {
  factory _Content(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'author_avatar') String? authorAvatar,
      @JsonKey(name: 'hero_image') String? heroImage,
      @JsonKey(name: 'content_type') String? contentType,
      @JsonKey(name: 'public_link') String? publicLink,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'active', defaultValue: true) bool? active,
      @JsonKey(name: 'is_new', defaultValue: true) bool? isNew,
      @JsonKey(name: 'estimate') int? estimate,
      @JsonKey(name: 'tags') List<String>? tags,
      @JsonKey(name: 'like_count') int? likes,
      @JsonKey(name: 'bookmark_count') int? bookmarks,
      @JsonKey(name: 'share_count') int? shares,
      @JsonKey(name: 'view_count') int? views}) = _$_Content;

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override // The title of the piece of content
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override // Could be normal text, MD or Html
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'author_avatar')
  String? get authorAvatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hero_image')
  String? get heroImage => throw _privateConstructorUsedError;
  @override // The type of the content; can be audio/video/article etc
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @override // A link that is safe for sharing
  @JsonKey(name: 'public_link')
  String? get publicLink => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: true)
  bool? get active => throw _privateConstructorUsedError;
  @override // Whether this piece of content is marked as new content
  @JsonKey(name: 'is_new', defaultValue: true)
  bool? get isNew => throw _privateConstructorUsedError;
  @override // estimated time to read an article or video/audio length
  @JsonKey(name: 'estimate')
  int? get estimate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'tags')
  List<String>? get tags => throw _privateConstructorUsedError;
  @override // Metadata about a piece of content
  @JsonKey(name: 'like_count')
  int? get likes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bookmark_count')
  int? get bookmarks => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'share_count')
  int? get shares => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'view_count')
  int? get views => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
