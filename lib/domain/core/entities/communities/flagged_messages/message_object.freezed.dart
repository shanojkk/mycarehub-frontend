// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageObject _$MessageObjectFromJson(Map<String, dynamic> json) {
  return _MessageObject.fromJson(json);
}

/// @nodoc
mixin _$MessageObject {
  @JsonKey(name: 'message')
  Message? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageObjectCopyWith<MessageObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageObjectCopyWith<$Res> {
  factory $MessageObjectCopyWith(
          MessageObject value, $Res Function(MessageObject) then) =
      _$MessageObjectCopyWithImpl<$Res, MessageObject>;
  @useResult
  $Res call({@JsonKey(name: 'message') Message? message});
}

/// @nodoc
class _$MessageObjectCopyWithImpl<$Res, $Val extends MessageObject>
    implements $MessageObjectCopyWith<$Res> {
  _$MessageObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageObjectCopyWith<$Res>
    implements $MessageObjectCopyWith<$Res> {
  factory _$$_MessageObjectCopyWith(
          _$_MessageObject value, $Res Function(_$_MessageObject) then) =
      __$$_MessageObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message') Message? message});
}

/// @nodoc
class __$$_MessageObjectCopyWithImpl<$Res>
    extends _$MessageObjectCopyWithImpl<$Res, _$_MessageObject>
    implements _$$_MessageObjectCopyWith<$Res> {
  __$$_MessageObjectCopyWithImpl(
      _$_MessageObject _value, $Res Function(_$_MessageObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_MessageObject(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageObject implements _MessageObject {
  _$_MessageObject({@JsonKey(name: 'message') this.message});

  factory _$_MessageObject.fromJson(Map<String, dynamic> json) =>
      _$$_MessageObjectFromJson(json);

  @override
  @JsonKey(name: 'message')
  final Message? message;

  @override
  String toString() {
    return 'MessageObject(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageObject &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageObjectCopyWith<_$_MessageObject> get copyWith =>
      __$$_MessageObjectCopyWithImpl<_$_MessageObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageObjectToJson(
      this,
    );
  }
}

abstract class _MessageObject implements MessageObject {
  factory _MessageObject({@JsonKey(name: 'message') final Message? message}) =
      _$_MessageObject;

  factory _MessageObject.fromJson(Map<String, dynamic> json) =
      _$_MessageObject.fromJson;

  @override
  @JsonKey(name: 'message')
  Message? get message;
  @override
  @JsonKey(ignore: true)
  _$$_MessageObjectCopyWith<_$_MessageObject> get copyWith =>
      throw _privateConstructorUsedError;
}
