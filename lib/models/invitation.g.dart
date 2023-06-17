// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Invitations _$$_InvitationsFromJson(Map<String, dynamic> json) =>
    _$_Invitations(
      invitationId: json['invitationId'] as String? ?? '',
      invitationCode: json['invitationCode'] as String? ?? '',
      storeAddress: json['storeAddress'] as String? ?? '',
      storeImageUrl: json['storeImageUrl'] as String? ?? '',
      storeName: json['storeName'] as String? ?? '',
      isApproved: json['isApproved'] as bool? ?? false,
      isCanceled: json['isCanceled'] as bool? ?? false,
      isJoined: json['isJoined'] as bool? ?? false,
      isFinished: json['isFinished'] as bool? ?? false,
      invitationSchedule: json['invitationSchedule'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter
              .fromJson(json['invitationSchedule'] as Object),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter.fromJson(json['createdAt'] as Object),
      userIds: (json['userIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$_InvitationsToJson(_$_Invitations instance) =>
    <String, dynamic>{
      'invitationId': instance.invitationId,
      'invitationCode': instance.invitationCode,
      'storeAddress': instance.storeAddress,
      'storeImageUrl': instance.storeImageUrl,
      'storeName': instance.storeName,
      'isApproved': instance.isApproved,
      'isCanceled': instance.isCanceled,
      'isJoined': instance.isJoined,
      'isFinished': instance.isFinished,
      'invitationSchedule':
          unionTimestampConverter.toJson(instance.invitationSchedule),
      'createdAt': unionTimestampConverter.toJson(instance.createdAt),
      'userIds': instance.userIds,
    };
