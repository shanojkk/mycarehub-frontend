// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reaction _$ReactionFromJson(Map<String, dynamic> json) {
  return _Reaction.fromJson(json);
}

/// @nodoc
mixin _$Reaction {
  /// Identification of the specific substance (or pharmaceutical product)
  ///  considered to be responsible for the Adverse Reaction event.
  ///
  ///  Note: the substance for a specific reaction may be different from the
  ///  substance identified as the cause of the risk, but it must be
  ///  consistent with it. For instance, it may be a more specific
  ///  substance (e.g. a brand medication) or a composite product that
  ///  includes the identified substance. It must be clinically safe to only
  ///  process the 'code' and ignore the 'reaction.substance'.
  ///  If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance.
  @JsonKey(name: 'substance')
  CodeableConcept? get substance => throw _privateConstructorUsedError;

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @JsonKey(name: 'manifestation')
  List<CodeableConcept?>? get manifestation =>
      throw _privateConstructorUsedError;

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @JsonKey(
      name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
  AllergyIntoleranceSeverity? get severity =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReactionCopyWith<Reaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionCopyWith<$Res> {
  factory $ReactionCopyWith(Reaction value, $Res Function(Reaction) then) =
      _$ReactionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'substance')
          CodeableConcept? substance,
      @JsonKey(name: 'manifestation')
          List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
          AllergyIntoleranceSeverity? severity});

  $CodeableConceptCopyWith<$Res>? get substance;
}

/// @nodoc
class _$ReactionCopyWithImpl<$Res> implements $ReactionCopyWith<$Res> {
  _$ReactionCopyWithImpl(this._value, this._then);

  final Reaction _value;
  // ignore: unused_field
  final $Res Function(Reaction) _then;

  @override
  $Res call({
    Object? substance = freezed,
    Object? manifestation = freezed,
    Object? description = freezed,
    Object? severity = freezed,
  }) {
    return _then(_value.copyWith(
      substance: substance == freezed
          ? _value.substance
          : substance // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      manifestation: manifestation == freezed
          ? _value.manifestation
          : manifestation // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceSeverity?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get substance {
    if (_value.substance == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.substance!, (value) {
      return _then(_value.copyWith(substance: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReactionCopyWith<$Res> implements $ReactionCopyWith<$Res> {
  factory _$$_ReactionCopyWith(
          _$_Reaction value, $Res Function(_$_Reaction) then) =
      __$$_ReactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'substance')
          CodeableConcept? substance,
      @JsonKey(name: 'manifestation')
          List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
          AllergyIntoleranceSeverity? severity});

  @override
  $CodeableConceptCopyWith<$Res>? get substance;
}

/// @nodoc
class __$$_ReactionCopyWithImpl<$Res> extends _$ReactionCopyWithImpl<$Res>
    implements _$$_ReactionCopyWith<$Res> {
  __$$_ReactionCopyWithImpl(
      _$_Reaction _value, $Res Function(_$_Reaction) _then)
      : super(_value, (v) => _then(v as _$_Reaction));

  @override
  _$_Reaction get _value => super._value as _$_Reaction;

  @override
  $Res call({
    Object? substance = freezed,
    Object? manifestation = freezed,
    Object? description = freezed,
    Object? severity = freezed,
  }) {
    return _then(_$_Reaction(
      substance: substance == freezed
          ? _value.substance
          : substance // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      manifestation: manifestation == freezed
          ? _value._manifestation
          : manifestation // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceSeverity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reaction implements _Reaction {
  _$_Reaction(
      {@JsonKey(name: 'substance')
          this.substance,
      @JsonKey(name: 'manifestation')
          final List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'description')
          this.description,
      @JsonKey(name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
          this.severity})
      : _manifestation = manifestation;

  factory _$_Reaction.fromJson(Map<String, dynamic> json) =>
      _$$_ReactionFromJson(json);

  /// Identification of the specific substance (or pharmaceutical product)
  ///  considered to be responsible for the Adverse Reaction event.
  ///
  ///  Note: the substance for a specific reaction may be different from the
  ///  substance identified as the cause of the risk, but it must be
  ///  consistent with it. For instance, it may be a more specific
  ///  substance (e.g. a brand medication) or a composite product that
  ///  includes the identified substance. It must be clinically safe to only
  ///  process the 'code' and ignore the 'reaction.substance'.
  ///  If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance.
  @override
  @JsonKey(name: 'substance')
  final CodeableConcept? substance;

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  final List<CodeableConcept?>? _manifestation;

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @override
  @JsonKey(name: 'manifestation')
  List<CodeableConcept?>? get manifestation {
    final value = _manifestation;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @override
  @JsonKey(name: 'description')
  final String? description;

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @override
  @JsonKey(
      name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
  final AllergyIntoleranceSeverity? severity;

  @override
  String toString() {
    return 'Reaction(substance: $substance, manifestation: $manifestation, description: $description, severity: $severity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reaction &&
            const DeepCollectionEquality().equals(other.substance, substance) &&
            const DeepCollectionEquality()
                .equals(other._manifestation, _manifestation) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.severity, severity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(substance),
      const DeepCollectionEquality().hash(_manifestation),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(severity));

  @JsonKey(ignore: true)
  @override
  _$$_ReactionCopyWith<_$_Reaction> get copyWith =>
      __$$_ReactionCopyWithImpl<_$_Reaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReactionToJson(
      this,
    );
  }
}

abstract class _Reaction implements Reaction {
  factory _Reaction(
      {@JsonKey(name: 'substance')
          final CodeableConcept? substance,
      @JsonKey(name: 'manifestation')
          final List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'description')
          final String? description,
      @JsonKey(name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
          final AllergyIntoleranceSeverity? severity}) = _$_Reaction;

  factory _Reaction.fromJson(Map<String, dynamic> json) = _$_Reaction.fromJson;

  @override

  /// Identification of the specific substance (or pharmaceutical product)
  ///  considered to be responsible for the Adverse Reaction event.
  ///
  ///  Note: the substance for a specific reaction may be different from the
  ///  substance identified as the cause of the risk, but it must be
  ///  consistent with it. For instance, it may be a more specific
  ///  substance (e.g. a brand medication) or a composite product that
  ///  includes the identified substance. It must be clinically safe to only
  ///  process the 'code' and ignore the 'reaction.substance'.
  ///  If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance.
  @JsonKey(name: 'substance')
  CodeableConcept? get substance;
  @override

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @JsonKey(name: 'manifestation')
  List<CodeableConcept?>? get manifestation;
  @override

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @JsonKey(name: 'description')
  String? get description;
  @override

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @JsonKey(
      name: 'severity', unknownEnumValue: AllergyIntoleranceSeverity.moderate)
  AllergyIntoleranceSeverity? get severity;
  @override
  @JsonKey(ignore: true)
  _$$_ReactionCopyWith<_$_Reaction> get copyWith =>
      throw _privateConstructorUsedError;
}
