import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class ProviderInfo extends StatelessWidget {
  const ProviderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        Row(
          children: [
            CircleAvatar(
              radius: 25.sp,
              child: ClipOval(
                child: CommonImage(
                  imageSrc: AppImages.providerProfile,
                  imageType: ImageType.png,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            8.width,
            const CommonText(
              text: "Most ain Billah",
            ),
            20.width,
            const Spacer(),
            const CommonText(
              text: "4.0",
              fontSize: 18,
            ),
            RatingBarIndicator(
              itemCount: 5,
              itemSize: 16,
              rating: 4.0,
              itemPadding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                  size: 16,
                );
              },
            ),
            8.width,
            const Icon(CupertinoIcons.chat_bubble_text)
          ],
        )
      ],
    );
  }
}
