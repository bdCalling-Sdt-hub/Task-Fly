import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/utils/app_string.dart';

import '../../utils/app_icons.dart';

class PostTaskController extends GetxController {
  late TabController tabController;
  String appbarTitle = AppString.stepOneAppbarTitle;
  String selectedCategory = "Cleaning";

  List appbarTitleList = [
    AppString.stepOneAppbarTitle,
    AppString.stepTwoAppbarTitle,
    AppString.stepThreeAppbarTitle,
  ];

  List category = [
    {
      "name": "Cleaning",
      "icon": AppIcons.cleaning,
      "isSelected": false,
    },
    {
      "name": "Assemble",
      "icon": AppIcons.assemble,
      "isSelected": false,
    },
    {
      "name": "Handyman",
      "icon": AppIcons.handyman,
      "isSelected": false,
    },
    {
      "name": "Delivery",
      "icon": AppIcons.delivery,
      "isSelected": false,
    },
    {
      "name": "Gardening",
      "icon": AppIcons.gardening,
      "isSelected": false,
    },
    {
      "name": "Removalists",
      "icon": AppIcons.removeLists,
      "isSelected": false,
    },
    {
      "name": "Admin",
      "icon": AppIcons.admin,
      "isSelected": false,
    },
    {
      "name": "IT",
      "icon": AppIcons.it,
      "isSelected": false,
    },
    {
      "name": "Photography",
      "icon": AppIcons.photography,
      "isSelected": false,
    },
    {
      "name": "Other   ",
      "icon": AppIcons.other,
      "isSelected": false,
    },
  ];

  static PostTaskController get instance => Get.put(PostTaskController());

  selectCategory(item) {
    selectedCategory = item["name"];
    update();
    Get.toNamed(AppRoutes.postTaskInfo);
  }

  changeStep(int pageNumber) {
    tabController.index = pageNumber;

    appbarTitle = appbarTitleList[pageNumber];
    update();
  }
}
