import 'package:flutter/material.dart';
import 'package:task_fly/utils/app_colors.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../extension/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/common_controller/auth/forget_password_controller.dart';
import '../../../../../helpers/reg_exp_helper.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.resetPassword,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonImage(
                    imageSrc: AppImages.verificationImage,
                    imageType: ImageType.png,
                    height: 288,
                    width: 288,
                  ).center,
                  const CommonText(
                    text: AppString.resetPassword,
                    fontSize: 24,
                    color: AppColors.p_500,
                    textAlign: TextAlign.start,
                  ).center,
                  const CommonText(
                    text: AppString.passwordMustCharacters,
                    fontSize: 16,
                    color: AppColors.textIcon_400,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    maxLines: 2,
                  ).center,
                  CommonText(
                    text: AppString.password,
                    top: 16.h,
                    bottom: 8.h,
                  ),
                  CommonTextField(
                    controller: controller.passwordController,
                    prefixIcon: const Icon(Icons.lock),
                    hintText: AppString.password,
                    isPassword: true,
                    validator: OtherHelper.passwordValidator,
                  ),
                  CommonText(
                    text: AppString.confirmPassword,
                    top: 16.h,
                    bottom: 8.h,
                  ),
                  CommonTextField(
                    controller: controller.confirmPasswordController,
                    prefixIcon: const Icon(Icons.lock),
                    hintText: AppString.confirmPassword,
                    validator: (value) => OtherHelper.confirmPasswordValidator(
                        value, controller.passwordController),
                    isPassword: true,
                  ),
                  64.height,
                  CommonButton(
                    titleText: AppString.updatePassword,
                    isLoading: controller.isLoadingReset,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPasswordRepo();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
