import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/LabDataModel.dart';

class ApiHttp {
  ApiHttp._();

  static final ApiHttp apiHttp = ApiHttp._();

  String apiPostDataLink =
      "https://script.google.com/macros/s/AKfycbxu0ZotPqCOQrKrTBS7CSLmz8lDWSpbn-UFHYZ_ifPF9oXL7KD1J2v2MQ1huYb5EpUD/exec";

  Future<String> addRecordPostApi() async {
    var response = await http.post(Uri.parse(apiPostDataLink));

    if (response.statusCode == 200) {
      return "Success";
    }

    return "Failed To upload Data";
  }

  Future<List<dynamic>> getAllData(String time, String lab) async {
    String apiReadLink =
        "https://script.google.com/macros/s/AKfycbzpcyJXvmug9b1-usdeKRatFJ7BFi6EirS7HN_KxoQh64Nt2C3vJTai23SGGEmboMQ/exec?time=$time&lab=$lab";
    var response = await http.get(Uri.parse(apiReadLink));
    var json = jsonDecode(response.body);

    List<dynamic> data = json.map((e) => LabDataModel.fromJson(e)).toList();

    print("======================================");
    print(json);
    print("======================================");

    return data;
  }
}
