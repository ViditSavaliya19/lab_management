import 'package:get/get.dart';
import 'package:lab_management/utils/model/LabDataModel.dart';

class LabController extends GetxController {
  List<Map> timeList = [
    {"time": "07:00 - 08:00 AM", "value": "07-08A"},
    {"time": "08:00 - 09:00 AM", "value": "08-09A"},
    {"time": "09:00 - 10:00 AM", "value": "09-10A"},
    {"time": "10:00 - 11:00 AM", "value": "10-11A"},
    {"time": "11:00 - 12:00 AM", "value": "11-12A"},
    {"time": "12:00 - 01:00 AM", "value": "12-01P"},
    {"time": "01:00 - 02:00 AM", "value": "01-02P"},
    {"time": "02:00 - 03:00 AM", "value": "02-03P"},
    {"time": "03:00 - 04:00 AM", "value": "03-04P"},
    {"time": "04:00 - 05:00 AM", "value": "04-05P"},
    {"time": "05:00 - 06:00 AM", "value": "05-06P"},
    {"time": "06:00 - 07:00 AM", "value": "06-07P"},
    {"time": "07:00 - 08:00 AM", "value": "07-08P"},
  ];

  RxList<dynamic> studList = <dynamic>[].obs;

  RxString selectedTime = "07-08A".obs;
}
