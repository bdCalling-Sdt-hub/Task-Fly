import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import '../../../../../controllers/provider/task_details_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../component/text_field/common_text_field.dart';

sendOfferPanel() {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return const SendOffer();
    },
  );
}

class SendOffer extends StatelessWidget {
  const SendOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const CommonText(
                  text: AppString.sendYourOffer,
                  fontSize: 24,
                ),
                GestureDetector(
                    onTap: () => Get.back(), child: const Icon(Icons.clear)),
              ],
            ),
            16.height,
            // const CommonText(
            //   text: AppString.taskName,
            //   bottom: 12,
            // ),
            // CommonTextField(
            //   hintText: AppString.taskName,
            //   controller: TaskDetailsController.instance.taskNameController,
            //   validator: OtherHelper.validator,
            //   fillColor: AppColors.p_50,
            // ),
            // const CommonText(
            //   text: AppString.taskDetails,
            //   bottom: 12,
            // ),
            // CommonTextField(
            //   hintText: AppString.taskDetails,
            //   controller: TaskDetailsController.instance.taskDetailsController,
            //   validator: OtherHelper.validator,
            //   fillColor: AppColors.p_50,
            // ),
            const CommonText(
              text: AppString.inputYourOfferPrice,
              bottom: 12,
            ),
            CommonTextField(
              hintText: AppString.inputYourOfferPrice,
              controller: TaskDetailsController.instance.priceController,
              validator: OtherHelper.validator,
              keyboardType: TextInputType.number,
              suffixIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.keyboard_arrow_up),
                    onTap: () {
                      int currentValue = int.tryParse(TaskDetailsController
                              .instance.priceController.text) ??
                          0;
                      TaskDetailsController.instance.priceController.text =
                          (currentValue + 1).toString();
                    },
                  ),
                  GestureDetector(
                    child: const Icon(Icons.keyboard_arrow_down_outlined),
                    onTap: () {
                      int currentValue = int.tryParse(TaskDetailsController
                              .instance.priceController.text) ??
                          0;
                      if (currentValue > 0) {
                        TaskDetailsController.instance.priceController.text =
                            (currentValue - 1).toString();
                      }
                    },
                  ),
                ],
              ),
              fillColor: AppColors.p_50,
            ),
            const CommonText(
              text: AppString.reasonForOfferPrice,
              bottom: 12,
            ),
            CommonTextField(
              hintText: AppString.reasonForOfferPrice,
              controller: TaskDetailsController.instance.descriptionController,
              validator: OtherHelper.validator,
              fillColor: AppColors.p_50,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CommonButton(
                  titleText: AppString.cancel,
                  buttonColor: AppColors.s_600,
                  borderColor: AppColors.transparent,
                  onTap: () => Get.back(),
                  buttonHeight: 44,
                )),
                16.width,
                Expanded(
                    child: CommonButton(
                  titleText: AppString.sendYourOffer,
                  buttonColor: AppColors.primaryColor,
                  buttonHeight: 44,
                  onTap: () => Get.back(),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
