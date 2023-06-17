import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ohima/screens/invitation_screen.dart';

Widget unapprovedInvitationWidget(BuildContext context, String invitationId) {
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
                  image: const DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://asobisokuho.com/wp-content/uploads/2021/11/mixi%E3%82%B7%E3%83%BC%E3%82%B7%E3%83%A5%E5%BA%97%E5%86%85%E5%86%99%E7%9C%9F.jpg"),
                      fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.width *
                    0.5, // 75% of device width
                width: MediaQuery.of(context).size.width *
                    0.875, // 87.5% of device width
                child: Column(
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
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: const Center(
                                  child: Text("2023/6/29",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16)),
                                ),
                              ),
                              const Gap(5),
                              Container(
                                height: 25,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: const Center(
                                  child: Text("20 ast",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16)),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("C.S.B Hookah Cafe&Bar",
                                  //Textがoverflowすると2行になる
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26)),
                              Text("Osaka Umeda",
                                  //Textがoverflowすると2行になる
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26)),
                            ],
                          ),
                          const Gap(20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black54,
                                  ),
                                  child: TextButton(
                                    child: const Text(
                                      '詳細を見る',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    onPressed: () => Navigator.pushNamed<void>(
                                      context,
                                      InvitationScreen.location(
                                          invitationId: invitationId),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white54,
                                  ),
                                  child: TextButton(
                                    child: const Text(
                                      '辞退する',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {},
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
}
