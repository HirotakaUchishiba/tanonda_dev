import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohima/features/user_id_provider.dart';
import 'package:ohima/features/user_interest_provider.dart';
import 'package:ohima/screens/calendar_screen.dart';

class RegisterInterestScreen extends HookConsumerWidget {
  const RegisterInterestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedInterests = useState<List<String>>([]);

    final interest = ref.read(userInterestProvider);
    final uid = ref.read(userIdProvider);

    Future<void> updateInterest(String uid, List<String> interests) async {
      print("interestScreenのuidは:$uid");
      if (uid != "") {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .update({'interests': interests});
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('興味登録',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image2.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '興味のある分野を1つ以上選んでください',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    for (final interest in [
                      'カフェ巡り',
                      '純喫茶',
                      'カラオケ',
                      'アニメ',
                      'ゲーム',
                      '音ゲー',
                      '映画鑑賞',
                      '御朱印集め',
                      '散歩',
                      'アイドル',
                      'K-POP',
                      '邦ロック',
                      '語学',
                      'コーヒー',
                      '遊園地',
                      'オタク',
                      '犬派',
                      '猫派',
                      'スタバ',
                      '筋トレ',
                      '仏教',
                      'キリスト教',
                      'イスラム教',
                      '太鼓の達人',
                      '世界一周',
                      'ミニマリスト',
                    ])
                      FilterChip(
                        label: Text(interest),
                        selected: selectedInterests.value.contains(interest),
                        onSelected: (selected) {
                          if (selected) {
                            selectedInterests.value =
                                List.from(selectedInterests.value)
                                  ..add(interest);
                          } else {
                            selectedInterests.value =
                                List.from(selectedInterests.value)
                                  ..remove(interest);
                          }
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 245, 130, 130),
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
                    onPressed: selectedInterests.value.isNotEmpty
                        ? () async {
                            // Save interests to Firebase
                            await updateInterest(
                                uid,
                                selectedInterests
                                    .value); // _selectedInterestsを渡す
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarScreen()),
                            );
                          }
                        : null,
                    child: const Text('次へ'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
