import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/app_user.dart';
import '../models/invitation.dart';

final db = FirebaseFirestore.instance;

final appUsersRef = db.collection('appUsers').withConverter(
      fromFirestore: (ds, _) => AppUser.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

DocumentReference<AppUser> appUserRef({
  required String userId,
}) =>
    appUsersRef.doc(userId);

final invitationsRef = db.collection('invitations').withConverter(
      fromFirestore: (ds, _) => Invitation.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

DocumentReference<Invitation> invitationRef({
  required String invitationId,
}) =>
    invitationsRef.doc(invitationId);
