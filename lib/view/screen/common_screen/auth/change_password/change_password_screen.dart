import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../extension/my_extension.dart';
import '../../../../../controllers/common_controller/auth/change_password_controller.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../helpers/reg_exp_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.changePassword,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  const CommonText(
                    text: AppString.currentPassword,
                    fontSize: 20,
                    bottom: 8,
                  ),
                  textFieldDecoration(
                    CommonTextField(
                      controller: controller.currentPasswordController,
                      hintText: AppString.currentPassword,
                      validator: OtherHelper.passwordValidator,
                      isPassword: true,
                      fillColor: AppColors.s_500,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  const CommonText(
                    text: AppString.newPassword,
                    fontSize: 20,
                    bottom: 8,
                    top: 20,
                  ),
                  textFieldDecoration(
                    CommonTextField(
                      controller: controller.newPasswordController,
                      hintText: AppString.newPassword,
                      validator: OtherHelper.passwordValidator,
                      isPassword: true,
                      fillColor: AppColors.s_500,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  const CommonText(
                    text: AppString.confirmPassword,
                    fontSize: 20,
                    bottom: 8,
                    top: 20,
                  ),
                  textFieldDecoration(
                    CommonTextField(
                      controller: controller.confirmPasswordController,
                      hintText: AppString.confirmPassword,
                      validator: (value) =>
                          OtherHelper.confirmPasswordValidator(
                              value, controller.newPasswordController),
                      isPassword: true,
                      fillColor: AppColors.s_500,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                      child: CommonText(
                        text: AppString.forgotPassword,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        top: 16.h,
                        bottom: 20.h,
                      ),
                    ),
                  ),
                  50.height,
                  CommonButton(
                    titleText: AppString.changePassword      ,
                    isLoading: controller.isLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.changePasswordRepo();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  textFieldDecoration(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.s_100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
