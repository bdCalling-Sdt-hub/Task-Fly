import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/reg_exp_helper.dart';

class ProfileController extends GetxController {
  List languages = ["English", "French", "Arabic"];
  List gender = const ["Male", "Female", "Other"];

  String selectedLanguage = "English";
  String? image;

  TextEditingController nameController = TextEditingController(text: kDebugMode ? "Jamesson noah" : "");
  TextEditingController emailController = TextEditingController(text: kDebugMode ? "jameson@gmail.com" : "");
  TextEditingController numberController = TextEditingController(text: kDebugMode ? "+1-9911544854" : "");
  TextEditingController addressController = TextEditingController(text: kDebugMode ? "Featherstone street" : "");
  TextEditingController dateOfBirthController = TextEditingController(text: kDebugMode ? "25/08/1999" : "");


  TextEditingController ageController = TextEditingController(text: kDebugMode ? "Jamesson noah" : "");
  TextEditingController genderController = TextEditingController(text: kDebugMode ? "Jamesson noah" : "");
  TextEditingController descriptionController = TextEditingController(text: kDebugMode ? "Jamesson noah" : "");


  static ProfileController get instance => Get.put(ProfileController()) ;

  selectedGender(int index) {
    genderController.text = gender[index].toString();
    update();
    Get.back();
  }

  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  selectLanguage(int index) {
    selectedLanguage = languages[index];
    update();
    Get.back();
  }
}
