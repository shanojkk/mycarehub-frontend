// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Community _$CommunityFromJson(Map<String, dynamic> json) {
  return _Community.fromJson(json);
}

/// @nodoc
class _$CommunityTearOff {
  const _$CommunityTearOff();

  _Community call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'createdBy') String? createdBy}) {
    return _Community(
      id: id,
      name: name,
      memberCount: memberCount,
      description: description,
      createdBy: createdBy,
    );
  }

  Community fromJson(Map<String, Object?> json) {
    return Community.fromJson(json);
  }
}

/// @nodoc
const $Community = _$CommunityTearOff();

/// @nodoc
mixin _$Community {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'memberCount')
  int? get memberCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy')
  String? get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityCopyWith<Community> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCopyWith<$Res> {
  factory $CommunityCopyWith(Community value, $Res Function(Community) then) =
      _$CommunityCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'createdBy') String? createdBy});
}

/// @nodoc
class _$CommunityCopyWithImpl<$Res> implements $CommunityCopyWith<$Res> {
  _$CommunityCopyWithImpl(this._value, this._then);

  final Community _value;
  // ignore: unused_field
  final $Res Function(Community) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? memberCount = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CommunityCopyWith<$Res> implements $CommunityCopyWith<$Res> {
  factory _$CommunityCopyWith(
          _Community value, $Res Function(_Community) then) =
      __$CommunityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'createdBy') String? createdBy});
}

/// @nodoc
class __$CommunityCopyWithImpl<$Res> extends _$CommunityCopyWithImpl<$Res>
    implements _$CommunityCopyWith<$Res> {
  __$CommunityCopyWithImpl(_Community _value, $Res Function(_Community) _then)
      : super(_value, (v) => _then(v as _Community));

  @override
  _Community get _value => super._value as _Community;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? memberCount = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_Community(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Community implements _Community {
  _$_Community(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'memberCount') this.memberCount,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'createdBy') this.createdBy});

  factory _$_Community.fromJson(Map<String, dynamic> json) =>
      _$$_CommunityFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'memberCount')
  final int? memberCount;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'createdBy')
  final String? createdBy;

  @override
  String toString() {
    return 'Community(id: $id, name: $name, memberCount: $memberCount, description: $description, createdBy: $createdBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Community &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.memberCount, memberCount) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(memberCount),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdBy));

  @JsonKey(ignore: true)
  @override
  _$CommunityCopyWith<_Community> get copyWith =>
      __$CommunityCopyWithImpl<_Community>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityToJson(this);
  }
}

abstract class _Community implements Community {
  factory _Community(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'memberCount') int? memberCount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'createdBy') String? createdBy}) = _$_Community;

  factory _Community.fromJson(Map<String, dynamic> json) =
      _$_Community.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'memberCount')
  int? get memberCount;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'createdBy')
  String? get createdBy;
  @override
  @JsonKey(ignore: true)
  _$CommunityCopyWith<_Community> get copyWith =>
      throw _privateConstructorUsedError;
}