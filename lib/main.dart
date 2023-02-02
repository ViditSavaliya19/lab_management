import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_management/screen/dashboard/dash_screen.dart';
import 'package:lab_management/screen/loginRegistration/login_screen.dart';
import 'package:lab_management/screen/loginRegistration/singup_screen.dart';
import 'package:sizer/sizer.dart';

void main()
async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => SignInScreen(),
          'signUp':(p0) => SignUpScreen(),
          'dashScreen':(p0) => DashScreen(),
        },
      ),
    ),
  );
}