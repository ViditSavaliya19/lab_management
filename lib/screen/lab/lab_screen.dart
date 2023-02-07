import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              value: _labConrtoller.selectedTime.value,
              onChanged: (value) {
                _labConrtoller.selectedTime.value = value;
              },
              items: _labConrtoller.timeList.map((e) => dropItem(e)).toList(),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiHttp.apiHttp.getAllData("9-10A", labName),
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
                        ? Card(
                            child: ExpansionTile(
                              title: Text("${_labConrtoller.studList[i].name}"),
                              leading:
                                  Text("${_labConrtoller.studList[i].pcNo}"),
                              subtitle:
                                  Text("${_labConrtoller.studList[i].grid}"),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.call)),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }
                return CircularProgressIndicator();
              },
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
