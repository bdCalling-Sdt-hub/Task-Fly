import 'package:flutter/material.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';
import 'package:task_fly/view/screen/common_screen/profile/widget/profile_image.dart';
import '../../../../../extension/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/common_controller/profile/profile_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../component/back.dart';
import '../../../component/button/common_button.dart';
import '../../../component/text/common_text.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 2),
                  shape: BoxShape.circle,
                  color: AppColors.transparent),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
        ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        70.height,
                        const CommonText(
                          text: "Naimul Hassan",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          bottom: 24,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const CommonText(
                                  text: AppString.fullName,
                                  fontSize: 20,
                                  bottom: 8,
                                ).start,
                                textFieldDecoration(
                                  CommonTextField(
                                    controller: controller.nameController,
                                    hintText: AppString.fullName,
                                  ),
                                ),
                                const CommonText(
                                  text: AppString.contactNumber,
                                  fontSize: 20,
                                  top: 16,
                                  bottom: 8,
                                ).start,
                                textFieldDecoration(
                                  CommonTextField(
                                    controller: controller.numberController,
                                    hintText: AppString.contactNumber,
                                  ),
                                ),
                                const CommonText(
                                  text: AppString.address,
                                  fontSize: 20,
                                  top: 16,
                                  bottom: 8,
                                ).start,
                                textFieldDecoration(
                                  CommonTextField(
                                    controller: controller.addressController,
                                    hintText: AppString.address,
                                  ),
                                ),
                                30.height,
                                CommonButton(
                                  titleText: AppString.saveAndChanges,
                                  onTap: () => Get.toNamed(AppRoutes.profile),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: (Get.width - 140.sp) / 2,
                child: const ProfileImage(
                  takeImage: true,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  textFieldDecoration(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
