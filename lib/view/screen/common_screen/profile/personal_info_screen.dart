import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/screen/common_screen/profile/widget/profile_image.dart';
import '../../../../controllers/common_controller/profile/profile_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../component/image/common_image.dart';
import '../../../component/other_widgets/item.dart';
import '../../../component/text/common_text.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        title: const CommonText(
          text: AppString.personalInformation,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),
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
                        bottom: 8,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.editProfile),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.textIcon_500,
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.only(right: 24),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.mode_edit_outline_rounded,
                                color: AppColors.white,
                              ),
                              CommonText(
                                text: AppString.edit,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        ).end,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const CommonText(
                                text: AppString.fullName,
                                fontSize: 20,
                                left: 24,
                              ).start,
                              Item(
                                icon: Icons.person,
                                title: controller.nameController.text,
                                disableIcon: true,
                              ),
                              const CommonText(
                                text: AppString.email,
                                fontSize: 20,
                                top: 6,
                                left: 24,
                              ).start,
                              Item(
                                title: controller.emailController.text,
                                disableIcon: true,
                              ),
                              const CommonText(
                                text: AppString.dateOfBirth,
                                fontSize: 20,
                                top: 6,
                                left: 24,
                              ).start,
                              Item(
                                title: controller.dateOfBirthController.text,
                                disableIcon: true,
                              ),
                              const CommonText(
                                text: AppString.contactNumber,
                                fontSize: 20,
                                top: 6,
                                left: 24,
                              ).start,
                              Item(
                                title: controller.numberController.text,
                                disableIcon: true,
                              ),
                              const CommonText(
                                text: AppString.address,
                                fontSize: 20,
                                top: 6,
                                left: 24,
                              ).start,
                              Item(
                                title: controller.addressController.text,
                                disableIcon: true,
                              ),
                              30.height
                            ],
                          ),
                        ),
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
    );
  }
}
