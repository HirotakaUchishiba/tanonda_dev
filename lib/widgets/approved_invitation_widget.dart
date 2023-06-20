import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/invitation.dart';
import '../screens/approved_invitation_screen.dart';
import '../screens/certification_screen.dart';

// データベースから特定のInvitationをストリームとして取得
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
    // Use the `invitationId` to get the specific `Invitation`
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
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 194, 247, 255),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              invitation.storeImageUrl,
                            ),
                            fit: BoxFit.cover),
                      ),
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.875,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(formattedDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(invitation.storeName,
                                        //Textがoverflowすると2行になる
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26)),
                                  ],
                                ),
                                const Gap(20),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black54,
                                        ),
                                        child: TextButton(
                                          child: const Text(
                                            '詳細を見る',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ApprovedInvitationScreen(
                                                        invitationId: invitation
                                                            .invitationId),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Gap(10),
                                      Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white54,
                                        ),
                                        child: TextButton(
                                          child: const Text(
                                            '参加証を表示',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CertificationScreen(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
