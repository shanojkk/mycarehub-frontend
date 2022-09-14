// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadResponse _$ViralLoadResponseFromJson(Map<String, dynamic> json) {
  return _ViralLoadResponse.fromJson(json);
}

/// @nodoc
mixin _$ViralLoadResponse {
  @JsonKey(name: 'searchFHIRObservation')
  ViralLoadEdges? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadResponseCopyWith<ViralLoadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadResponseCopyWith<$Res> {
  factory $ViralLoadResponseCopyWith(
          ViralLoadResponse value, $Res Function(ViralLoadResponse) then) =
      _$ViralLoadResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'searchFHIRObservation') ViralLoadEdges? data});

  $ViralLoadEdgesCopyWith<$Res>? get data;
}

/// @nodoc
class _$ViralLoadResponseCopyWithImpl<$Res>
    implements $ViralLoadResponseCopyWith<$Res> {
  _$ViralLoadResponseCopyWithImpl(this._value, this._then);

  final ViralLoadResponse _value;
  // ignore: unused_field
  final $Res Function(ViralLoadResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ViralLoadEdges?,
    ));
  }

  @override
  $ViralLoadEdgesCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ViralLoadEdgesCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_ViralLoadResponseCopyWith<$Res>
    implements $ViralLoadResponseCopyWith<$Res> {
  factory _$$_ViralLoadResponseCopyWith(_$_ViralLoadResponse value,
          $Res Function(_$_ViralLoadResponse) then) =
      __$$_ViralLoadResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'searchFHIRObservation') ViralLoadEdges? data});

  @override
  $ViralLoadEdgesCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ViralLoadResponseCopyWithImpl<$Res>
    extends _$ViralLoadResponseCopyWithImpl<$Res>
    implements _$$_ViralLoadResponseCopyWith<$Res> {
  __$$_ViralLoadResponseCopyWithImpl(
      _$_ViralLoadResponse _value, $Res Function(_$_ViralLoadResponse) _then)
      : super(_value, (v) => _then(v as _$_ViralLoadResponse));

  @override
  _$_ViralLoadResponse get _value => super._value as _$_ViralLoadResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_ViralLoadResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ViralLoadEdges?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadResponse implements _ViralLoadResponse {
  _$_ViralLoadResponse({@JsonKey(name: 'searchFHIRObservation') this.data});

  factory _$_ViralLoadResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadResponseFromJson(json);

  @override
  @JsonKey(name: 'searchFHIRObservation')
  final ViralLoadEdges? data;

  @override
  String toString() {
    return 'ViralLoadResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViralLoadResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_ViralLoadResponseCopyWith<_$_ViralLoadResponse> get copyWith =>
      __$$_ViralLoadResponseCopyWithImpl<_$_ViralLoadResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadResponseToJson(
      this,
    );
  }
}

abstract class _ViralLoadResponse implements ViralLoadResponse {
  factory _ViralLoadResponse(
      {@JsonKey(name: 'searchFHIRObservation')
          final ViralLoadEdges? data}) = _$_ViralLoadResponse;

  factory _ViralLoadResponse.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadResponse.fromJson;

  @override
  @JsonKey(name: 'searchFHIRObservation')
  ViralLoadEdges? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ViralLoadResponseCopyWith<_$_ViralLoadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
