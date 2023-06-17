import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/invitation.dart';

import '../models/app_user.dart';

final db = FirebaseFirestore.instance;

/// appUsers コレクションの参照。
final appUsersRef = db.collection('appUsers').withConverter(
      fromFirestore: (ds, _) => AppUser.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// appUser ドキュメントの参照。
DocumentReference<AppUser> appUserRef({
  required String userId,
}) =>
    appUsersRef.doc(userId);

/// invitations コレクションの参照。
final invitationsRef = db.collection('invitations').withConverter(
      fromFirestore: (ds, _) => Invitation.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// invitation ドキュメントの参照。
DocumentReference<Invitation> invitationRef({
  required String invitationId,
}) =>
    invitationsRef.doc(invitationId);