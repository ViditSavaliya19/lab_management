import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class StdItemWidget extends StatelessWidget {
  int i;
  List studList = [];

  StdItemWidget({required this.i, required this.studList});

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
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            ],
          )
        ],
      ),
    );
  }
}
