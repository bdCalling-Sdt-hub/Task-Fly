import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import '../../../../controllers/common_controller/profile/profile_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/image/common_image.dart';
import '../../../component/other_widgets/item.dart';
import '../../../component/pop_up/common_pop_menu.dart';
import '../../../component/text/common_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: AppColors.clientColor,
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: Container(
                  height: Get.height,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      70.height,
                      const CommonText(
                        text: "Naimul Hassan",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        top: 20,
                        bottom: 24,
                      ),
                      Item(
                        icon: Icons.person,
                        title: AppString.personalInformation,
                        onTap: () => Get.toNamed(AppRoutes.editProfile),
                      ),
                      Item(
                        icon: Icons.settings,
                        title: AppString.settings,
                        onTap: () => Get.toNamed(AppRoutes.setting),
                      ),
                      Item(
                        icon: Icons.sync_alt,
                        title: AppString.settings,
                        onTap: () => Get.toNamed(AppRoutes.setting),
                      ),
                      Item(
                        icon: Icons.logout,
                        title: AppString.logOut,
                        onTap: () => logOutPopUp(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: (Get.width - 140.sp) / 2,
                child: Container(
                  width: 140.sp,
                  height: 140.sp,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 70.sp,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0, 2),
                                blurRadius: 6,
                                spreadRadius: 1, // Light spread
                              ),
                            ],
                          ),
                          child: CommonImage(
                            imageSrc: AppImages.profile,
                            imageType: ImageType.png,
                            height: 130,
                            width: 130,
                            defaultImage: AppImages.profile,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 3,
      ),
    );
  }
}
