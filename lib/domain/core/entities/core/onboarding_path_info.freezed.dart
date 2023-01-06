// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_path_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingPathInfo {
// The next route to navigate to
  String get nextRoute =>
      throw _privateConstructorUsedError; // The previous route to navigate to
  String get previousRoute =>
      throw _privateConstructorUsedError; // Any route arguments that may need to be passed while navigating
  dynamic get arguments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingPathInfoCopyWith<OnboardingPathInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingPathInfoCopyWith<$Res> {
  factory $OnboardingPathInfoCopyWith(
          OnboardingPathInfo value, $Res Function(OnboardingPathInfo) then) =
      _$OnboardingPathInfoCopyWithImpl<$Res, OnboardingPathInfo>;
  @useResult
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class _$OnboardingPathInfoCopyWithImpl<$Res, $Val extends OnboardingPathInfo>
    implements $OnboardingPathInfoCopyWith<$Res> {
  _$OnboardingPathInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextRoute = null,
    Object? previousRoute = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      nextRoute: null == nextRoute
          ? _value.nextRoute
          : nextRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previousRoute: null == previousRoute
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingPathInfoCopyWith<$Res>
    implements $OnboardingPathInfoCopyWith<$Res> {
  factory _$$_OnboardingPathInfoCopyWith(_$_OnboardingPathInfo value,
          $Res Function(_$_OnboardingPathInfo) then) =
      __$$_OnboardingPathInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class __$$_OnboardingPathInfoCopyWithImpl<$Res>
    extends _$OnboardingPathInfoCopyWithImpl<$Res, _$_OnboardingPathInfo>
    implements _$$_OnboardingPathInfoCopyWith<$Res> {
  __$$_OnboardingPathInfoCopyWithImpl(
      _$_OnboardingPathInfo _value, $Res Function(_$_OnboardingPathInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextRoute = null,
    Object? previousRoute = null,
    Object? arguments = null,
  }) {
    return _then(_$_OnboardingPathInfo(
      nextRoute: null == nextRoute
          ? _value.nextRoute
          : nextRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previousRoute: null == previousRoute
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_OnboardingPathInfo implements _OnboardingPathInfo {
  _$_OnboardingPathInfo(
      {required this.nextRoute,
      required this.previousRoute,
      this.arguments = null});

// The next route to navigate to
  @override
  final String nextRoute;
// The previous route to navigate to
  @override
  final String previousRoute;
// Any route arguments that may need to be passed while navigating
  @override
  @JsonKey()
  final dynamic arguments;

  @override
  String toString() {
    return 'OnboardingPathInfo(nextRoute: $nextRoute, previousRoute: $previousRoute, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingPathInfo &&
            (identical(other.nextRoute, nextRoute) ||
                other.nextRoute == nextRoute) &&
            (identical(other.previousRoute, previousRoute) ||
                other.previousRoute == previousRoute) &&
            const DeepCollectionEquality().equals(other.arguments, arguments));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nextRoute, previousRoute,
      const DeepCollectionEquality().hash(arguments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingPathInfoCopyWith<_$_OnboardingPathInfo> get copyWith =>
      __$$_OnboardingPathInfoCopyWithImpl<_$_OnboardingPathInfo>(
          this, _$identity);
}

abstract class _OnboardingPathInfo implements OnboardingPathInfo {
  factory _OnboardingPathInfo(
      {required final String nextRoute,
      required final String previousRoute,
      final dynamic arguments}) = _$_OnboardingPathInfo;

  @override // The next route to navigate to
  String get nextRoute;
  @override // The previous route to navigate to
  String get previousRoute;
  @override // Any route arguments that may need to be passed while navigating
  dynamic get arguments;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingPathInfoCopyWith<_$_OnboardingPathInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
