import 'package:flutter/material.dart';
import 'package:lab_management/utils/firebase_helper.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LMS"),
      ),
      body: StreamBuilder(
        stream: FirebaseHelper.firebaseHelper.getAllLab(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            var data = snapshot.data;
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
