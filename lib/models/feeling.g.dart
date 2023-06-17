// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feeling _$$_FeelingFromJson(Map<String, dynamic> json) => _$_Feeling(
      userId: json['userId'] as String? ?? '',
      isComfortable: json['isComfortable'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter.fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_FeelingToJson(_$_Feeling instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isComfortable': instance.isComfortable,
      'createdAt': unionTimestampConverter.toJson(instance.createdAt),
    };
