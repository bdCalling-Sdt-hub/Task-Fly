import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/view/component/button/common_button.dart';

import '../../../../../controllers/worker/report_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';

dateFilter() {
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12),
        content: GetBuilder<ReportController>(
          builder: (controller) {
            controller.startDateController.clear();
            controller.endDateController.clear();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      30.height,
                      CommonTextField(
                        controller: controller.startDateController,
                        borderColor: AppColors.clientColor,
                        labelText: AppString.startDate,
                        onTap: () => OtherHelper.dateOfBirthPicker(
                            controller.startDateController),
                        validator: OtherHelper.validator,
                        keyboardType: TextInputType.none,
                        suffixIcon: IconButton(
                          onPressed: () => OtherHelper.dateOfBirthPicker(
                              controller.startDateController),
                          icon: const Icon(
                            Icons.date_range,
                            color: AppColors.p_500,
                          ),
                        ),
                      ),
                      20.height,
                      CommonTextField(
                        controller: controller.endDateController,
                        borderColor: AppColors.clientColor,
                        labelText: AppString.endDate,
                        keyboardType: TextInputType.none,
                        onTap: () => OtherHelper.dateOfBirthPicker(
                            controller.endDateController),
                        validator: OtherHelper.validator,
                        suffixIcon: IconButton(
                          onPressed: () => OtherHelper.dateOfBirthPicker(
                              controller.endDateController),
                          icon: const Icon(
                            Icons.date_range,
                            color: AppColors.p_500,
                          ),
                        ),
                      ),
                      30.height,
                      CommonButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Get.back();
                            }
                          },
                          titleText: AppString.continues)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
