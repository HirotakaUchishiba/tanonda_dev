import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_converters/union_timestamp.dart';

part 'invitation.freezed.dart';
part 'invitation.g.dart';

@freezed
class Invitation with _$Invitation {
  const factory Invitation({
    @Default('') String invitationId,
    @Default('') String invitationCode,
    @Default('') String storeAddress,
    @Default('') String storeImageUrl,
    @Default('') String storeName,
    @Default(false) bool isApproved,
    @Default(false) bool isCanceled,
    @Default(false) bool isJoined,
    @Default(false) bool isFinished,
    @unionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp invitationSchedule,
    @unionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp createdAt,
    @Default(<String>[]) List<String> userIds,
  }) = _Invitations;

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);

  factory Invitation.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Invitation.fromJson(<String, dynamic>{
      ...data,
      'invitationId': ds.id,
    });
  }

  static const defaultValue = Invitation();
}
