// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return _Invitations.fromJson(json);
}

/// @nodoc
mixin _$Invitation {
  String get invitationId => throw _privateConstructorUsedError;
  String get invitationCode => throw _privateConstructorUsedError;
  String get storeAddress => throw _privateConstructorUsedError;
  String get storeImageUrl => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  bool get isCanceled => throw _privateConstructorUsedError;
  bool get isJoined => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  @unionTimestampConverter
  UnionTimestamp get invitationSchedule => throw _privateConstructorUsedError;
  @unionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res, Invitation>;
  @useResult
  $Res call(
      {String invitationId,
      String invitationCode,
      String storeAddress,
      String storeImageUrl,
      String storeName,
      bool isApproved,
      bool isCanceled,
      bool isJoined,
      bool isFinished,
      @unionTimestampConverter UnionTimestamp invitationSchedule,
      @unionTimestampConverter UnionTimestamp createdAt,
      List<String> userIds});

  $UnionTimestampCopyWith<$Res> get invitationSchedule;
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res, $Val extends Invitation>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? invitationCode = null,
    Object? storeAddress = null,
    Object? storeImageUrl = null,
    Object? storeName = null,
    Object? isApproved = null,
    Object? isCanceled = null,
    Object? isJoined = null,
    Object? isFinished = null,
    Object? invitationSchedule = null,
    Object? createdAt = null,
    Object? userIds = null,
  }) {
    return _then(_value.copyWith(
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      storeAddress: null == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      storeImageUrl: null == storeImageUrl
          ? _value.storeImageUrl
          : storeImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      isJoined: null == isJoined
          ? _value.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      invitationSchedule: null == invitationSchedule
          ? _value.invitationSchedule
          : invitationSchedule // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get invitationSchedule {
    return $UnionTimestampCopyWith<$Res>(_value.invitationSchedule, (value) {
      return _then(_value.copyWith(invitationSchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InvitationsCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$_InvitationsCopyWith(
          _$_Invitations value, $Res Function(_$_Invitations) then) =
      __$$_InvitationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invitationId,
      String invitationCode,
      String storeAddress,
      String storeImageUrl,
      String storeName,
      bool isApproved,
      bool isCanceled,
      bool isJoined,
      bool isFinished,
      @unionTimestampConverter UnionTimestamp invitationSchedule,
      @unionTimestampConverter UnionTimestamp createdAt,
      List<String> userIds});

  @override
  $UnionTimestampCopyWith<$Res> get invitationSchedule;
  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_InvitationsCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$_Invitations>
    implements _$$_InvitationsCopyWith<$Res> {
  __$$_InvitationsCopyWithImpl(
      _$_Invitations _value, $Res Function(_$_Invitations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? invitationCode = null,
    Object? storeAddress = null,
    Object? storeImageUrl = null,
    Object? storeName = null,
    Object? isApproved = null,
    Object? isCanceled = null,
    Object? isJoined = null,
    Object? isFinished = null,
    Object? invitationSchedule = null,
    Object? createdAt = null,
    Object? userIds = null,
  }) {
    return _then(_$_Invitations(
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      storeAddress: null == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      storeImageUrl: null == storeImageUrl
          ? _value.storeImageUrl
          : storeImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      isJoined: null == isJoined
          ? _value.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      invitationSchedule: null == invitationSchedule
          ? _value.invitationSchedule
          : invitationSchedule // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Invitations implements _Invitations {
  const _$_Invitations(
      {this.invitationId = '',
      this.invitationCode = '',
      this.storeAddress = '',
      this.storeImageUrl = '',
      this.storeName = '',
      this.isApproved = false,
      this.isCanceled = false,
      this.isJoined = false,
      this.isFinished = false,
      @unionTimestampConverter
          this.invitationSchedule = const UnionTimestamp.serverTimestamp(),
      @unionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp(),
      final List<String> userIds = const <String>[]})
      : _userIds = userIds;

  factory _$_Invitations.fromJson(Map<String, dynamic> json) =>
      _$$_InvitationsFromJson(json);

  @override
  @JsonKey()
  final String invitationId;
  @override
  @JsonKey()
  final String invitationCode;
  @override
  @JsonKey()
  final String storeAddress;
  @override
  @JsonKey()
  final String storeImageUrl;
  @override
  @JsonKey()
  final String storeName;
  @override
  @JsonKey()
  final bool isApproved;
  @override
  @JsonKey()
  final bool isCanceled;
  @override
  @JsonKey()
  final bool isJoined;
  @override
  @JsonKey()
  final bool isFinished;
  @override
  @JsonKey()
  @unionTimestampConverter
  final UnionTimestamp invitationSchedule;
  @override
  @JsonKey()
  @unionTimestampConverter
  final UnionTimestamp createdAt;
  final List<String> _userIds;
  @override
  @JsonKey()
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  String toString() {
    return 'Invitation(invitationId: $invitationId, invitationCode: $invitationCode, storeAddress: $storeAddress, storeImageUrl: $storeImageUrl, storeName: $storeName, isApproved: $isApproved, isCanceled: $isCanceled, isJoined: $isJoined, isFinished: $isFinished, invitationSchedule: $invitationSchedule, createdAt: $createdAt, userIds: $userIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Invitations &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode) &&
            (identical(other.storeAddress, storeAddress) ||
                other.storeAddress == storeAddress) &&
            (identical(other.storeImageUrl, storeImageUrl) ||
                other.storeImageUrl == storeImageUrl) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isCanceled, isCanceled) ||
                other.isCanceled == isCanceled) &&
            (identical(other.isJoined, isJoined) ||
                other.isJoined == isJoined) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.invitationSchedule, invitationSchedule) ||
                other.invitationSchedule == invitationSchedule) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invitationId,
      invitationCode,
      storeAddress,
      storeImageUrl,
      storeName,
      isApproved,
      isCanceled,
      isJoined,
      isFinished,
      invitationSchedule,
      createdAt,
      const DeepCollectionEquality().hash(_userIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvitationsCopyWith<_$_Invitations> get copyWith =>
      __$$_InvitationsCopyWithImpl<_$_Invitations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitationsToJson(
      this,
    );
  }
}

abstract class _Invitations implements Invitation {
  const factory _Invitations(
      {final String invitationId,
      final String invitationCode,
      final String storeAddress,
      final String storeImageUrl,
      final String storeName,
      final bool isApproved,
      final bool isCanceled,
      final bool isJoined,
      final bool isFinished,
      @unionTimestampConverter final UnionTimestamp invitationSchedule,
      @unionTimestampConverter final UnionTimestamp createdAt,
      final List<String> userIds}) = _$_Invitations;

  factory _Invitations.fromJson(Map<String, dynamic> json) =
      _$_Invitations.fromJson;

  @override
  String get invitationId;
  @override
  String get invitationCode;
  @override
  String get storeAddress;
  @override
  String get storeImageUrl;
  @override
  String get storeName;
  @override
  bool get isApproved;
  @override
  bool get isCanceled;
  @override
  bool get isJoined;
  @override
  bool get isFinished;
  @override
  @unionTimestampConverter
  UnionTimestamp get invitationSchedule;
  @override
  @unionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  List<String> get userIds;
  @override
  @JsonKey(ignore: true)
  _$$_InvitationsCopyWith<_$_Invitations> get copyWith =>
      throw _privateConstructorUsedError;
}
