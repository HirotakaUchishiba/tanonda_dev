import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tanonda_dev/widgets/dialog.dart';

import '../widgets/unapproved_invitation_widget.dart';

class ApprovedInvitationScreen extends HookConsumerWidget {
  final String invitationId;

  const ApprovedInvitationScreen({Key? key, required this.invitationId})
      : super(key: key);

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
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.85,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 194, 247, 255),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              invitation.storeImageUrl,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 20,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 194, 247, 255),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            invitation.storeName,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(formattedDate,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 16)),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.white, size: 20),
                                  Text(
                                    'Map',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: CommonAlertDialogContent(
                                      child: SizedBox(
                                    height: 420,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "キャンセルポリシー",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28),
                                        ),
                                        const Gap(10),
                                        Container(
                                            height: 150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "キャンセル規定",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    Gap(10),
                                                    Text(
                                                      "前日キャンセル: 1000円",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "当日キャンセル: 2000円",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "無断キャンセル: 5000円",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        const Gap(20),
                                        const Text(
                                            "招待をキャンセルする場合、上記のキャンセルポリシーに従って該当のキャンセル料金を支払うことになります。キャンセルしてもよろしいですか？"),
                                      ],
                                    ),
                                  )),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("戻る"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("キャンセルする"),
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('invitations')
                                            .doc(
                                                invitationId) // 更新するドキュメントのIDを指定
                                            .update(
                                                {'isCanceled': true}) // 更新内容を指定
                                            .catchError((error) {
                                          // 更新に失敗した場合のエラーハンドリング
                                          print(
                                              "Error updating document: $error");
                                        });

                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('キャンセルする',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Error loading invitation'),
    );
  }
}
