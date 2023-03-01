// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatState _$ChatStateFromJson(Map<String, dynamic> json) {
  return _ChatState.fromJson(json);
}

/// @nodoc
mixin _$ChatState {
  @JsonKey(name: 'userProfile')
  User? get userProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupInfoMembers')
  List<RoomUser>? get groupInfoMembers => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchMemberResults')
  List<User>? get searchMemberResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'messages')
  List<Message>? get messages => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  @JsonKey(name: 'images')
  List<Map<String, Uint8List?>?>? get images =>
      throw _privateConstructorUsedError; // Final string lastSyncTime for chats
  @JsonKey(name: 'lastSyncTime')
  String? get lastSyncTime =>
      throw _privateConstructorUsedError; // Specific for rooms
  @JsonKey(name: 'syncResponse')
  SyncResponse? get syncResponse =>
      throw _privateConstructorUsedError; // Specific for the sync observer settings
  @JsonKey(name: 'syncState')
  SyncState? get syncState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userProfile')
          User? userProfile,
      @JsonKey(name: 'groupInfoMembers')
          List<RoomUser>? groupInfoMembers,
      @JsonKey(name: 'searchMemberResults')
          List<User>? searchMemberResults,
      @JsonKey(name: 'messages')
          List<Message>? messages,
      @Uint8ListConverter()
      @JsonKey(name: 'images')
          List<Map<String, Uint8List?>?>? images,
      @JsonKey(name: 'lastSyncTime')
          String? lastSyncTime,
      @JsonKey(name: 'syncResponse')
          SyncResponse? syncResponse,
      @JsonKey(name: 'syncState')
          SyncState? syncState});

  $UserCopyWith<$Res>? get userProfile;
  $SyncResponseCopyWith<$Res>? get syncResponse;
  $SyncStateCopyWith<$Res>? get syncState;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? groupInfoMembers = freezed,
    Object? searchMemberResults = freezed,
    Object? messages = freezed,
    Object? images = freezed,
    Object? lastSyncTime = freezed,
    Object? syncResponse = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as User?,
      groupInfoMembers: freezed == groupInfoMembers
          ? _value.groupInfoMembers
          : groupInfoMembers // ignore: cast_nullable_to_non_nullable
              as List<RoomUser>?,
      searchMemberResults: freezed == searchMemberResults
          ? _value.searchMemberResults
          : searchMemberResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Uint8List?>?>?,
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as String?,
      syncResponse: freezed == syncResponse
          ? _value.syncResponse
          : syncResponse // ignore: cast_nullable_to_non_nullable
              as SyncResponse?,
      syncState: freezed == syncState
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as SyncState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SyncResponseCopyWith<$Res>? get syncResponse {
    if (_value.syncResponse == null) {
      return null;
    }

    return $SyncResponseCopyWith<$Res>(_value.syncResponse!, (value) {
      return _then(_value.copyWith(syncResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SyncStateCopyWith<$Res>? get syncState {
    if (_value.syncState == null) {
      return null;
    }

    return $SyncStateCopyWith<$Res>(_value.syncState!, (value) {
      return _then(_value.copyWith(syncState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userProfile')
          User? userProfile,
      @JsonKey(name: 'groupInfoMembers')
          List<RoomUser>? groupInfoMembers,
      @JsonKey(name: 'searchMemberResults')
          List<User>? searchMemberResults,
      @JsonKey(name: 'messages')
          List<Message>? messages,
      @Uint8ListConverter()
      @JsonKey(name: 'images')
          List<Map<String, Uint8List?>?>? images,
      @JsonKey(name: 'lastSyncTime')
          String? lastSyncTime,
      @JsonKey(name: 'syncResponse')
          SyncResponse? syncResponse,
      @JsonKey(name: 'syncState')
          SyncState? syncState});

  @override
  $UserCopyWith<$Res>? get userProfile;
  @override
  $SyncResponseCopyWith<$Res>? get syncResponse;
  @override
  $SyncStateCopyWith<$Res>? get syncState;
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatState>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? groupInfoMembers = freezed,
    Object? searchMemberResults = freezed,
    Object? messages = freezed,
    Object? images = freezed,
    Object? lastSyncTime = freezed,
    Object? syncResponse = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_$_ChatState(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as User?,
      groupInfoMembers: freezed == groupInfoMembers
          ? _value.groupInfoMembers
          : groupInfoMembers // ignore: cast_nullable_to_non_nullable
              as List<RoomUser>?,
      searchMemberResults: freezed == searchMemberResults
          ? _value.searchMemberResults
          : searchMemberResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Uint8List?>?>?,
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as String?,
      syncResponse: freezed == syncResponse
          ? _value.syncResponse
          : syncResponse // ignore: cast_nullable_to_non_nullable
              as SyncResponse?,
      syncState: freezed == syncState
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as SyncState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatState with DiagnosticableTreeMixin implements _ChatState {
  _$_ChatState(
      {@JsonKey(name: 'userProfile') this.userProfile,
      @JsonKey(name: 'groupInfoMembers') this.groupInfoMembers,
      @JsonKey(name: 'searchMemberResults') this.searchMemberResults,
      @JsonKey(name: 'messages') this.messages,
      @Uint8ListConverter() @JsonKey(name: 'images') this.images,
      @JsonKey(name: 'lastSyncTime') this.lastSyncTime,
      @JsonKey(name: 'syncResponse') this.syncResponse,
      @JsonKey(name: 'syncState') this.syncState});

  factory _$_ChatState.fromJson(Map<String, dynamic> json) =>
      _$$_ChatStateFromJson(json);

  @override
  @JsonKey(name: 'userProfile')
  final User? userProfile;
  @override
  @JsonKey(name: 'groupInfoMembers')
  final List<RoomUser>? groupInfoMembers;
  @override
  @JsonKey(name: 'searchMemberResults')
  final List<User>? searchMemberResults;
  @override
  @JsonKey(name: 'messages')
  final List<Message>? messages;
  @override
  @Uint8ListConverter()
  @JsonKey(name: 'images')
  final List<Map<String, Uint8List?>?>? images;
// Final string lastSyncTime for chats
  @override
  @JsonKey(name: 'lastSyncTime')
  final String? lastSyncTime;
// Specific for rooms
  @override
  @JsonKey(name: 'syncResponse')
  final SyncResponse? syncResponse;
// Specific for the sync observer settings
  @override
  @JsonKey(name: 'syncState')
  final SyncState? syncState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState(userProfile: $userProfile, groupInfoMembers: $groupInfoMembers, searchMemberResults: $searchMemberResults, messages: $messages, images: $images, lastSyncTime: $lastSyncTime, syncResponse: $syncResponse, syncState: $syncState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState'))
      ..add(DiagnosticsProperty('userProfile', userProfile))
      ..add(DiagnosticsProperty('groupInfoMembers', groupInfoMembers))
      ..add(DiagnosticsProperty('searchMemberResults', searchMemberResults))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('lastSyncTime', lastSyncTime))
      ..add(DiagnosticsProperty('syncResponse', syncResponse))
      ..add(DiagnosticsProperty('syncState', syncState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            const DeepCollectionEquality()
                .equals(other.groupInfoMembers, groupInfoMembers) &&
            const DeepCollectionEquality()
                .equals(other.searchMemberResults, searchMemberResults) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.syncResponse, syncResponse) ||
                other.syncResponse == syncResponse) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProfile,
      const DeepCollectionEquality().hash(groupInfoMembers),
      const DeepCollectionEquality().hash(searchMemberResults),
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(images),
      lastSyncTime,
      syncResponse,
      syncState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatStateToJson(
      this,
    );
  }
}

abstract class _ChatState implements ChatState {
  factory _ChatState(
      {@JsonKey(name: 'userProfile')
          final User? userProfile,
      @JsonKey(name: 'groupInfoMembers')
          final List<RoomUser>? groupInfoMembers,
      @JsonKey(name: 'searchMemberResults')
          final List<User>? searchMemberResults,
      @JsonKey(name: 'messages')
          final List<Message>? messages,
      @Uint8ListConverter()
      @JsonKey(name: 'images')
          final List<Map<String, Uint8List?>?>? images,
      @JsonKey(name: 'lastSyncTime')
          final String? lastSyncTime,
      @JsonKey(name: 'syncResponse')
          final SyncResponse? syncResponse,
      @JsonKey(name: 'syncState')
          final SyncState? syncState}) = _$_ChatState;

  factory _ChatState.fromJson(Map<String, dynamic> json) =
      _$_ChatState.fromJson;

  @override
  @JsonKey(name: 'userProfile')
  User? get userProfile;
  @override
  @JsonKey(name: 'groupInfoMembers')
  List<RoomUser>? get groupInfoMembers;
  @override
  @JsonKey(name: 'searchMemberResults')
  List<User>? get searchMemberResults;
  @override
  @JsonKey(name: 'messages')
  List<Message>? get messages;
  @override
  @Uint8ListConverter()
  @JsonKey(name: 'images')
  List<Map<String, Uint8List?>?>? get images;
  @override // Final string lastSyncTime for chats
  @JsonKey(name: 'lastSyncTime')
  String? get lastSyncTime;
  @override // Specific for rooms
  @JsonKey(name: 'syncResponse')
  SyncResponse? get syncResponse;
  @override // Specific for the sync observer settings
  @JsonKey(name: 'syncState')
  SyncState? get syncState;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
