import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanonda_dev/screens/root_navigator.dart';
import 'package:path/path.dart' as Path;
import 'package:tanonda_dev/features/user_email_provider.dart';
import 'package:tanonda_dev/features/user_id_provider.dart';
import 'package:tanonda_dev/features/user_password_provider.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';
    //Image_pickerがシミュレータに対応していないため、コメントアウト
    // XFile? profileImageFile;

    // final ImagePicker picker = ImagePicker();

    // Future getImage() async {
    //   final XFile? selectedImage =
    //       await picker.pickImage(source: ImageSource.gallery);

    //   if (selectedImage != null) {
    //     profileImageFile = selectedImage;
    //   }
    // }

    // Future uploadImageToFirebase(BuildContext context, String userId) async {
    //   String fileName = Path.basename(profileImageFile!.path);
    //   FirebaseStorage storage = FirebaseStorage.instance;
    //   Reference ref = storage.ref().child("upload/image/$fileName");
    //   UploadTask uploadTask = ref.putFile(File(profileImageFile!.path));

    //   await uploadTask.whenComplete(() async {
    //     final String downloadURL = await ref.getDownloadURL();
        
    //     // Firestoreにユーザー情報と画像のURLを保存
    //     await FirebaseFirestore.instance
    //         .collection('users')
    //         .doc(userId)
    //         .update({
    //       'image_url': downloadURL,  // ここで画像のURLを保存
    //     });
    //   }).catchError((onError) {
    //     print(onError);
    //   });
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          '新規登録',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'メールアドレス',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pinkAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                      validator: (value) =>
                          !EmailValidator.validate(value ?? '')
                              ? '有効なメールアドレスを入力してください'
                              : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'パスワード',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pinkAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      obscureText: true,
                      onChanged: (value) => password = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'パスワードを入力してください'
                          : null,
                    ),
                    // Image_pickerがシミュレータに対応していないため、コメントアウト
                    // const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: getImage,
                    //   child: const Text('Choose Profile Image'),
                    // ),
                    // profileImageFile == null
                    //     ? Container()
                    //     : Image.file(File(profileImageFile!.path)),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pinkAccent,
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              // Firebase Authenticationに登録
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);

                              // Firestoreにユーザー情報を保存
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userCredential.user!.uid)
                                  .set({
                                'email': email,
                                'uid': userCredential.user!.uid,
                              });

                              // プロバイダーにメールアドレスとパスワードをセット
                              ref.read(emailProvider.notifier).state = email;
                              ref.read(passwordProvider.notifier).state =
                                  password;

                              // プロバイダーにユーザーIDをセット
                              final uid = ref
                                  .read(userIdProvider.notifier)
                                  .state = userCredential.user!.uid;
                              print("セットされたuid:$uid");
                              
                              // Image_pickerがシミュレータに対応していないため、コメントアウト
                              // if(profileImageFile != null){
                              //   await uploadImageToFirebase(context, uid);
                              // }

                              // 次の画面へ遷移
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RootNavigator()),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'パスワードが短すぎます。') {
                              } else if (e.code == 'そのメールアドレスはすでに使われています。') {}
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: const Text('登録'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
