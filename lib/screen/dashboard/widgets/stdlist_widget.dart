import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:lab_management/screen/dashboard/widgets/details_form.dart';

class StdItemWidget extends StatelessWidget {
  int i;
  List studList = [];
  String sheetName;
  String time;

  StdItemWidget(
      {required this.i,
      required this.studList,
      required this.sheetName,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
            studList[i].name.toString().isEmpty ? '-' : "${studList[i].name}"),
        leading: Text("${studList[i].pcNo}"),
        subtitle: Text("${studList[i].grid}"),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DetailsForm(
                          grid: studList[i].grid,
                          name: studList[i].name,
                          pcNo: studList[i].pcNo,
                          sheetName: sheetName,
                          time: time,
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            ],
          )
        ],
      ),
    );
  }
}
