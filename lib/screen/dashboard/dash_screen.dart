import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            DocumentSnapshot<Map<String, dynamic>>? data = snapshot.data;
            var dataMap = data!.data();
            print(dataMap);
            return ListView.builder(
              itemCount: dataMap!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.toNamed('labScreen', arguments: "${dataMap['$index']}");
                  },
                  title: Text("${dataMap['$index']}"),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
