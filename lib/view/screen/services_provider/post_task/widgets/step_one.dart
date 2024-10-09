import 'package:flutter/material.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CommonText(
          text: AppString.whatDoYouNeed,
          bottom: 8,
          top: 20,
        ),
        CommonTextField(
          hintText: AppString.enterYourTaskName,
          fillColor: AppColors.p_50,
        ),
        const CommonText(
          text: AppString.whatDoYouNeed,
          bottom: 8,
          top: 12,
        ),
        CommonTextField(
          hintText: AppString.giveDetailsAboutYourTask,
          fillColor: AppColors.p_50,
          maxLines: 5,

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
        Container()
      ],
    );
  }
}
