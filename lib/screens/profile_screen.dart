import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohima/features/auth/auth.dart';
import 'package:ohima/widgets/gradient_circular_progress_indicator.dart';

import '../widgets/wallet_button.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const path = '/profile';
  static const name = 'ProfileScreen';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.indigo, Colors.pink]),
      ),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('プロフィール',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(25),
                    Stack(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('images/default_profile.png'),
                          backgroundColor: Colors.white,
                        ),
                        GradientCircularProgressIndicator(0.8),
                      ],
                    ),
                    const Gap(20),
                    const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MemberRank',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text(
                                'GOLD',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 175, 175, 58)),
                              ),
                              Gap(5),
                              Icon(Icons.info_outline_rounded,
                                  color: Colors.grey),
                            ],
                          ),
                        ]),
                  ],
                ),
                const Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.875,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.indigo, Colors.pink]),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage:
                                  AssetImage('images/aster_logo.png'),
                            ),
                            Gap(20),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '獲得ASTER',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '2000AST',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 30),
                                  ),
                                  Gap(5),
                                  WalletButton(),
                                ])
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(50),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'アカウント情報',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const Gap(10),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.settings),
                            Gap(10),
                            Text('アカウント情報の編集', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.reviews_rounded),
                            Gap(10),
                            Text('レビューとペナルティ', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.store_rounded),
                            Gap(10),
                            Text('来店履歴', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.favorite_border_rounded),
                            Gap(10),
                            Text('お気に入りのお店', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          ref.read(signOutProvider)();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: Colors.red,
                              ),
                              Gap(10),
                              Text('ログアウト',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.red)),
                            ],
                          ),
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
    );
  }
}
