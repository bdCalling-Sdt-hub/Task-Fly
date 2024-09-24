import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTaskController extends GetxController {
  late TabController tabController;

  changeTab() {
    tabController.addListener(
      () {
        if (kDebugMode) {
          print(tabController.index);
        }
        update();
      },
    );
  }
}
