// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authority_permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthorityPermission _$AuthorityPermissionFromJson(Map<String, dynamic> json) {
  return _AuthorityPermission.fromJson(json);
}

/// @nodoc
mixin _$AuthorityPermission {
  @JsonKey(name: 'permissionID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorityPermissionCopyWith<AuthorityPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorityPermissionCopyWith<$Res> {
  factory $AuthorityPermissionCopyWith(
          AuthorityPermission value, $Res Function(AuthorityPermission) then) =
      _$AuthorityPermissionCopyWithImpl<$Res, AuthorityPermission>;
  @useResult
  $Res call(
      {@JsonKey(name: 'permissionID') String? id,
      @JsonKey(name: 'Active', defaultValue: false) bool? active});
}

/// @nodoc
class _$AuthorityPermissionCopyWithImpl<$Res, $Val extends AuthorityPermission>
    implements $AuthorityPermissionCopyWith<$Res> {
  _$AuthorityPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorityPermissionCopyWith<$Res>
    implements $AuthorityPermissionCopyWith<$Res> {
  factory _$$_AuthorityPermissionCopyWith(_$_AuthorityPermission value,
          $Res Function(_$_AuthorityPermission) then) =
      __$$_AuthorityPermissionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'permissionID') String? id,
      @JsonKey(name: 'Active', defaultValue: false) bool? active});
}

/// @nodoc
class __$$_AuthorityPermissionCopyWithImpl<$Res>
    extends _$AuthorityPermissionCopyWithImpl<$Res, _$_AuthorityPermission>
    implements _$$_AuthorityPermissionCopyWith<$Res> {
  __$$_AuthorityPermissionCopyWithImpl(_$_AuthorityPermission _value,
      $Res Function(_$_AuthorityPermission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_AuthorityPermission(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorityPermission implements _AuthorityPermission {
  _$_AuthorityPermission(
      {@JsonKey(name: 'permissionID') this.id,
      @JsonKey(name: 'Active', defaultValue: false) this.active});

  factory _$_AuthorityPermission.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorityPermissionFromJson(json);

  @override
  @JsonKey(name: 'permissionID')
  final String? id;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  final bool? active;

  @override
  String toString() {
    return 'AuthorityPermission(id: $id, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorityPermission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorityPermissionCopyWith<_$_AuthorityPermission> get copyWith =>
      __$$_AuthorityPermissionCopyWithImpl<_$_AuthorityPermission>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorityPermissionToJson(
      this,
    );
  }
}

abstract class _AuthorityPermission implements AuthorityPermission {
  factory _AuthorityPermission(
          {@JsonKey(name: 'permissionID') final String? id,
          @JsonKey(name: 'Active', defaultValue: false) final bool? active}) =
      _$_AuthorityPermission;

  factory _AuthorityPermission.fromJson(Map<String, dynamic> json) =
      _$_AuthorityPermission.fromJson;

  @override
  @JsonKey(name: 'permissionID')
  String? get id;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorityPermissionCopyWith<_$_AuthorityPermission> get copyWith =>
      throw _privateConstructorUsedError;
}
