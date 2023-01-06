// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'viral_load_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViralLoadNode _$ViralLoadNodeFromJson(Map<String, dynamic> json) {
  return _ViralLoadNode.fromJson(json);
}

/// @nodoc
mixin _$ViralLoadNode {
  @JsonKey(name: 'node')
  ViralLoadNodeData? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViralLoadNodeCopyWith<ViralLoadNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViralLoadNodeCopyWith<$Res> {
  factory $ViralLoadNodeCopyWith(
          ViralLoadNode value, $Res Function(ViralLoadNode) then) =
      _$ViralLoadNodeCopyWithImpl<$Res, ViralLoadNode>;
  @useResult
  $Res call({@JsonKey(name: 'node') ViralLoadNodeData? node});

  $ViralLoadNodeDataCopyWith<$Res>? get node;
}

/// @nodoc
class _$ViralLoadNodeCopyWithImpl<$Res, $Val extends ViralLoadNode>
    implements $ViralLoadNodeCopyWith<$Res> {
  _$ViralLoadNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? node = freezed,
  }) {
    return _then(_value.copyWith(
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ViralLoadNodeData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViralLoadNodeDataCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $ViralLoadNodeDataCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViralLoadNodeCopyWith<$Res>
    implements $ViralLoadNodeCopyWith<$Res> {
  factory _$$_ViralLoadNodeCopyWith(
          _$_ViralLoadNode value, $Res Function(_$_ViralLoadNode) then) =
      __$$_ViralLoadNodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'node') ViralLoadNodeData? node});

  @override
  $ViralLoadNodeDataCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_ViralLoadNodeCopyWithImpl<$Res>
    extends _$ViralLoadNodeCopyWithImpl<$Res, _$_ViralLoadNode>
    implements _$$_ViralLoadNodeCopyWith<$Res> {
  __$$_ViralLoadNodeCopyWithImpl(
      _$_ViralLoadNode _value, $Res Function(_$_ViralLoadNode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? node = freezed,
  }) {
    return _then(_$_ViralLoadNode(
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ViralLoadNodeData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViralLoadNode implements _ViralLoadNode {
  _$_ViralLoadNode({@JsonKey(name: 'node') this.node});

  factory _$_ViralLoadNode.fromJson(Map<String, dynamic> json) =>
      _$$_ViralLoadNodeFromJson(json);

  @override
  @JsonKey(name: 'node')
  final ViralLoadNodeData? node;

  @override
  String toString() {
    return 'ViralLoadNode(node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViralLoadNode &&
            (identical(other.node, node) || other.node == node));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, node);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViralLoadNodeCopyWith<_$_ViralLoadNode> get copyWith =>
      __$$_ViralLoadNodeCopyWithImpl<_$_ViralLoadNode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViralLoadNodeToJson(
      this,
    );
  }
}

abstract class _ViralLoadNode implements ViralLoadNode {
  factory _ViralLoadNode(
          {@JsonKey(name: 'node') final ViralLoadNodeData? node}) =
      _$_ViralLoadNode;

  factory _ViralLoadNode.fromJson(Map<String, dynamic> json) =
      _$_ViralLoadNode.fromJson;

  @override
  @JsonKey(name: 'node')
  ViralLoadNodeData? get node;
  @override
  @JsonKey(ignore: true)
  _$$_ViralLoadNodeCopyWith<_$_ViralLoadNode> get copyWith =>
      throw _privateConstructorUsedError;
}
