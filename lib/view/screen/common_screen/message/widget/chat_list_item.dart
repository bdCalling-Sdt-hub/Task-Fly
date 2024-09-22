import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_fly/utils/app_images.dart';
import '../../../../../extension/my_extension.dart';
import '../../../../../models/chat_list_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';

Widget chatListItem({required Chat item}) {
  return Container(
    padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
    decoration: const BoxDecoration(color: AppColors.transparent),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 35.sp,
              child: ClipOval(
                child: CommonImage(
                  imageSrc: item.participant.image,
                  imageType: ImageType.network,
                  defaultImage: AppImages.profile,
                  height: 70,
                  width: 70,
                ),
              ),
            ),
            12.width,
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: item.participant.fullName,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  CommonText(
                    text: item.latestMessage.message,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ],
              ),
            )),
            12.width,
            const CommonText(
              text: "12:40 PM",
              textAlign: TextAlign.start,
              color: AppColors.p_500,
              fontSize: 14,
            )
          ],
        ),
        16.height,
        const Divider(
          height: 1,
        )
      ],
    ),
  );
}
