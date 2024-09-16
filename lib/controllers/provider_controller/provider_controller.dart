import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderHomeController extends GetxController {
  RangeValues currentRangeValues = const RangeValues(30, 300);
  bool isBoth = false;

  List workPlace = [
    {
      "name": "Remotely",
      "isSelected": false,
    },
    {
      "name": "In person",
      "isSelected": false,
    },
    {
      "name": "Both",
      "isSelected": false,
    },
  ];
  List category = [
    {
      "name": "Cleaning",
      "isSelected": false,
    },
    {
      "name": "Assemble",
      "isSelected": false,
    },
    {
      "name": "Handyman",
      "isSelected": false,
    },
    {
      "name": "Delivery",
      "isSelected": false,
    },
    {
      "name": "Gardening",
      "isSelected": false,
    },
    {
      "name": "Removalists",
      "isSelected": false,
    },
    {
      "name": "Admin",
      "isSelected": false,
    },
    {
      "name": "IT",
      "isSelected": false,
    },
    {
      "name": "Photography",
      "isSelected": false,
    },
    {
      "name": "Others",
      "isSelected": false,
    },
  ];

  selectItem(item) {
    item["isSelected"] = !item["isSelected"];
    update();
  }

  static ProviderHomeController get instance =>
      Get.put(ProviderHomeController());
}
