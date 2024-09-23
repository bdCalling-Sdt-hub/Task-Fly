import 'package:flutter/cupertino.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage(
            imageSrc: AppImages.emptyNotification,
            height: 220,
            width: 220,
            imageType: ImageType.png,
          ).center,
          const CommonText(
            text: AppString.thereAreNoNotificationsAvailable,
            fontSize: 28,
            maxLines: 2,
            left: 20,
            right: 20,
            top: 20,
          ),
          const CommonText(
            text: AppString.emptyNotificationDetails,
            maxLines: 2,
            top: 20,
          ),
        ],
      ),
    );
  }
}
