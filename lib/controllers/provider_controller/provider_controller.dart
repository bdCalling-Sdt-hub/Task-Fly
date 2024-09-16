import 'package:get/get.dart';

class ProviderHomeController extends GetxController {
  double minPrice = 30;
  double maxPrice = 500;
  bool isRemote = false;
  bool isInPerson = false;
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

  selectItem(item) {
    item["isSelected"] = !item["isSelected"];
    update();
  }

  static ProviderHomeController get instance =>
      Get.put(ProviderHomeController());
}
