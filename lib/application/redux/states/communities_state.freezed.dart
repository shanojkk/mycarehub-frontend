// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'communities_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunitiesState _$CommunitiesStateFromJson(Map<String, dynamic> json) {
  return _CommunitiesState.fromJson(json);
}

/// @nodoc
mixin _$CommunitiesState {
  @JsonKey(name: 'invitedCommunities')
  List<Community?>? get invitedCommunities =>
      throw _privateConstructorUsedError;
  List<Message?>? get flaggedMessages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunitiesStateCopyWith<CommunitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunitiesStateCopyWith<$Res> {
  factory $CommunitiesStateCopyWith(
          CommunitiesState value, $Res Function(CommunitiesState) then) =
      _$CommunitiesStateCopyWithImpl<$Res, CommunitiesState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invitedCommunities')
          List<Community?>? invitedCommunities,
      List<Message?>? flaggedMessages});
}

/// @nodoc
class _$CommunitiesStateCopyWithImpl<$Res, $Val extends CommunitiesState>
    implements $CommunitiesStateCopyWith<$Res> {
  _$CommunitiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedCommunities = freezed,
    Object? flaggedMessages = freezed,
  }) {
    return _then(_value.copyWith(
      invitedCommunities: freezed == invitedCommunities
          ? _value.invitedCommunities
          : invitedCommunities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
      flaggedMessages: freezed == flaggedMessages
          ? _value.flaggedMessages
          : flaggedMessages // ignore: cast_nullable_to_non_nullable
              as List<Message?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommunitiesStateCopyWith<$Res>
    implements $CommunitiesStateCopyWith<$Res> {
  factory _$$_CommunitiesStateCopyWith(
          _$_CommunitiesState value, $Res Function(_$_CommunitiesState) then) =
      __$$_CommunitiesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invitedCommunities')
          List<Community?>? invitedCommunities,
      List<Message?>? flaggedMessages});
}

/// @nodoc
class __$$_CommunitiesStateCopyWithImpl<$Res>
    extends _$CommunitiesStateCopyWithImpl<$Res, _$_CommunitiesState>
    implements _$$_CommunitiesStateCopyWith<$Res> {
  __$$_CommunitiesStateCopyWithImpl(
      _$_CommunitiesState _value, $Res Function(_$_CommunitiesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedCommunities = freezed,
    Object? flaggedMessages = freezed,
  }) {
    return _then(_$_CommunitiesState(
      invitedCommunities: freezed == invitedCommunities
          ? _value._invitedCommunities
          : invitedCommunities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
      flaggedMessages: freezed == flaggedMessages
          ? _value._flaggedMessages
          : flaggedMessages // ignore: cast_nullable_to_non_nullable
              as List<Message?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommunitiesState implements _CommunitiesState {
  _$_CommunitiesState(
      {@JsonKey(name: 'invitedCommunities')
          final List<Community?>? invitedCommunities,
      final List<Message?>? flaggedMessages})
      : _invitedCommunities = invitedCommunities,
        _flaggedMessages = flaggedMessages;

  factory _$_CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$$_CommunitiesStateFromJson(json);

  final List<Community?>? _invitedCommunities;
  @override
  @JsonKey(name: 'invitedCommunities')
  List<Community?>? get invitedCommunities {
    final value = _invitedCommunities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Message?>? _flaggedMessages;
  @override
  List<Message?>? get flaggedMessages {
    final value = _flaggedMessages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommunitiesState(invitedCommunities: $invitedCommunities, flaggedMessages: $flaggedMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommunitiesState &&
            const DeepCollectionEquality()
                .equals(other._invitedCommunities, _invitedCommunities) &&
            const DeepCollectionEquality()
                .equals(other._flaggedMessages, _flaggedMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_invitedCommunities),
      const DeepCollectionEquality().hash(_flaggedMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommunitiesStateCopyWith<_$_CommunitiesState> get copyWith =>
      __$$_CommunitiesStateCopyWithImpl<_$_CommunitiesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunitiesStateToJson(
      this,
    );
  }
}

abstract class _CommunitiesState implements CommunitiesState {
  factory _CommunitiesState(
      {@JsonKey(name: 'invitedCommunities')
          final List<Community?>? invitedCommunities,
      final List<Message?>? flaggedMessages}) = _$_CommunitiesState;

  factory _CommunitiesState.fromJson(Map<String, dynamic> json) =
      _$_CommunitiesState.fromJson;

  @override
  @JsonKey(name: 'invitedCommunities')
  List<Community?>? get invitedCommunities;
  @override
  List<Message?>? get flaggedMessages;
  @override
  @JsonKey(ignore: true)
  _$$_CommunitiesStateCopyWith<_$_CommunitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}
