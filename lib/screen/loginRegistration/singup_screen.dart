import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_management/utils/firebase_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

              FirebaseHelper.firebaseHelper.signUP(txtEmail.text, txtPassword.text);

              Get.back();


            }, child: Text("SingUp"))
          ],
        ),
      ),
    );
  }
}
