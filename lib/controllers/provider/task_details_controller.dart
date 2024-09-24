import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../helpers/prefs_helper.dart';
import '../../view/screen/services_provider/home/widgets/switch_role.dart';

class TaskDetailsController extends GetxController {
  TextEditingController locationController =
      TextEditingController(text: kDebugMode ? "Banashree, Dhaka" : "");
  TextEditingController taskDetailsController = TextEditingController(
      text: kDebugMode ? "i need You to clean my car" : "");

  TextEditingController taskTypeController =
      TextEditingController(text: kDebugMode ? "In-person" : "");

  TextEditingController dateController =
      TextEditingController(text: kDebugMode ? "22/11/2024" : "");
  TextEditingController timeController =
      TextEditingController(text: kDebugMode ? "Evening, 7Pm -09 Pm" : "");

  TextEditingController taskNameController =
      TextEditingController(text: kDebugMode ? "Cleaning My car" : "");
TextEditingController priceController =
      TextEditingController(text: kDebugMode ? "10" : "");
TextEditingController descriptionController =
      TextEditingController(text: kDebugMode ? "Reason" : "");

  static TaskDetailsController get instance => Get.put(TaskDetailsController());

  acceptTaskOnTap() {
    if (!PrefsHelper.isLogIn) {
      print("kjfdsjf");
      if (PrefsHelper.myRole == 'tasker') {
      } else {
        switchTaskerRole();
      }
    }
  }
}
