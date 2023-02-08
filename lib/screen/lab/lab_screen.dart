import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_management/screen/dashboard/widgets/stdlist_widget.dart';
import 'package:lab_management/utils/api_http.dart';
import 'package:lab_management/screen/lab/controller/lab_controller.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({Key? key}) : super(key: key);

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  LabController _labConrtoller = Get.put(LabController());
  var labName;

  @override
  void initState() {
    super.initState();
    labName = Get.arguments;
  }

  void readData() async {
    // _labConrtoller.studList.value =
    //     await ApiHttp.apiHttp.getAllData("7-8A", labName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$labName"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => DropdownButton(
              isExpanded: true,
              value: _labConrtoller.selectedTime.value,
              onChanged: (value) {
                _labConrtoller.selectedTime.value = value;
              },
              items: _labConrtoller.timeList.map((e) => dropItem(e)).toList(),
            ),
          ),
          Expanded(
            child: Obx(
              () => FutureBuilder(
                future: ApiHttp.apiHttp
                    .getAllData("${_labConrtoller.selectedTime}", labName),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    _labConrtoller.studList.value = snapshot.data!;

                    print(_labConrtoller.studList);
                    return ListView.builder(
                      reverse: true,
                      itemCount: _labConrtoller.studList.length,
                      itemBuilder: (context, i) => (_labConrtoller
                              .studList[i].pcNo
                              .toString()
                              .contains('r'))
                          ? StdItemWidget(
                              i: i, studList: _labConrtoller.studList.value)
                          : Container(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem dropItem(Map data) {
    return DropdownMenuItem(
      value: data['value'],
      child: Text("${data['time']}"),
    );
  }
}

/*
* POST
* have su karvanu che ?? */
