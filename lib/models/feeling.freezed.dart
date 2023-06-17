// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feeling _$FeelingFromJson(Map<String, dynamic> json) {
  return _Feeling.fromJson(json);
}

/// @nodoc
mixin _$Feeling {
  String get userId => throw _privateConstructorUsedError;
  bool get isComfortable => throw _privateConstructorUsedError;
  @unionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeelingCopyWith<Feeling> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeelingCopyWith<$Res> {
  factory $FeelingCopyWith(Feeling value, $Res Function(Feeling) then) =
      _$FeelingCopyWithImpl<$Res, Feeling>;
  @useResult
  $Res call(
      {String userId,
      bool isComfortable,
      @unionTimestampConverter UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$FeelingCopyWithImpl<$Res, $Val extends Feeling>
    implements $FeelingCopyWith<$Res> {
  _$FeelingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isComfortable = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isComfortable: null == isComfortable
          ? _value.isComfortable
          : isComfortable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
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
abstract class _$$_FeelingCopyWith<$Res> implements $FeelingCopyWith<$Res> {
  factory _$$_FeelingCopyWith(
          _$_Feeling value, $Res Function(_$_Feeling) then) =
      __$$_FeelingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      bool isComfortable,
      @unionTimestampConverter UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_FeelingCopyWithImpl<$Res>
    extends _$FeelingCopyWithImpl<$Res, _$_Feeling>
    implements _$$_FeelingCopyWith<$Res> {
  __$$_FeelingCopyWithImpl(_$_Feeling _value, $Res Function(_$_Feeling) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isComfortable = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Feeling(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isComfortable: null == isComfortable
          ? _value.isComfortable
          : isComfortable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feeling implements _Feeling {
  const _$_Feeling(
      {this.userId = '',
      this.isComfortable = true,
      @unionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()});

  factory _$_Feeling.fromJson(Map<String, dynamic> json) =>
      _$$_FeelingFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final bool isComfortable;
  @override
  @JsonKey()
  @unionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString() {
    return 'Feeling(userId: $userId, isComfortable: $isComfortable, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Feeling &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isComfortable, isComfortable) ||
                other.isComfortable == isComfortable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, isComfortable, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeelingCopyWith<_$_Feeling> get copyWith =>
      __$$_FeelingCopyWithImpl<_$_Feeling>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeelingToJson(
      this,
    );
  }
}

abstract class _Feeling implements Feeling {
  const factory _Feeling(
      {final String userId,
      final bool isComfortable,
      @unionTimestampConverter final UnionTimestamp createdAt}) = _$_Feeling;

  factory _Feeling.fromJson(Map<String, dynamic> json) = _$_Feeling.fromJson;

  @override
  String get userId;
  @override
  bool get isComfortable;
  @override
  @unionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_FeelingCopyWith<_$_Feeling> get copyWith =>
      throw _privateConstructorUsedError;
}
