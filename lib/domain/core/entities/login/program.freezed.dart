// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Program _$ProgramFromJson(Map<String, dynamic> json) {
  return _Program.fromJson(json);
}

/// @nodoc
mixin _$Program {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'organisation')
  Organization? get organization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramCopyWith<Program> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramCopyWith<$Res> {
  factory $ProgramCopyWith(Program value, $Res Function(Program) then) =
      _$ProgramCopyWithImpl<$Res, Program>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'organisation') Organization? organization});

  $OrganizationCopyWith<$Res>? get organization;
}

/// @nodoc
class _$ProgramCopyWithImpl<$Res, $Val extends Program>
    implements $ProgramCopyWith<$Res> {
  _$ProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? organization = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizationCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProgramCopyWith<$Res> implements $ProgramCopyWith<$Res> {
  factory _$$_ProgramCopyWith(
          _$_Program value, $Res Function(_$_Program) then) =
      __$$_ProgramCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'organisation') Organization? organization});

  @override
  $OrganizationCopyWith<$Res>? get organization;
}

/// @nodoc
class __$$_ProgramCopyWithImpl<$Res>
    extends _$ProgramCopyWithImpl<$Res, _$_Program>
    implements _$$_ProgramCopyWith<$Res> {
  __$$_ProgramCopyWithImpl(_$_Program _value, $Res Function(_$_Program) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? organization = freezed,
  }) {
    return _then(_$_Program(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Program implements _Program {
  _$_Program(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'organisation') this.organization});

  factory _$_Program.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'organisation')
  final Organization? organization;

  @override
  String toString() {
    return 'Program(id: $id, active: $active, name: $name, organization: $organization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Program &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, active, name, organization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramCopyWith<_$_Program> get copyWith =>
      __$$_ProgramCopyWithImpl<_$_Program>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramToJson(
      this,
    );
  }
}

abstract class _Program implements Program {
  factory _Program(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'active') final bool? active,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'organisation') final Organization? organization}) =
      _$_Program;

  factory _Program.fromJson(Map<String, dynamic> json) = _$_Program.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'organisation')
  Organization? get organization;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramCopyWith<_$_Program> get copyWith =>
      throw _privateConstructorUsedError;
}
