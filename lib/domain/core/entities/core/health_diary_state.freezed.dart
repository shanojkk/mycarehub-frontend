// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'health_diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthDiaryState _$HealthDiaryStateFromJson(Map<String, dynamic> json) {
  return _HealthDiaryState.fromJson(json);
}

/// @nodoc
mixin _$HealthDiaryState {
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries => throw _privateConstructorUsedError;
  QuoteRelay? get quoteState => throw _privateConstructorUsedError;
  bool? get errorFetchingDiaryEntries => throw _privateConstructorUsedError;
  bool? get timeoutFetchingDiaryEntries => throw _privateConstructorUsedError;
  bool? get shouldShareHealthRecord => throw _privateConstructorUsedError;
  bool? get shouldNotShareHealthRecord => throw _privateConstructorUsedError;
  MoodTypeFilter? get selectedFilter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDiaryStateCopyWith<HealthDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDiaryStateCopyWith<$Res> {
  factory $HealthDiaryStateCopyWith(
          HealthDiaryState value, $Res Function(HealthDiaryState) then) =
      _$HealthDiaryStateCopyWithImpl<$Res, HealthDiaryState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      QuoteRelay? quoteState,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord,
      MoodTypeFilter? selectedFilter});

  $QuoteRelayCopyWith<$Res>? get quoteState;
}

/// @nodoc
class _$HealthDiaryStateCopyWithImpl<$Res, $Val extends HealthDiaryState>
    implements $HealthDiaryStateCopyWith<$Res> {
  _$HealthDiaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
    Object? quoteState = freezed,
    Object? errorFetchingDiaryEntries = freezed,
    Object? timeoutFetchingDiaryEntries = freezed,
    Object? shouldShareHealthRecord = freezed,
    Object? shouldNotShareHealthRecord = freezed,
    Object? selectedFilter = freezed,
  }) {
    return _then(_value.copyWith(
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      quoteState: freezed == quoteState
          ? _value.quoteState
          : quoteState // ignore: cast_nullable_to_non_nullable
              as QuoteRelay?,
      errorFetchingDiaryEntries: freezed == errorFetchingDiaryEntries
          ? _value.errorFetchingDiaryEntries
          : errorFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingDiaryEntries: freezed == timeoutFetchingDiaryEntries
          ? _value.timeoutFetchingDiaryEntries
          : timeoutFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldShareHealthRecord: freezed == shouldShareHealthRecord
          ? _value.shouldShareHealthRecord
          : shouldShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldNotShareHealthRecord: freezed == shouldNotShareHealthRecord
          ? _value.shouldNotShareHealthRecord
          : shouldNotShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedFilter: freezed == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as MoodTypeFilter?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteRelayCopyWith<$Res>? get quoteState {
    if (_value.quoteState == null) {
      return null;
    }

    return $QuoteRelayCopyWith<$Res>(_value.quoteState!, (value) {
      return _then(_value.copyWith(quoteState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HealthDiaryStateCopyWith<$Res>
    implements $HealthDiaryStateCopyWith<$Res> {
  factory _$$_HealthDiaryStateCopyWith(
          _$_HealthDiaryState value, $Res Function(_$_HealthDiaryState) then) =
      __$$_HealthDiaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      QuoteRelay? quoteState,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord,
      MoodTypeFilter? selectedFilter});

  @override
  $QuoteRelayCopyWith<$Res>? get quoteState;
}

/// @nodoc
class __$$_HealthDiaryStateCopyWithImpl<$Res>
    extends _$HealthDiaryStateCopyWithImpl<$Res, _$_HealthDiaryState>
    implements _$$_HealthDiaryStateCopyWith<$Res> {
  __$$_HealthDiaryStateCopyWithImpl(
      _$_HealthDiaryState _value, $Res Function(_$_HealthDiaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
    Object? quoteState = freezed,
    Object? errorFetchingDiaryEntries = freezed,
    Object? timeoutFetchingDiaryEntries = freezed,
    Object? shouldShareHealthRecord = freezed,
    Object? shouldNotShareHealthRecord = freezed,
    Object? selectedFilter = freezed,
  }) {
    return _then(_$_HealthDiaryState(
      entries: freezed == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      quoteState: freezed == quoteState
          ? _value.quoteState
          : quoteState // ignore: cast_nullable_to_non_nullable
              as QuoteRelay?,
      errorFetchingDiaryEntries: freezed == errorFetchingDiaryEntries
          ? _value.errorFetchingDiaryEntries
          : errorFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingDiaryEntries: freezed == timeoutFetchingDiaryEntries
          ? _value.timeoutFetchingDiaryEntries
          : timeoutFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldShareHealthRecord: freezed == shouldShareHealthRecord
          ? _value.shouldShareHealthRecord
          : shouldShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldNotShareHealthRecord: freezed == shouldNotShareHealthRecord
          ? _value.shouldNotShareHealthRecord
          : shouldNotShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedFilter: freezed == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as MoodTypeFilter?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthDiaryState implements _HealthDiaryState {
  _$_HealthDiaryState(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          final List<HealthDiaryEntry?>? entries,
      this.quoteState,
      this.errorFetchingDiaryEntries,
      this.timeoutFetchingDiaryEntries,
      this.shouldShareHealthRecord,
      this.shouldNotShareHealthRecord,
      this.selectedFilter})
      : _entries = entries;

  factory _$_HealthDiaryState.fromJson(Map<String, dynamic> json) =>
      _$$_HealthDiaryStateFromJson(json);

  final List<HealthDiaryEntry?>? _entries;
  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries {
    final value = _entries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final QuoteRelay? quoteState;
  @override
  final bool? errorFetchingDiaryEntries;
  @override
  final bool? timeoutFetchingDiaryEntries;
  @override
  final bool? shouldShareHealthRecord;
  @override
  final bool? shouldNotShareHealthRecord;
  @override
  final MoodTypeFilter? selectedFilter;

  @override
  String toString() {
    return 'HealthDiaryState(entries: $entries, quoteState: $quoteState, errorFetchingDiaryEntries: $errorFetchingDiaryEntries, timeoutFetchingDiaryEntries: $timeoutFetchingDiaryEntries, shouldShareHealthRecord: $shouldShareHealthRecord, shouldNotShareHealthRecord: $shouldNotShareHealthRecord, selectedFilter: $selectedFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthDiaryState &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.quoteState, quoteState) ||
                other.quoteState == quoteState) &&
            (identical(other.errorFetchingDiaryEntries,
                    errorFetchingDiaryEntries) ||
                other.errorFetchingDiaryEntries == errorFetchingDiaryEntries) &&
            (identical(other.timeoutFetchingDiaryEntries,
                    timeoutFetchingDiaryEntries) ||
                other.timeoutFetchingDiaryEntries ==
                    timeoutFetchingDiaryEntries) &&
            (identical(
                    other.shouldShareHealthRecord, shouldShareHealthRecord) ||
                other.shouldShareHealthRecord == shouldShareHealthRecord) &&
            (identical(other.shouldNotShareHealthRecord,
                    shouldNotShareHealthRecord) ||
                other.shouldNotShareHealthRecord ==
                    shouldNotShareHealthRecord) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entries),
      quoteState,
      errorFetchingDiaryEntries,
      timeoutFetchingDiaryEntries,
      shouldShareHealthRecord,
      shouldNotShareHealthRecord,
      selectedFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthDiaryStateCopyWith<_$_HealthDiaryState> get copyWith =>
      __$$_HealthDiaryStateCopyWithImpl<_$_HealthDiaryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthDiaryStateToJson(
      this,
    );
  }
}

abstract class _HealthDiaryState implements HealthDiaryState {
  factory _HealthDiaryState(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          final List<HealthDiaryEntry?>? entries,
      final QuoteRelay? quoteState,
      final bool? errorFetchingDiaryEntries,
      final bool? timeoutFetchingDiaryEntries,
      final bool? shouldShareHealthRecord,
      final bool? shouldNotShareHealthRecord,
      final MoodTypeFilter? selectedFilter}) = _$_HealthDiaryState;

  factory _HealthDiaryState.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryState.fromJson;

  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries;
  @override
  QuoteRelay? get quoteState;
  @override
  bool? get errorFetchingDiaryEntries;
  @override
  bool? get timeoutFetchingDiaryEntries;
  @override
  bool? get shouldShareHealthRecord;
  @override
  bool? get shouldNotShareHealthRecord;
  @override
  MoodTypeFilter? get selectedFilter;
  @override
  @JsonKey(ignore: true)
  _$$_HealthDiaryStateCopyWith<_$_HealthDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
