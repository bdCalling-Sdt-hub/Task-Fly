import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/helpers/prefs_helper.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/screen/common_screen/profile/widget/profile_image.dart';
import '../../../../controllers/common_controller/profile/profile_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_string.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/other_widgets/item.dart';
import '../../../component/pop_up/common_pop_menu.dart';
import '../../../component/text/common_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                top: 170,
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
                        bottom: 24,
                      ),
                      Item(
                        icon: Icons.person,
                        title: AppString.personalInformation,
                        onTap: () => Get.toNamed(AppRoutes.personalInfo),
                      ),
                      if (PrefsHelper.myRole == "tasker")
                        Item(
                          icon: Icons.wallet,
                          title: AppString.wallet,
                          onTap: () => Get.toNamed(AppRoutes.myWallet),
                        ),
                      Item(
                        icon: Icons.settings,
                        title: AppString.settings,
                        onTap: () => Get.toNamed(AppRoutes.setting),
                      ),
                      Item(
                        icon: Icons.sync_alt,
                        title: PrefsHelper.myRole == "tasker"
                            ? "Switch to Poster"
                            : "Switch to Tasker",
                        onTap: PrefsHelper.changeRole,
                      ),
                      100.height,
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
                top: 100,
                left: (Get.width - 140.sp) / 2,
                child: const ProfileImage(),
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
