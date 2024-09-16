import 'package:get/get.dart';

class ProviderHomeController extends GetxController {
  double minPrice = 30;
  double maxPrice = 500;
  bool isRemote = false;
  bool isInPerson = false;
  bool isBoth = false;

  static ProviderHomeController get instance => Get.put(ProviderHomeController());
}
