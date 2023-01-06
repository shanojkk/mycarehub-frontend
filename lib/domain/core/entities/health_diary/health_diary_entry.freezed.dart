// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'health_diary_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthDiaryEdge _$HealthDiaryEdgeFromJson(Map<String, dynamic> json) {
  return _HealthDiaryEdge.fromJson(json);
}

/// @nodoc
mixin _$HealthDiaryEdge {
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry>? get entries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDiaryEdgeCopyWith<HealthDiaryEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDiaryEdgeCopyWith<$Res> {
  factory $HealthDiaryEdgeCopyWith(
          HealthDiaryEdge value, $Res Function(HealthDiaryEdge) then) =
      _$HealthDiaryEdgeCopyWithImpl<$Res, HealthDiaryEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry>? entries});
}

/// @nodoc
class _$HealthDiaryEdgeCopyWithImpl<$Res, $Val extends HealthDiaryEdge>
    implements $HealthDiaryEdgeCopyWith<$Res> {
  _$HealthDiaryEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_value.copyWith(
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HealthDiaryEdgeCopyWith<$Res>
    implements $HealthDiaryEdgeCopyWith<$Res> {
  factory _$$_HealthDiaryEdgeCopyWith(
          _$_HealthDiaryEdge value, $Res Function(_$_HealthDiaryEdge) then) =
      __$$_HealthDiaryEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry>? entries});
}

/// @nodoc
class __$$_HealthDiaryEdgeCopyWithImpl<$Res>
    extends _$HealthDiaryEdgeCopyWithImpl<$Res, _$_HealthDiaryEdge>
    implements _$$_HealthDiaryEdgeCopyWith<$Res> {
  __$$_HealthDiaryEdgeCopyWithImpl(
      _$_HealthDiaryEdge _value, $Res Function(_$_HealthDiaryEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_$_HealthDiaryEdge(
      entries: freezed == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthDiaryEdge implements _HealthDiaryEdge {
  _$_HealthDiaryEdge(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          final List<HealthDiaryEntry>? entries})
      : _entries = entries;

  factory _$_HealthDiaryEdge.fromJson(Map<String, dynamic> json) =>
      _$$_HealthDiaryEdgeFromJson(json);

  final List<HealthDiaryEntry>? _entries;
  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry>? get entries {
    final value = _entries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HealthDiaryEdge(entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthDiaryEdge &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthDiaryEdgeCopyWith<_$_HealthDiaryEdge> get copyWith =>
      __$$_HealthDiaryEdgeCopyWithImpl<_$_HealthDiaryEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthDiaryEdgeToJson(
      this,
    );
  }
}

abstract class _HealthDiaryEdge implements HealthDiaryEdge {
  factory _HealthDiaryEdge(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          final List<HealthDiaryEntry>? entries}) = _$_HealthDiaryEdge;

  factory _HealthDiaryEdge.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryEdge.fromJson;

  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry>? get entries;
  @override
  @JsonKey(ignore: true)
  _$$_HealthDiaryEdgeCopyWith<_$_HealthDiaryEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthDiaryEntry _$HealthDiaryEntryFromJson(Map<String, dynamic> json) {
  return _HealthDiaryEntry.fromJson(json);
}

/// @nodoc
mixin _$HealthDiaryEntry {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mood')
  String? get mood => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'entryType')
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'sharedAt')
  String? get sharedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
  bool? get shareWithHealthWorker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDiaryEntryCopyWith<HealthDiaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDiaryEntryCopyWith<$Res> {
  factory $HealthDiaryEntryCopyWith(
          HealthDiaryEntry value, $Res Function(HealthDiaryEntry) then) =
      _$HealthDiaryEntryCopyWithImpl<$Res, HealthDiaryEntry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'mood')
          String? mood,
      @JsonKey(name: 'note')
          String? note,
      @JsonKey(name: 'entryType')
          String? entryType,
      @JsonKey(name: 'createdAt')
          String? createdAt,
      @JsonKey(name: 'sharedAt')
          String? sharedAt,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
          bool? shareWithHealthWorker});
}

/// @nodoc
class _$HealthDiaryEntryCopyWithImpl<$Res, $Val extends HealthDiaryEntry>
    implements $HealthDiaryEntryCopyWith<$Res> {
  _$HealthDiaryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mood = freezed,
    Object? note = freezed,
    Object? entryType = freezed,
    Object? createdAt = freezed,
    Object? sharedAt = freezed,
    Object? active = freezed,
    Object? shareWithHealthWorker = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sharedAt: freezed == sharedAt
          ? _value.sharedAt
          : sharedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      shareWithHealthWorker: freezed == shareWithHealthWorker
          ? _value.shareWithHealthWorker
          : shareWithHealthWorker // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HealthDiaryEntryCopyWith<$Res>
    implements $HealthDiaryEntryCopyWith<$Res> {
  factory _$$_HealthDiaryEntryCopyWith(
          _$_HealthDiaryEntry value, $Res Function(_$_HealthDiaryEntry) then) =
      __$$_HealthDiaryEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'mood')
          String? mood,
      @JsonKey(name: 'note')
          String? note,
      @JsonKey(name: 'entryType')
          String? entryType,
      @JsonKey(name: 'createdAt')
          String? createdAt,
      @JsonKey(name: 'sharedAt')
          String? sharedAt,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
          bool? shareWithHealthWorker});
}

/// @nodoc
class __$$_HealthDiaryEntryCopyWithImpl<$Res>
    extends _$HealthDiaryEntryCopyWithImpl<$Res, _$_HealthDiaryEntry>
    implements _$$_HealthDiaryEntryCopyWith<$Res> {
  __$$_HealthDiaryEntryCopyWithImpl(
      _$_HealthDiaryEntry _value, $Res Function(_$_HealthDiaryEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mood = freezed,
    Object? note = freezed,
    Object? entryType = freezed,
    Object? createdAt = freezed,
    Object? sharedAt = freezed,
    Object? active = freezed,
    Object? shareWithHealthWorker = freezed,
  }) {
    return _then(_$_HealthDiaryEntry(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sharedAt: freezed == sharedAt
          ? _value.sharedAt
          : sharedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      shareWithHealthWorker: freezed == shareWithHealthWorker
          ? _value.shareWithHealthWorker
          : shareWithHealthWorker // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthDiaryEntry implements _HealthDiaryEntry {
  _$_HealthDiaryEntry(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'mood')
          this.mood,
      @JsonKey(name: 'note')
          this.note,
      @JsonKey(name: 'entryType')
          this.entryType,
      @JsonKey(name: 'createdAt')
          this.createdAt,
      @JsonKey(name: 'sharedAt')
          this.sharedAt,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
          this.shareWithHealthWorker});

  factory _$_HealthDiaryEntry.fromJson(Map<String, dynamic> json) =>
      _$$_HealthDiaryEntryFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'mood')
  final String? mood;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'entryType')
  final String? entryType;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'sharedAt')
  final String? sharedAt;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
  final bool? shareWithHealthWorker;

  @override
  String toString() {
    return 'HealthDiaryEntry(id: $id, mood: $mood, note: $note, entryType: $entryType, createdAt: $createdAt, sharedAt: $sharedAt, active: $active, shareWithHealthWorker: $shareWithHealthWorker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthDiaryEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sharedAt, sharedAt) ||
                other.sharedAt == sharedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.shareWithHealthWorker, shareWithHealthWorker) ||
                other.shareWithHealthWorker == shareWithHealthWorker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mood, note, entryType,
      createdAt, sharedAt, active, shareWithHealthWorker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthDiaryEntryCopyWith<_$_HealthDiaryEntry> get copyWith =>
      __$$_HealthDiaryEntryCopyWithImpl<_$_HealthDiaryEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthDiaryEntryToJson(
      this,
    );
  }
}

abstract class _HealthDiaryEntry implements HealthDiaryEntry {
  factory _HealthDiaryEntry(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'mood')
          final String? mood,
      @JsonKey(name: 'note')
          final String? note,
      @JsonKey(name: 'entryType')
          final String? entryType,
      @JsonKey(name: 'createdAt')
          final String? createdAt,
      @JsonKey(name: 'sharedAt')
          final String? sharedAt,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
          final bool? shareWithHealthWorker}) = _$_HealthDiaryEntry;

  factory _HealthDiaryEntry.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryEntry.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'mood')
  String? get mood;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'entryType')
  String? get entryType;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'sharedAt')
  String? get sharedAt;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'shareWithHealthWorker', defaultValue: false)
  bool? get shareWithHealthWorker;
  @override
  @JsonKey(ignore: true)
  _$$_HealthDiaryEntryCopyWith<_$_HealthDiaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
