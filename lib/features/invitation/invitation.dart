import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/invitation.dart';
import '../../repositories/firestore/invitation_repository.dart';
import '../auth/auth.dart';

final invitationsStreamProvider = StreamProvider.autoDispose((ref) {
  final userId = ref.watch(userIdProvider).value;
  if (userId == null) {
    return Stream.value(<Invitation>[]);
  }
  return ref.read(invitationsRepositoryProvider).subscribeInvitations();
});

final invitationStreamProvider =
    StreamProvider.family.autoDispose<Invitation?, String>((ref, invitationId) {
  final result = ref
      .read(invitationsRepositoryProvider)
      .subscribeInvitation(invitationId: invitationId);
  return result;
});
