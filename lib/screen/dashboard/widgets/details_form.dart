import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_management/utils/api_http.dart';
import 'package:lab_management/utils/model/LabDataModel.dart';

class DetailsForm extends StatefulWidget {
  int grid;
  String name;
  String pcNo;
  String sheetName;
  String time;

  DetailsForm(
      {Key? key,
      required this.grid,
      required this.name,
      required this.pcNo,
      required this.sheetName,
      required this.time})
      : super(key: key);

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController txtGrid = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLp = TextEditingController();
  TextEditingController txtCourse = TextEditingController();
  TextEditingController txtFaculty = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtGrid = TextEditingController(text: widget.grid.toString());
    txtName = TextEditingController(text: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter GRID !!";
                }
                return null;
              },
              onSaved: (val) {},
              controller: txtGrid,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter Name !!";
                }
                return null;
              },
              controller: txtName,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter L/P !!";
                }
                return null;
              },
              controller: txtLp,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("L/P")),
            ),
            const SizedBox(height: 5),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter Course !!";
                }
                return null;
              },
              controller: txtCourse,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Course")),
            ),
            const SizedBox(height: 5),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter Faculty !!";
                }
                return null;
              },
              controller: txtFaculty,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Faculty")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      LabDataModel l1 = LabDataModel(
                        pcNo: widget.pcNo,
                        name: txtName.text,
                        lp: txtLp.text,
                        grid: txtGrid.text,
                        faculty: txtFaculty.text,
                        course: txtCourse.text,
                      );

                      String msg = await ApiHttp.apiHttp.addRecordPostApi(
                          l1: l1,
                          sheetName: widget.sheetName,
                          time: widget.time);

                      print("$msg");

                      if (msg == "Success") {
                        Get.snackbar("Success Full data Insert", "");
                        Get.back();
                      } else {
                        Get.snackbar("$msg", "");
                      }
                    }
                  },
                  child: const Text("SAVE"),
                ),
                OutlinedButton(
                  onPressed: () {
                    formKey.currentState!.reset();
                  },
                  child: const Text("RESET "),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
