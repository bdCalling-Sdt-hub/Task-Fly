import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/helpers/prefs_helper.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/text/common_text.dart';

switchPosterRole() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                    onTap: () => Get.back(), child: const Icon(Icons.clear))
                .end,
            const CommonText(
              text: AppString.switchDetails,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              maxLines: 4,
              top: 8,
              bottom: 24,
            ),
            GestureDetector(
               onTap: PrefsHelper.changeRole,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sync_alt,
                    ),
                    CommonText(text: "Switch to Poster")
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

switchTaskerRole() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                    onTap: () => Get.back(), child: const Icon(Icons.clear))
                .end,
            const CommonText(
              text: AppString.switchTaskerDetails,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              maxLines: 4,
              top: 8,
              bottom: 24,
            ),
            GestureDetector(
              onTap: PrefsHelper.changeRole,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sync_alt,
                    ),
                    CommonText(text: "Switch to Tasker")
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
