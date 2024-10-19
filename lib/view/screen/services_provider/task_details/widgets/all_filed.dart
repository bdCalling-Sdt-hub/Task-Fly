import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/helpers/other_helper.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';

import '../../../../../controllers/provider/task_details_controller.dart';

class AllFiled extends StatelessWidget {
  const AllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CommonText(
                    text: AppString.location,
                    bottom: 12,
                  ),
                  CommonTextField(
                    hintText: AppString.location,
                    controller:
                        TaskDetailsController.instance.locationController,
                    validator: OtherHelper.validator,
                    fillColor: AppColors.p_50,
                  ),
                ],
              ),
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CommonText(text: AppString.date, bottom: 12),
                  CommonTextField(
                    hintText: AppString.date,
                    controller: TaskDetailsController.instance.dateController,
                    validator: OtherHelper.validator,
                    fillColor: AppColors.p_50,
                  ),
                ],
              ),
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CommonText(
                    text: AppString.time,
                    bottom: 12,
                  ),
                  CommonTextField(
                    hintText: AppString.time,
                    controller: TaskDetailsController.instance.timeController,
                    validator: OtherHelper.validator,
                    fillColor: AppColors.p_50,
                  ),
                ],
              ),
            )
          ],
        ),
        const CommonText(
          text: AppString.taskDetails,
          bottom: 12,
          top: 10,
        ),
        CommonTextField(
          hintText: AppString.taskDetails,
          controller: TaskDetailsController.instance.taskDetailsController,
          validator: OtherHelper.validator,
          fillColor: AppColors.p_50,
        ),
        const CommonText(
          text: AppString.workplace,
          bottom: 12,
          top: 10,
        ),
        CommonTextField(
          hintText: AppString.workplace,
          controller: TaskDetailsController.instance.taskTypeController,
          validator: OtherHelper.validator,
          fillColor: AppColors.p_50,
        ),
        const CommonText(
          text: AppString.attachments,
          bottom: 12,
          top: 10,
        ),
        Container(
          height: 82,
          decoration: const BoxDecoration(color: AppColors.p_50),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: CommonImage(
                  imageSrc: AppImages.providerProfile,
                  imageType: ImageType.png,
                  height: 20,
                  width: 100,
                  fill: BoxFit.fill,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
