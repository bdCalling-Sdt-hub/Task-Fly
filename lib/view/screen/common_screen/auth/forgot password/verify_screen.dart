import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import '../../../../../controllers/common_controller/auth/forget_password_controller.dart';
import '../../../../../utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ForgetPasswordController.instance.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.forgotPassword,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CommonImage(
                  imageSrc: AppImages.verificationImage,
                  imageType: ImageType.png,
                  height: 288,
                  width: 288,
                ).center,
                const CommonText(
                  text: AppString.enterVerifyOTPCode,
                  fontSize: 24,
                  color: AppColors.p_400,
                ),
                CommonText(
                  text:
                      "${AppString.codeHasBeenSendTo} ${controller.emailController.text}",
                  fontSize: 16,
                  color: AppColors.textIcon_400,
                  maxLines: 2,
                  bottom: 24,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: PinCodeTextField(
                    controller: controller.otpController,
                    validator: (value) {
                      if (value != null && value.length == 4) {
                        return null;
                      } else {
                        return AppString.otpIsInValid;
                      }
                    },
                    autoDisposeControllers: false,
                    cursorColor: AppColors.black,
                    appContext: (context),
                    autoFocus: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 60.h,
                      fieldWidth: 60.w,
                      activeFillColor: AppColors.secondary,
                      selectedFillColor: AppColors.secondary,
                      inactiveFillColor: AppColors.secondary,
                      borderWidth: 2,
                      selectedColor: AppColors.transparent,
                      activeColor: AppColors.transparent,
                      inactiveColor: AppColors.transparent,
                    ),
                    length: 4,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.disabled,
                    enableActiveFill: true,
                  ),
                ),
                const CommonText(
                  text: AppString.didNotReceiveTheOTP,
                  color: AppColors.textIcon_400,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  bottom: 12,
                ).start,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: controller.time,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                    GestureDetector(
                      onTap: () => print("fkjhdk"),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.black)),
                        child: const CommonText(
                          text: AppString.resendCode,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                50.height,
                CommonButton(
                  titleText: AppString.verify,
                  isLoading: controller.isLoadingVerify,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.verifyOtpRepo();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
