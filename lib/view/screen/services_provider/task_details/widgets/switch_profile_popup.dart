import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/view/component/text/common_text.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';

class SwitchProfilePopUp{
  static switchProfileDialog(){
    showDialog(
        context: Get.context!,
        builder: (context){
          return  AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    onTap: () => Get.back(), child:const  Icon(
                    color: AppColors.p_500,
                    Icons.clear))
                    .end,
               const CommonText(

                  text: AppString.youAreOnTheWrongProfile,
                  fontSize: 22,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color:  AppColors.p_500,
                  maxLines: 4,
                  top: 8,

                ),
              ],
            ),
          );
        });
  }
}