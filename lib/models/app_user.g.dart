// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      userEmail: json['userEmail'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      userProfileImageUrl: json['userProfileImageUrl'] as String? ?? '',
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'userEmail': instance.userEmail,
      'userId': instance.userId,
      'userProfileImageUrl': instance.userProfileImageUrl,
      'fcmTokens': instance.fcmTokens,
    };
