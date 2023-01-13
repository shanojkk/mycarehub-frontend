// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedContentState _$FeedContentStateFromJson(Map<String, dynamic> json) {
  return _FeedContentState.fromJson(json);
}

/// @nodoc
mixin _$FeedContentState {
  @JsonKey(name: 'items')
  List<Content?>? get contentItems => throw _privateConstructorUsedError;
  ContentCategory? get selectedCategory => throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedContentStateCopyWith<FeedContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedContentStateCopyWith<$Res> {
  factory $FeedContentStateCopyWith(
          FeedContentState value, $Res Function(FeedContentState) then) =
      _$FeedContentStateCopyWithImpl<$Res, FeedContentState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      ContentCategory? selectedCategory,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});

  $ContentCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class _$FeedContentStateCopyWithImpl<$Res, $Val extends FeedContentState>
    implements $FeedContentStateCopyWith<$Res> {
  _$FeedContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentItems = freezed,
    Object? selectedCategory = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_value.copyWith(
      contentItems: freezed == contentItems
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as ContentCategory?,
      errorFetchingContent: freezed == errorFetchingContent
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: freezed == timeoutFetchingContent
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCategoryCopyWith<$Res>? get selectedCategory {
    if (_value.selectedCategory == null) {
      return null;
    }

    return $ContentCategoryCopyWith<$Res>(_value.selectedCategory!, (value) {
      return _then(_value.copyWith(selectedCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeedContentStateCopyWith<$Res>
    implements $FeedContentStateCopyWith<$Res> {
  factory _$$_FeedContentStateCopyWith(
          _$_FeedContentState value, $Res Function(_$_FeedContentState) then) =
      __$$_FeedContentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<Content?>? contentItems,
      ContentCategory? selectedCategory,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});

  @override
  $ContentCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class __$$_FeedContentStateCopyWithImpl<$Res>
    extends _$FeedContentStateCopyWithImpl<$Res, _$_FeedContentState>
    implements _$$_FeedContentStateCopyWith<$Res> {
  __$$_FeedContentStateCopyWithImpl(
      _$_FeedContentState _value, $Res Function(_$_FeedContentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentItems = freezed,
    Object? selectedCategory = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_$_FeedContentState(
      contentItems: freezed == contentItems
          ? _value.contentItems
          : contentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as ContentCategory?,
      errorFetchingContent: freezed == errorFetchingContent
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: freezed == timeoutFetchingContent
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedContentState implements _FeedContentState {
  _$_FeedContentState(
      {@JsonKey(name: 'items') this.contentItems,
      this.selectedCategory,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_FeedContentState.fromJson(Map<String, dynamic> json) =>
      _$$_FeedContentStateFromJson(json);

  @override
  @JsonKey(name: 'items')
  final List<Content?>? contentItems;
  @override
  final ContentCategory? selectedCategory;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'FeedContentState(contentItems: $contentItems, selectedCategory: $selectedCategory, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedContentState &&
            const DeepCollectionEquality()
                .equals(other.contentItems, contentItems) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.errorFetchingContent, errorFetchingContent) ||
                other.errorFetchingContent == errorFetchingContent) &&
            (identical(other.timeoutFetchingContent, timeoutFetchingContent) ||
                other.timeoutFetchingContent == timeoutFetchingContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contentItems),
      selectedCategory,
      errorFetchingContent,
      timeoutFetchingContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedContentStateCopyWith<_$_FeedContentState> get copyWith =>
      __$$_FeedContentStateCopyWithImpl<_$_FeedContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedContentStateToJson(
      this,
    );
  }
}

abstract class _FeedContentState implements FeedContentState {
  factory _FeedContentState(
      {@JsonKey(name: 'items') final List<Content?>? contentItems,
      final ContentCategory? selectedCategory,
      final bool? errorFetchingContent,
      final bool? timeoutFetchingContent}) = _$_FeedContentState;

  factory _FeedContentState.fromJson(Map<String, dynamic> json) =
      _$_FeedContentState.fromJson;

  @override
  @JsonKey(name: 'items')
  List<Content?>? get contentItems;
  @override
  ContentCategory? get selectedCategory;
  @override
  bool? get errorFetchingContent;
  @override
  bool? get timeoutFetchingContent;
  @override
  @JsonKey(ignore: true)
  _$$_FeedContentStateCopyWith<_$_FeedContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
