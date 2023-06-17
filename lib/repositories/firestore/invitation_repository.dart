import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/invitation.dart';
import '../../utils/firestore_refs.dart';

final invitationsRepositoryProvider =
    Provider<InvitationRepository>((_) => InvitationRepository());

class InvitationRepository {
  Stream<List<Invitation>> subscribeInvitations() {
    final collectionStream = invitationsRef.snapshots();
    return collectionStream.map(
      (qs) => qs.docs.map((qds) => qds.data()).toList(),
    );
  }

  Stream<Invitation?> subscribeInvitation({required String invitationId}) {
    final streamDocumentSnapshot = invitationRef(invitationId: invitationId).snapshots();
    return streamDocumentSnapshot.map((ds) => ds.data());
  }
}