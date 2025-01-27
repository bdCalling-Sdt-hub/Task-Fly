import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/back.dart';
import 'package:task_fly/view/screen/common_screen/notifications/widget/empty_notification.dart';
import '../../../../controllers/common_controller/notifications/notifications_controller.dart';
import '../../../../models/api_response_model.dart';
import '../../../../models/notification_model.dart';

import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/other_widgets/common_loader.dart';
import '../../../component/screen/error_screen.dart';
import '../../../component/text/common_text.dart';
import 'widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        centerTitle: true,
        title: CommonText(
          text: AppString.notifications,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CommonLoader(),
            Status.error => ErrorScreen(
                onTap: NotificationsController.instance.getNotificationsRepo),
            Status.completed => controller.notifications.isEmpty
                ? const EmptyNotification()
                : ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 10.sp),
                    itemCount: controller.notifications.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      NotificationModel item = controller.notifications[index];
                      return NotificationItem(
                        item: item,
                      );
                    },
                  )
          };
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
