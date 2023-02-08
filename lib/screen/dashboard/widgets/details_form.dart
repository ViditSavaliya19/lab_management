import 'package:flutter/material.dart';

class DetailsForm extends StatefulWidget {
  int grid;
  String name;
  String pcNo;
  DetailsForm(
      {Key? key, required this.grid, required this.name, required this.pcNo})
      : super(key: key);

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController txtGrid = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPcNo = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtGrid = TextEditingController(text: widget.grid.toString());
    txtName = TextEditingController(text: widget.name);
    txtPcNo = TextEditingController(text: widget.pcNo);
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
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter pcNo !!";
                }
                return null;
              },
              controller: txtPcNo,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text("SAVE"),
                ),
                OutlinedButton(
                  onPressed: () {},
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
