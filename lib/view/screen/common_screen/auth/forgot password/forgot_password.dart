import 'package:flutter/material.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import '../../../../../extension/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/common_controller/auth/forget_password_controller.dart';
import '../../../../../helpers/reg_exp_helper.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/back.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: backButton(),
          title: const CommonText(
            text: AppString.forgotPassword,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonImage(
                  imageSrc: AppImages.forgotImage,
                  imageType: ImageType.png,
                  height: 288,
                  width: 288,
                ).center,
                CommonText(
                  text: AppString.email,
                  top: 30.h,
                  bottom: 8.h,
                ),
                CommonTextField(
                  controller: controller.emailController,
                  prefixIcon: const Icon(Icons.mail),
                  hintText: AppString.email,
                  validator: OtherHelper.emailValidator,
                ),
                100.height,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: CommonButton(
            titleText: AppString.getOtp,
            isLoading: controller.isLoadingEmail,
            onTap: () {
              if (formKey.currentState!.validate()) {
                controller.forgotPasswordRepo();
              }
            },
          ),
        ),
      ),
    );
  }
}
