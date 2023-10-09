import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/invitation.dart';
import '../screens/approved_invitation_screen.dart';

final invitationStreamProvider =
    StreamProvider.autoDispose.family<Invitation, String>((ref, invitationId) {
  return FirebaseFirestore.instance
      .collection('invitations')
      .doc(invitationId)
      .snapshots()
      .map((snapshot) => Invitation.fromDocumentSnapshot(snapshot));
});

final approvedInvitationStreamProvider =
    StreamProvider.autoDispose<List<Invitation>>((ref) {
  return FirebaseFirestore.instance
      .collection('invitations')
      .where('isApproved', isEqualTo: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Invitation.fromDocumentSnapshot(doc))
          .toList());
});

class ApprovedInvitationWidget extends HookConsumerWidget {
  final String invitationId;

  const ApprovedInvitationWidget({
    Key? key,
    required this.invitationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitationAsyncValue =
        ref.watch(invitationStreamProvider(invitationId));

    return invitationAsyncValue.when(
      data: (invitation) {
        final date = invitation.invitationSchedule.dateTime;
        final formattedDate = (date != null)
            ? DateFormat('yyyy年M月d日').format(date)
            : "Date not available";

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApprovedInvitationScreen(
                          invitationId: invitation.invitationId),
                    ),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(10, 10),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 194, 247, 255),
                              borderRadius: BorderRadius.circular(10
                                  ),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    invitation.storeImageUrl,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            height: MediaQuery.of(context).size.width * 0.5,
                            width: MediaQuery.of(context).size.width * 0.875,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                      padding: const EdgeInsets.fromLTRB(20,0,0,25),
                                      child: Row(
                                        children: [
                                          Text(
                                            
                                            invitation.storeName,
                                            style: const TextStyle(
                                        
                                              color: Colors.white,
                                              fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                              ],
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Error loading invitation'),
    );
  }
}
