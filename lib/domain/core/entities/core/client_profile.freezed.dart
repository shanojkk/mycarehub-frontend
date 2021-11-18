// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientProfile _$ClientProfileFromJson(Map<String, dynamic> json) {
  return _ClientProfile.fromJson(json);
}

/// @nodoc
class _$ClientProfileTearOff {
  const _$ClientProfileTearOff();

  _ClientProfile call(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn}) {
    return _ClientProfile(
      user: user,
      treatmentEnrollmentDate: treatmentEnrollmentDate,
      clientType: clientType,
      active: active,
      addresses: addresses,
      relatedPersons: relatedPersons,
      facilityID: facilityID,
      treatmentBuddy: treatmentBuddy,
      clientCounselled: clientCounselled,
      lastMoodRecordedDate: lastMoodRecordedDate,
      isSignedIn: isSignedIn,
    );
  }

  ClientProfile fromJson(Map<String, Object> json) {
    return ClientProfile.fromJson(json);
  }
}

/// @nodoc
const $ClientProfile = _$ClientProfileTearOff();

/// @nodoc
mixin _$ClientProfile {
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientType')
  ClientType? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  bool? get clientCounselled => throw _privateConstructorUsedError;

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientProfileCopyWith<ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientProfileCopyWith<$Res> {
  factory $ClientProfileCopyWith(
          ClientProfile value, $Res Function(ClientProfile) then) =
      _$ClientProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ClientProfileCopyWithImpl<$Res>
    implements $ClientProfileCopyWith<$Res> {
  _$ClientProfileCopyWithImpl(this._value, this._then);

  final ClientProfile _value;
  // ignore: unused_field
  final $Res Function(ClientProfile) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? clientType = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? relatedPersons = freezed,
    Object? facilityID = freezed,
    Object? treatmentBuddy = freezed,
    Object? clientCounselled = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      treatmentEnrollmentDate: treatmentEnrollmentDate == freezed
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      relatedPersons: relatedPersons == freezed
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCounselled: clientCounselled == freezed
          ? _value.clientCounselled
          : clientCounselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
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
abstract class _$ClientProfileCopyWith<$Res>
    implements $ClientProfileCopyWith<$Res> {
  factory _$ClientProfileCopyWith(
          _ClientProfile value, $Res Function(_ClientProfile) then) =
      __$ClientProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$ClientProfileCopyWithImpl<$Res>
    extends _$ClientProfileCopyWithImpl<$Res>
    implements _$ClientProfileCopyWith<$Res> {
  __$ClientProfileCopyWithImpl(
      _ClientProfile _value, $Res Function(_ClientProfile) _then)
      : super(_value, (v) => _then(v as _ClientProfile));

  @override
  _ClientProfile get _value => super._value as _ClientProfile;

  @override
  $Res call({
    Object? user = freezed,
    Object? treatmentEnrollmentDate = freezed,
    Object? clientType = freezed,
    Object? active = freezed,
    Object? addresses = freezed,
    Object? relatedPersons = freezed,
    Object? facilityID = freezed,
    Object? treatmentBuddy = freezed,
    Object? clientCounselled = freezed,
    Object? lastMoodRecordedDate = freezed,
    Object? isSignedIn = freezed,
  }) {
    return _then(_ClientProfile(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      treatmentEnrollmentDate: treatmentEnrollmentDate == freezed
          ? _value.treatmentEnrollmentDate
          : treatmentEnrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      relatedPersons: relatedPersons == freezed
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<RelatedPerson>?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCounselled: clientCounselled == freezed
          ? _value.clientCounselled
          : clientCounselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientProfile implements _ClientProfile {
  _$_ClientProfile(
      {@JsonKey(name: 'user')
          this.user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          this.treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          this.clientType,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'addresses')
          this.addresses,
      @JsonKey(name: 'relatedPersons')
          this.relatedPersons,
      @JsonKey(name: 'facilityID')
          this.facilityID,
      @JsonKey(name: 'treatmentBuddy')
          this.treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          this.clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          this.lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          this.isSignedIn});

  factory _$_ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientProfileFromJson(json);

  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  final String? treatmentEnrollmentDate;
  @override
  @JsonKey(name: 'clientType')
  final ClientType? clientType;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'addresses')
  final List<Address>? addresses;
  @override
  @JsonKey(name: 'relatedPersons')
  final List<RelatedPerson>? relatedPersons;
  @override
  @JsonKey(name: 'facilityID')
  final String? facilityID;
  @override
  @JsonKey(name: 'treatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  final bool? clientCounselled;
  @override

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  final String? lastMoodRecordedDate;
  @override
  @JsonKey(name: 'isSignedIn')
  final bool? isSignedIn;

  @override
  String toString() {
    return 'ClientProfile(user: $user, treatmentEnrollmentDate: $treatmentEnrollmentDate, clientType: $clientType, active: $active, addresses: $addresses, relatedPersons: $relatedPersons, facilityID: $facilityID, treatmentBuddy: $treatmentBuddy, clientCounselled: $clientCounselled, lastMoodRecordedDate: $lastMoodRecordedDate, isSignedIn: $isSignedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientProfile &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(
                    other.treatmentEnrollmentDate, treatmentEnrollmentDate) ||
                const DeepCollectionEquality().equals(
                    other.treatmentEnrollmentDate, treatmentEnrollmentDate)) &&
            (identical(other.clientType, clientType) ||
                const DeepCollectionEquality()
                    .equals(other.clientType, clientType)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.addresses, addresses) ||
                const DeepCollectionEquality()
                    .equals(other.addresses, addresses)) &&
            (identical(other.relatedPersons, relatedPersons) ||
                const DeepCollectionEquality()
                    .equals(other.relatedPersons, relatedPersons)) &&
            (identical(other.facilityID, facilityID) ||
                const DeepCollectionEquality()
                    .equals(other.facilityID, facilityID)) &&
            (identical(other.treatmentBuddy, treatmentBuddy) ||
                const DeepCollectionEquality()
                    .equals(other.treatmentBuddy, treatmentBuddy)) &&
            (identical(other.clientCounselled, clientCounselled) ||
                const DeepCollectionEquality()
                    .equals(other.clientCounselled, clientCounselled)) &&
            (identical(other.lastMoodRecordedDate, lastMoodRecordedDate) ||
                const DeepCollectionEquality().equals(
                    other.lastMoodRecordedDate, lastMoodRecordedDate)) &&
            (identical(other.isSignedIn, isSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignedIn, isSignedIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(treatmentEnrollmentDate) ^
      const DeepCollectionEquality().hash(clientType) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(addresses) ^
      const DeepCollectionEquality().hash(relatedPersons) ^
      const DeepCollectionEquality().hash(facilityID) ^
      const DeepCollectionEquality().hash(treatmentBuddy) ^
      const DeepCollectionEquality().hash(clientCounselled) ^
      const DeepCollectionEquality().hash(lastMoodRecordedDate) ^
      const DeepCollectionEquality().hash(isSignedIn);

  @JsonKey(ignore: true)
  @override
  _$ClientProfileCopyWith<_ClientProfile> get copyWith =>
      __$ClientProfileCopyWithImpl<_ClientProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClientProfileToJson(this);
  }
}

abstract class _ClientProfile implements ClientProfile {
  factory _ClientProfile(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'treatmentEnrollmentDate')
          String? treatmentEnrollmentDate,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'relatedPersons')
          List<RelatedPerson>? relatedPersons,
      @JsonKey(name: 'facilityID')
          String? facilityID,
      @JsonKey(name: 'treatmentBuddy')
          String? treatmentBuddy,
      @JsonKey(name: 'clientCounselled', defaultValue: false)
          bool? clientCounselled,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate,
      @JsonKey(name: 'isSignedIn')
          bool? isSignedIn}) = _$_ClientProfile;

  factory _ClientProfile.fromJson(Map<String, dynamic> json) =
      _$_ClientProfile.fromJson;

  @override
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'treatmentEnrollmentDate')
  String? get treatmentEnrollmentDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientType')
  ClientType? get clientType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'relatedPersons')
  List<RelatedPerson>? get relatedPersons => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'facilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientCounselled', defaultValue: false)
  bool? get clientCounselled => throw _privateConstructorUsedError;
  @override

  ///others
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isSignedIn')
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientProfileCopyWith<_ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active}) {
    return _Address(
      addressType: addressType,
      text: text,
      country: country,
      postalCode: postalCode,
      county: county,
      active: active,
    );
  }

  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
const $Address = _$AddressTearOff();

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
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

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
      addressType: addressType == freezed
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as AddressType?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object? addressType = freezed,
    Object? text = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? county = freezed,
    Object? active = freezed,
  }) {
    return _then(_Address(
      addressType: addressType == freezed
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as AddressType?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
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
      _$_$_AddressFromJson(json);

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
        (other is _Address &&
            (identical(other.addressType, addressType) ||
                const DeepCollectionEquality()
                    .equals(other.addressType, addressType)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.county, county) ||
                const DeepCollectionEquality().equals(other.county, county)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(addressType) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(county) ^
      const DeepCollectionEquality().hash(active);

  @JsonKey(ignore: true)
  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
      {@JsonKey(name: 'addressType') AddressType? addressType,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'active', defaultValue: false) bool? active}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  @JsonKey(name: 'addressType')
  AddressType? get addressType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'postalCode')
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressCopyWith<_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

RelatedPerson _$RelatedPersonFromJson(Map<String, dynamic> json) {
  return _RelatedPerson.fromJson(json);
}

/// @nodoc
class _$RelatedPersonTearOff {
  const _$RelatedPersonTearOff();

  _RelatedPerson call(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts}) {
    return _RelatedPerson(
      active: active,
      relatedTo: relatedTo,
      relationshipType: relationshipType,
      firstName: firstName,
      lastName: lastName,
      otherName: otherName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      addresses: addresses,
      contacts: contacts,
    );
  }

  RelatedPerson fromJson(Map<String, Object> json) {
    return RelatedPerson.fromJson(json);
  }
}

/// @nodoc
const $RelatedPerson = _$RelatedPersonTearOff();

/// @nodoc
mixin _$RelatedPerson {
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'relatedTo')
  String? get relatedTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  RelationshipType? get relationshipType => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'otherName')
  String? get otherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'contacts')
  List<Contact>? get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelatedPersonCopyWith<RelatedPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedPersonCopyWith<$Res> {
  factory $RelatedPersonCopyWith(
          RelatedPerson value, $Res Function(RelatedPerson) then) =
      _$RelatedPersonCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts});
}

/// @nodoc
class _$RelatedPersonCopyWithImpl<$Res>
    implements $RelatedPersonCopyWith<$Res> {
  _$RelatedPersonCopyWithImpl(this._value, this._then);

  final RelatedPerson _value;
  // ignore: unused_field
  final $Res Function(RelatedPerson) _then;

  @override
  $Res call({
    Object? active = freezed,
    Object? relatedTo = freezed,
    Object? relationshipType = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? otherName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? addresses = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      relatedTo: relatedTo == freezed
          ? _value.relatedTo
          : relatedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      relationshipType: relationshipType == freezed
          ? _value.relationshipType
          : relationshipType // ignore: cast_nullable_to_non_nullable
              as RelationshipType?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherName: otherName == freezed
          ? _value.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ));
  }
}

/// @nodoc
abstract class _$RelatedPersonCopyWith<$Res>
    implements $RelatedPersonCopyWith<$Res> {
  factory _$RelatedPersonCopyWith(
          _RelatedPerson value, $Res Function(_RelatedPerson) then) =
      __$RelatedPersonCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts});
}

/// @nodoc
class __$RelatedPersonCopyWithImpl<$Res>
    extends _$RelatedPersonCopyWithImpl<$Res>
    implements _$RelatedPersonCopyWith<$Res> {
  __$RelatedPersonCopyWithImpl(
      _RelatedPerson _value, $Res Function(_RelatedPerson) _then)
      : super(_value, (v) => _then(v as _RelatedPerson));

  @override
  _RelatedPerson get _value => super._value as _RelatedPerson;

  @override
  $Res call({
    Object? active = freezed,
    Object? relatedTo = freezed,
    Object? relationshipType = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? otherName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? addresses = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_RelatedPerson(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      relatedTo: relatedTo == freezed
          ? _value.relatedTo
          : relatedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      relationshipType: relationshipType == freezed
          ? _value.relationshipType
          : relationshipType // ignore: cast_nullable_to_non_nullable
              as RelationshipType?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherName: otherName == freezed
          ? _value.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: addresses == freezed
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>?,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RelatedPerson implements _RelatedPerson {
  _$_RelatedPerson(
      {@JsonKey(name: 'active')
          this.active,
      @JsonKey(name: 'relatedTo')
          this.relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          this.relationshipType,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'otherName')
          this.otherName,
      @JsonKey(name: 'gender')
          this.gender,
      @JsonKey(name: 'dateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'addresses')
          this.addresses,
      @JsonKey(name: 'contacts')
          this.contacts});

  factory _$_RelatedPerson.fromJson(Map<String, dynamic> json) =>
      _$_$_RelatedPersonFromJson(json);

  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'relatedTo')
  final String? relatedTo;
  @override
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  final RelationshipType? relationshipType;
  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'otherName')
  final String? otherName;
  @override
  @JsonKey(name: 'gender')
  final Gender? gender;
  @override
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'addresses')
  final List<Address>? addresses;
  @override
  @JsonKey(name: 'contacts')
  final List<Contact>? contacts;

  @override
  String toString() {
    return 'RelatedPerson(active: $active, relatedTo: $relatedTo, relationshipType: $relationshipType, firstName: $firstName, lastName: $lastName, otherName: $otherName, gender: $gender, dateOfBirth: $dateOfBirth, addresses: $addresses, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RelatedPerson &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.relatedTo, relatedTo) ||
                const DeepCollectionEquality()
                    .equals(other.relatedTo, relatedTo)) &&
            (identical(other.relationshipType, relationshipType) ||
                const DeepCollectionEquality()
                    .equals(other.relationshipType, relationshipType)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.otherName, otherName) ||
                const DeepCollectionEquality()
                    .equals(other.otherName, otherName)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.addresses, addresses) ||
                const DeepCollectionEquality()
                    .equals(other.addresses, addresses)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(relatedTo) ^
      const DeepCollectionEquality().hash(relationshipType) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(otherName) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(addresses) ^
      const DeepCollectionEquality().hash(contacts);

  @JsonKey(ignore: true)
  @override
  _$RelatedPersonCopyWith<_RelatedPerson> get copyWith =>
      __$RelatedPersonCopyWithImpl<_RelatedPerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RelatedPersonToJson(this);
  }
}

abstract class _RelatedPerson implements RelatedPerson {
  factory _RelatedPerson(
      {@JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'relatedTo')
          String? relatedTo,
      @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
          RelationshipType? relationshipType,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'otherName')
          String? otherName,
      @JsonKey(name: 'gender')
          Gender? gender,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'addresses')
          List<Address>? addresses,
      @JsonKey(name: 'contacts')
          List<Contact>? contacts}) = _$_RelatedPerson;

  factory _RelatedPerson.fromJson(Map<String, dynamic> json) =
      _$_RelatedPerson.fromJson;

  @override
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'relatedTo')
  String? get relatedTo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
  RelationshipType? get relationshipType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'otherName')
  String? get otherName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gender')
  Gender? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'addresses')
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'contacts')
  List<Contact>? get contacts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RelatedPersonCopyWith<_RelatedPerson> get copyWith =>
      throw _privateConstructorUsedError;
}
