// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'caregiver_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaregiverState _$CaregiverStateFromJson(Map<String, dynamic> json) {
  return _CaregiverState.fromJson(json);
}

/// @nodoc
mixin _$CaregiverState {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiver_number')
  String? get caregiverNumber => throw _privateConstructorUsedError;
  List<ManagedClient>? get managedClients => throw _privateConstructorUsedError;
  String? get selectedClientId => throw _privateConstructorUsedError;
  bool? get errorFetchingClients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaregiverStateCopyWith<CaregiverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaregiverStateCopyWith<$Res> {
  factory $CaregiverStateCopyWith(
          CaregiverState value, $Res Function(CaregiverState) then) =
      _$CaregiverStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'caregiver_number') String? caregiverNumber,
      List<ManagedClient>? managedClients,
      String? selectedClientId,
      bool? errorFetchingClients});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CaregiverStateCopyWithImpl<$Res>
    implements $CaregiverStateCopyWith<$Res> {
  _$CaregiverStateCopyWithImpl(this._value, this._then);

  final CaregiverState _value;
  // ignore: unused_field
  final $Res Function(CaregiverState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? caregiverNumber = freezed,
    Object? managedClients = freezed,
    Object? selectedClientId = freezed,
    Object? errorFetchingClients = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      caregiverNumber: caregiverNumber == freezed
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      managedClients: managedClients == freezed
          ? _value.managedClients
          : managedClients // ignore: cast_nullable_to_non_nullable
              as List<ManagedClient>?,
      selectedClientId: selectedClientId == freezed
          ? _value.selectedClientId
          : selectedClientId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorFetchingClients: errorFetchingClients == freezed
          ? _value.errorFetchingClients
          : errorFetchingClients // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_CaregiverStateCopyWith<$Res>
    implements $CaregiverStateCopyWith<$Res> {
  factory _$$_CaregiverStateCopyWith(
          _$_CaregiverState value, $Res Function(_$_CaregiverState) then) =
      __$$_CaregiverStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'caregiver_number') String? caregiverNumber,
      List<ManagedClient>? managedClients,
      String? selectedClientId,
      bool? errorFetchingClients});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CaregiverStateCopyWithImpl<$Res>
    extends _$CaregiverStateCopyWithImpl<$Res>
    implements _$$_CaregiverStateCopyWith<$Res> {
  __$$_CaregiverStateCopyWithImpl(
      _$_CaregiverState _value, $Res Function(_$_CaregiverState) _then)
      : super(_value, (v) => _then(v as _$_CaregiverState));

  @override
  _$_CaregiverState get _value => super._value as _$_CaregiverState;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? caregiverNumber = freezed,
    Object? managedClients = freezed,
    Object? selectedClientId = freezed,
    Object? errorFetchingClients = freezed,
  }) {
    return _then(_$_CaregiverState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      caregiverNumber: caregiverNumber == freezed
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      managedClients: managedClients == freezed
          ? _value._managedClients
          : managedClients // ignore: cast_nullable_to_non_nullable
              as List<ManagedClient>?,
      selectedClientId: selectedClientId == freezed
          ? _value.selectedClientId
          : selectedClientId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorFetchingClients: errorFetchingClients == freezed
          ? _value.errorFetchingClients
          : errorFetchingClients // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaregiverState implements _CaregiverState {
  _$_CaregiverState(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'caregiver_number') this.caregiverNumber,
      final List<ManagedClient>? managedClients,
      this.selectedClientId,
      this.errorFetchingClients})
      : _managedClients = managedClients;

  factory _$_CaregiverState.fromJson(Map<String, dynamic> json) =>
      _$$_CaregiverStateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'caregiver_number')
  final String? caregiverNumber;
  final List<ManagedClient>? _managedClients;
  @override
  List<ManagedClient>? get managedClients {
    final value = _managedClients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? selectedClientId;
  @override
  final bool? errorFetchingClients;

  @override
  String toString() {
    return 'CaregiverState(id: $id, user: $user, caregiverNumber: $caregiverNumber, managedClients: $managedClients, selectedClientId: $selectedClientId, errorFetchingClients: $errorFetchingClients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CaregiverState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.caregiverNumber, caregiverNumber) &&
            const DeepCollectionEquality()
                .equals(other._managedClients, _managedClients) &&
            const DeepCollectionEquality()
                .equals(other.selectedClientId, selectedClientId) &&
            const DeepCollectionEquality()
                .equals(other.errorFetchingClients, errorFetchingClients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(caregiverNumber),
      const DeepCollectionEquality().hash(_managedClients),
      const DeepCollectionEquality().hash(selectedClientId),
      const DeepCollectionEquality().hash(errorFetchingClients));

  @JsonKey(ignore: true)
  @override
  _$$_CaregiverStateCopyWith<_$_CaregiverState> get copyWith =>
      __$$_CaregiverStateCopyWithImpl<_$_CaregiverState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaregiverStateToJson(
      this,
    );
  }
}

abstract class _CaregiverState implements CaregiverState {
  factory _CaregiverState(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'user') final User? user,
      @JsonKey(name: 'caregiver_number') final String? caregiverNumber,
      final List<ManagedClient>? managedClients,
      final String? selectedClientId,
      final bool? errorFetchingClients}) = _$_CaregiverState;

  factory _CaregiverState.fromJson(Map<String, dynamic> json) =
      _$_CaregiverState.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'user')
  User? get user;
  @override
  @JsonKey(name: 'caregiver_number')
  String? get caregiverNumber;
  @override
  List<ManagedClient>? get managedClients;
  @override
  String? get selectedClientId;
  @override
  bool? get errorFetchingClients;
  @override
  @JsonKey(ignore: true)
  _$$_CaregiverStateCopyWith<_$_CaregiverState> get copyWith =>
      throw _privateConstructorUsedError;
}
