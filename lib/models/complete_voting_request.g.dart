// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_voting_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompleteVotingRequest _$$_CompleteVotingRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CompleteVotingRequest(
      userId: json['userId'] as String? ?? '',
      completeVotingRequestId: json['completeVotingRequestId'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter.fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_CompleteVotingRequestToJson(
        _$_CompleteVotingRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'completeVotingRequestId': instance.completeVotingRequestId,
      'createdAt': unionTimestampConverter.toJson(instance.createdAt),
    };
