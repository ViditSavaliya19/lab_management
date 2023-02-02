import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_management/utils/firebase_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtEmail =TextEditingController();
  TextEditingController txtPassword =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller:  txtEmail),
            SizedBox(height: 20),
            TextField(controller:  txtPassword),
            SizedBox(height: 50),
            ElevatedButton(onPressed: (){

              FirebaseHelper.firebaseHelper.signIn(txtEmail.text, txtPassword.text);

              Get.toNamed('dashScreen');

            }, child: Text("SingUp"))
          ],
        ),
      ),
    );
  }
}
