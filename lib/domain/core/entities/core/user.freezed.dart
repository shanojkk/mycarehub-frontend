// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError; // This is the @handle
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'contacts')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondaryContacts')
  List<Contact?>? get secondaryContacts => throw _privateConstructorUsedError;
  @JsonKey(name: 'languages')
  List<String>? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  bool? get hasSetNickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentOrganizationID')
  String? get currentOrganizationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentProgramID')
  String? get currentProgramID => throw _privateConstructorUsedError;

  /// Whether this user needs to change their PIN
  ///
  /// This is normally used to signify that this user is a new user
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  bool? get pinChangeRequired => throw _privateConstructorUsedError;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended', defaultValue: false)
  bool? get suspended => throw _privateConstructorUsedError;
  String? get streamToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? userId,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'contacts')
          Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'currentOrganizationID')
          String? currentOrganizationID,
      @JsonKey(name: 'currentProgramID')
          String? currentProgramID,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended,
      String? streamToken});

  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? secondaryContacts = freezed,
    Object? languages = freezed,
    Object? termsAccepted = freezed,
    Object? hasSetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? isPhoneVerified = freezed,
    Object? currentOrganizationID = freezed,
    Object? currentProgramID = freezed,
    Object? pinChangeRequired = freezed,
    Object? pinUpdateRequired = freezed,
    Object? suspended = freezed,
    Object? streamToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: freezed == primaryContact
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      secondaryContacts: freezed == secondaryContacts
          ? _value.secondaryContacts
          : secondaryContacts // ignore: cast_nullable_to_non_nullable
              as List<Contact?>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: freezed == hasSetPin
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: freezed == hasSetSecurityQuestions
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickname: freezed == hasSetNickname
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentOrganizationID: freezed == currentOrganizationID
          ? _value.currentOrganizationID
          : currentOrganizationID // ignore: cast_nullable_to_non_nullable
              as String?,
      currentProgramID: freezed == currentProgramID
          ? _value.currentProgramID
          : currentProgramID // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: freezed == pinChangeRequired
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      streamToken: freezed == streamToken
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get primaryContact {
    if (_value.primaryContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.primaryContact!, (value) {
      return _then(_value.copyWith(primaryContact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? userId,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'dateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'contacts')
          Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'currentOrganizationID')
          String? currentOrganizationID,
      @JsonKey(name: 'currentProgramID')
          String? currentProgramID,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended,
      String? streamToken});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? secondaryContacts = freezed,
    Object? languages = freezed,
    Object? termsAccepted = freezed,
    Object? hasSetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? isPhoneVerified = freezed,
    Object? currentOrganizationID = freezed,
    Object? currentProgramID = freezed,
    Object? pinChangeRequired = freezed,
    Object? pinUpdateRequired = freezed,
    Object? suspended = freezed,
    Object? streamToken = freezed,
  }) {
    return _then(_$_User(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: freezed == primaryContact
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      secondaryContacts: freezed == secondaryContacts
          ? _value._secondaryContacts
          : secondaryContacts // ignore: cast_nullable_to_non_nullable
              as List<Contact?>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: freezed == hasSetPin
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: freezed == hasSetSecurityQuestions
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickname: freezed == hasSetNickname
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentOrganizationID: freezed == currentOrganizationID
          ? _value.currentOrganizationID
          : currentOrganizationID // ignore: cast_nullable_to_non_nullable
              as String?,
      currentProgramID: freezed == currentProgramID
          ? _value.currentProgramID
          : currentProgramID // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: freezed == pinChangeRequired
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      streamToken: freezed == streamToken
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {@JsonKey(name: 'id')
          this.userId,
      @JsonKey(name: 'username')
          this.username,
      @JsonKey(name: 'avatar')
          this.avatar,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'dateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'contacts')
          this.primaryContact,
      @JsonKey(name: 'secondaryContacts')
          final List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          final List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          this.termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          this.hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          this.hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          this.hasSetNickname,
      @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
          this.isPhoneVerified,
      @JsonKey(name: 'currentOrganizationID')
          this.currentOrganizationID,
      @JsonKey(name: 'currentProgramID')
          this.currentProgramID,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          this.pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          this.pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          this.suspended,
      this.streamToken})
      : _secondaryContacts = secondaryContacts,
        _languages = languages;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? userId;
  @override
  @JsonKey(name: 'username')
  final String? username;
// This is the nickname
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'name')
  final String? name;
// This is the @handle
  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'contacts')
  final Contact? primaryContact;
  final List<Contact?>? _secondaryContacts;
  @override
  @JsonKey(name: 'secondaryContacts')
  List<Contact?>? get secondaryContacts {
    final value = _secondaryContacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _languages;
  @override
  @JsonKey(name: 'languages')
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  final bool? hasSetPin;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  final bool? hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  final bool? hasSetNickname;
  @override
  @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
  final bool? isPhoneVerified;
  @override
  @JsonKey(name: 'currentOrganizationID')
  final String? currentOrganizationID;
  @override
  @JsonKey(name: 'currentProgramID')
  final String? currentProgramID;

  /// Whether this user needs to change their PIN
  ///
  /// This is normally used to signify that this user is a new user
  @override
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  final bool? pinChangeRequired;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @override
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  final bool? pinUpdateRequired;
  @override
  @JsonKey(name: 'suspended', defaultValue: false)
  final bool? suspended;
  @override
  final String? streamToken;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, avatar: $avatar, name: $name, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, active: $active, primaryContact: $primaryContact, secondaryContacts: $secondaryContacts, languages: $languages, termsAccepted: $termsAccepted, hasSetPin: $hasSetPin, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasSetNickname: $hasSetNickname, isPhoneVerified: $isPhoneVerified, currentOrganizationID: $currentOrganizationID, currentProgramID: $currentProgramID, pinChangeRequired: $pinChangeRequired, pinUpdateRequired: $pinUpdateRequired, suspended: $suspended, streamToken: $streamToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.primaryContact, primaryContact) ||
                other.primaryContact == primaryContact) &&
            const DeepCollectionEquality()
                .equals(other._secondaryContacts, _secondaryContacts) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.termsAccepted, termsAccepted) ||
                other.termsAccepted == termsAccepted) &&
            (identical(other.hasSetPin, hasSetPin) ||
                other.hasSetPin == hasSetPin) &&
            (identical(
                    other.hasSetSecurityQuestions, hasSetSecurityQuestions) ||
                other.hasSetSecurityQuestions == hasSetSecurityQuestions) &&
            (identical(other.hasSetNickname, hasSetNickname) ||
                other.hasSetNickname == hasSetNickname) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.currentOrganizationID, currentOrganizationID) ||
                other.currentOrganizationID == currentOrganizationID) &&
            (identical(other.currentProgramID, currentProgramID) ||
                other.currentProgramID == currentProgramID) &&
            (identical(other.pinChangeRequired, pinChangeRequired) ||
                other.pinChangeRequired == pinChangeRequired) &&
            (identical(other.pinUpdateRequired, pinUpdateRequired) ||
                other.pinUpdateRequired == pinUpdateRequired) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.streamToken, streamToken) ||
                other.streamToken == streamToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        username,
        avatar,
        name,
        firstName,
        lastName,
        dateOfBirth,
        gender,
        active,
        primaryContact,
        const DeepCollectionEquality().hash(_secondaryContacts),
        const DeepCollectionEquality().hash(_languages),
        termsAccepted,
        hasSetPin,
        hasSetSecurityQuestions,
        hasSetNickname,
        isPhoneVerified,
        currentOrganizationID,
        currentProgramID,
        pinChangeRequired,
        pinUpdateRequired,
        suspended,
        streamToken
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'id')
          final String? userId,
      @JsonKey(name: 'username')
          final String? username,
      @JsonKey(name: 'avatar')
          final String? avatar,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'firstName')
          final String? firstName,
      @JsonKey(name: 'lastName')
          final String? lastName,
      @JsonKey(name: 'dateOfBirth')
          final String? dateOfBirth,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          final Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'contacts')
          final Contact? primaryContact,
      @JsonKey(name: 'secondaryContacts')
          final List<Contact?>? secondaryContacts,
      @JsonKey(name: 'languages')
          final List<String>? languages,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          final bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          final bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          final bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          final bool? hasSetNickname,
      @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
          final bool? isPhoneVerified,
      @JsonKey(name: 'currentOrganizationID')
          final String? currentOrganizationID,
      @JsonKey(name: 'currentProgramID')
          final String? currentProgramID,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          final bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          final bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          final bool? suspended,
      final String? streamToken}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get userId;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override // This is the nickname
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override // This is the @handle
  @JsonKey(name: 'firstName')
  String? get firstName;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName;
  @override
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'contacts')
  Contact? get primaryContact;
  @override
  @JsonKey(name: 'secondaryContacts')
  List<Contact?>? get secondaryContacts;
  @override
  @JsonKey(name: 'languages')
  List<String>? get languages;
  @override
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  bool? get hasSetPin;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  bool? get hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  bool? get hasSetNickname;
  @override
  @JsonKey(name: 'IsPhoneVerified', defaultValue: false)
  bool? get isPhoneVerified;
  @override
  @JsonKey(name: 'currentOrganizationID')
  String? get currentOrganizationID;
  @override
  @JsonKey(name: 'currentProgramID')
  String? get currentProgramID;
  @override

  /// Whether this user needs to change their PIN
  ///
  /// This is normally used to signify that this user is a new user
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  bool? get pinChangeRequired;
  @override

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired;
  @override
  @JsonKey(name: 'suspended', defaultValue: false)
  bool? get suspended;
  @override
  String? get streamToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
