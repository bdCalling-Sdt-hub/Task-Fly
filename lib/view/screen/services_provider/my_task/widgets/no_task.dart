import 'package:flutter/cupertino.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class NoTask extends StatelessWidget {
  const NoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonImage(
          imageSrc: AppImages.noTask,
          imageType: ImageType.png,
          height: 260,
          width: 324,
        ),
        const CommonText(
          text: AppString.thereNoTasks,
          fontSize: 20,
          color: AppColors.textIcon_500,
        ),
        const CommonText(
          text: AppString.noTaskDetails,
          fontWeight: FontWeight.w400,
          color: AppColors.textIcon_500,
          maxLines: 3,
          left: 50,
          right: 50,
        )
      ],
    );
  }
}
