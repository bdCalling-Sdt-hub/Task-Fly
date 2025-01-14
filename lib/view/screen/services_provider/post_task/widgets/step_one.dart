import 'package:flutter/material.dart';
import 'package:task_fly/controllers/provider/post_task_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CommonText(
            text: AppString.taskTitle,
            bottom: 8,
            top: 20,
          ),
          CommonTextField(
            mexLength: 30,
            hintText: AppString.taskTitle,
            fillColor: AppColors.p_50,
          ),
          const CommonText(
            text: AppString.whatDoYouNeed,
            bottom: 8,
            top: 20,
          ),
          CommonTextField(
            hintText: AppString.enterYourTaskName,
            fillColor: AppColors.p_50,
            mexLength: 30,
          ),
          const CommonText(
            text: AppString.taskDetails,
            bottom: 8,
            top: 12,
          ),
          CommonTextField(
            hintText: AppString.giveDetailsAboutYourTask,
            fillColor: AppColors.p_50,
            maxLines: 5,
            mexLength: 200,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: AppString.uploadImage,
                bottom: 8,
                top: 20,
              ),
              CommonText(
                text: AppString.optional,
                bottom: 8,
                top: 20,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.p_50, borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(8),
            child: const Center(
              child: Icon(
                Icons.photo_library_outlined,
                size: 55,
              ),
            ),
          ),
          20.height,
          CommonButton(
            titleText: AppString.next,
            onTap: () => PostTaskController.instance.changeStep(1),
          ),
          30.height
        ],
      ),
    );
  }
}
