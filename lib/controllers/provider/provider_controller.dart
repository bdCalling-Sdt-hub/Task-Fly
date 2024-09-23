import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_icons.dart';

class ProviderHomeController extends GetxController {
  RangeValues currentRangeValues = const RangeValues(30, 300);
  String selectWorkPlace = "";
  String selectedPrice = "";
  String selectedDueDate = "";
  String selectedPostDate = "";

  bool showWork = true;

  bool showPrice = true;

  bool showCategory = true;

  bool showSortPrice = true;

  bool showDueDate = true;

  bool showPostDate = true;

  showSortPriceOnTap() {
    showSortPrice = !showSortPrice;
    update();
  }

  showDueDateOnTap() {
    showDueDate = !showDueDate;
    update();
  }

  showPostDateOnTap() {
    showPostDate = !showPostDate;
    update();
  }

  showWorkOnTap() {
    showWork = !showWork;
    update();
  }

  showPriceOnTap() {
    showPrice = !showPrice;
    update();
  }

  showCategoryOnTap() {
    showCategory = !showCategory;
    update();
  }

  List workPlace = [
    "Remotely",
    "In person",
    "Both",
  ];

  List sortPrice = [
    "High to Low",
    "Low to High",
  ];
  List dueDate = [
    "Soonest to latest",
    "Latest to soonest",
  ];
  List postDate = [
    "Earliest to oldest",
    "Oldest to Earliest",
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

  selectItem(item) {
    selectWorkPlace = item;
    update();
  }

  selectSortPrice(title) {
    selectedPrice = title;
    update();
  }

  selectDueDate(title) {
    selectedDueDate = title;
    update();
  }

  selectPostDate(title) {
    print(title);
    selectedPostDate = title;
    update();
  }

  selectCategoryItem(item) {
    item["isSelected"] = !item["isSelected"];
    update();
  }

  static ProviderHomeController get instance =>
      Get.put(ProviderHomeController());
}
