import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/LabDataModel.dart';

class ApiHttp {
  ApiHttp._();

  static final ApiHttp apiHttp = ApiHttp._();

  String apiPostDataLink =
      "https://script.google.com/macros/s/AKfycbxu0ZotPqCOQrKrTBS7CSLmz8lDWSpbn-UFHYZ_ifPF9oXL7KD1J2v2MQ1huYb5EpUD/exec";

  Future<String> addRecordPostApi(
      {required LabDataModel l1,
      required String sheetName,
      required String time}) async {
    print({
      'sheetName': '$sheetName',
      'pcNo': '${l1.pcNo}',
      'grid': '${l1.grid}',
      'name': '${l1.name}',
      'device': '${l1.lp}',
      'course': '${l1.course}',
      'faculty': '${l1.faculty}',
      'time': time,
    });

    var response = await http.post(
      Uri.parse(apiPostDataLink),
      encoding: Encoding.getByName('utf-8'),
      body: {
        'sheetName': '$sheetName',
        'pcNo': '${l1.pcNo}',
        'grid': '${l1.grid}',
        'name': '${l1.name}',
        'device': '${l1.lp}',
        'course': '${l1.course}',
        'faculty': '${l1.faculty}',
        'time': time,
      },
    );

    if (response.statusCode == 302) {
      return "Success";
    } else {
      return "Failed To upload Data";
    }
  }

  Future<List<dynamic>> getAllData(String time, String lab) async {
    String apiReadLink =
        "https://script.google.com/macros/s/AKfycbzpcyJXvmug9b1-usdeKRatFJ7BFi6EirS7HN_KxoQh64Nt2C3vJTai23SGGEmboMQ/exec?time=$time&lab=$lab";
    var response = await http.get(Uri.parse(apiReadLink));
    var json = jsonDecode(response.body);

    print("======================================");
    print(json);
    print("======================================");

    List<dynamic> data = json.map((e) => LabDataModel.fromJson(e)).toList();

    return data;
  }
}
