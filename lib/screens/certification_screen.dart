import 'package:flutter/material.dart';
import 'package:ohima/screens/main_screen.dart';
import 'package:ohima/screens/root_navigator.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('参加証',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset('images/qr_code.png'),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                child: const Text('店舗へご来店時、店員に上記のQRコードをご提示ください。'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
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
                    child: const Text('戻る',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
