// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
mixin _$Survey {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'link')
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectID')
  int? get projectID => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkID')
  int? get linkID => throw _privateConstructorUsedError;
  @JsonKey(name: 'formID')
  String? get formID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res, Survey>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'link') String? link,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'projectID') int? projectID,
      @JsonKey(name: 'linkID') int? linkID,
      @JsonKey(name: 'formID') String? formID});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res, $Val extends Survey>
    implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? description = freezed,
    Object? projectID = freezed,
    Object? linkID = freezed,
    Object? formID = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      projectID: freezed == projectID
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as int?,
      linkID: freezed == linkID
          ? _value.linkID
          : linkID // ignore: cast_nullable_to_non_nullable
              as int?,
      formID: freezed == formID
          ? _value.formID
          : formID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$$_SurveyCopyWith(_$_Survey value, $Res Function(_$_Survey) then) =
      __$$_SurveyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'link') String? link,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'projectID') int? projectID,
      @JsonKey(name: 'linkID') int? linkID,
      @JsonKey(name: 'formID') String? formID});
}

/// @nodoc
class __$$_SurveyCopyWithImpl<$Res>
    extends _$SurveyCopyWithImpl<$Res, _$_Survey>
    implements _$$_SurveyCopyWith<$Res> {
  __$$_SurveyCopyWithImpl(_$_Survey _value, $Res Function(_$_Survey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? description = freezed,
    Object? projectID = freezed,
    Object? linkID = freezed,
    Object? formID = freezed,
  }) {
    return _then(_$_Survey(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      projectID: freezed == projectID
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as int?,
      linkID: freezed == linkID
          ? _value.linkID
          : linkID // ignore: cast_nullable_to_non_nullable
              as int?,
      formID: freezed == formID
          ? _value.formID
          : formID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Survey implements _Survey {
  _$_Survey(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'link') this.link,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'projectID') this.projectID,
      @JsonKey(name: 'linkID') this.linkID,
      @JsonKey(name: 'formID') this.formID});

  factory _$_Survey.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'link')
  final String? link;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'projectID')
  final int? projectID;
  @override
  @JsonKey(name: 'linkID')
  final int? linkID;
  @override
  @JsonKey(name: 'formID')
  final String? formID;

  @override
  String toString() {
    return 'Survey(id: $id, title: $title, link: $link, description: $description, projectID: $projectID, linkID: $linkID, formID: $formID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Survey &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.projectID, projectID) ||
                other.projectID == projectID) &&
            (identical(other.linkID, linkID) || other.linkID == linkID) &&
            (identical(other.formID, formID) || other.formID == formID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, link, description, projectID, linkID, formID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyCopyWith<_$_Survey> get copyWith =>
      __$$_SurveyCopyWithImpl<_$_Survey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyToJson(
      this,
    );
  }
}

abstract class _Survey implements Survey {
  factory _Survey(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'link') final String? link,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'projectID') final int? projectID,
      @JsonKey(name: 'linkID') final int? linkID,
      @JsonKey(name: 'formID') final String? formID}) = _$_Survey;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$_Survey.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'link')
  String? get link;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'projectID')
  int? get projectID;
  @override
  @JsonKey(name: 'linkID')
  int? get linkID;
  @override
  @JsonKey(name: 'formID')
  String? get formID;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyCopyWith<_$_Survey> get copyWith =>
      throw _privateConstructorUsedError;
}
