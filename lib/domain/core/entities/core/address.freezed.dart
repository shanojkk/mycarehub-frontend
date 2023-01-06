// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: 'addressType')
  AddressType? get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postalCode')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressType = freezed,
    Object? text = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? county = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      addressType: freezed == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as AddressType?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressType = freezed,
    Object? text = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? county = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_Address(
      addressType: freezed == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as AddressType?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {@JsonKey(name: 'addressType') this.addressType,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'postalCode') this.postalCode,
      @JsonKey(name: 'county') this.county,
      @JsonKey(name: 'active', defaultValue: false) this.active});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  @JsonKey(name: 'addressType')
  final AddressType? addressType;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @override
  @JsonKey(name: 'county')
  final String? county;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;

  @override
  String toString() {
    return 'Address(addressType: $addressType, text: $text, country: $country, postalCode: $postalCode, county: $county, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, addressType, text, country, postalCode, county, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
          {@JsonKey(name: 'addressType') final AddressType? addressType,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'country') final String? country,
          @JsonKey(name: 'postalCode') final String? postalCode,
          @JsonKey(name: 'county') final String? county,
          @JsonKey(name: 'active', defaultValue: false) final bool? active}) =
      _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  @JsonKey(name: 'addressType')
  AddressType? get addressType;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override
  @JsonKey(name: 'postalCode')
  String? get postalCode;
  @override
  @JsonKey(name: 'county')
  String? get county;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
