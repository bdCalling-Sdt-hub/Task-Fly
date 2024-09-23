import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../models/notification_model.dart';
import '../../../../../extension/my_extension.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../component/text/common_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.item});

  final NotificationModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 35.r,
            child: const ClipOval(
              child: Icon(
                Icons.notifications_outlined,
                color: AppColors.primaryColor,
                size: 36,
              ),
            ),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: item.message,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.start,
                  top: 4,
                  bottom: 4,
                ),
                CommonText(
                  text: item.createdAt.checkTime,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  color: AppColors.black,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
