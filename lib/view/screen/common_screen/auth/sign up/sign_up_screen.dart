import 'package:flutter/material.dart';
import '../../../../../extension/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/common_controller/auth/sign_up_controller.dart';
import '../../../../../helpers/prefs_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/text/common_text.dart';
import 'widget/already_accunt_rich_text.dart';
import 'widget/sign_up_all_filed.dart';
import 'widget/terms.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<SignUpController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(children: [
                  const CommonText(
                    text: AppString.createYourAccount,
                    fontSize: 28,
                    maxLines: 2,
                    bottom: 8,
                    color: AppColors.p_500,
                  ),
                  const CommonText(
                    text: AppString.accountDetails,
                    fontSize: 14,
                    bottom: 8,
                    maxLines: 2,
                    color: AppColors.textIcon_400,
                  ),
                  const SignUpAllField(),
                  16.height,
                  Row(
                    children: [
                      Checkbox(
                        value: controller.isAgree,
                        onChanged: (value) => print(value),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      const Expanded(child: Terms()),
                    ],
                  ),
                  16.height,
                  CommonButton(
                    titleText: AppString.signUp,
                    isLoading: controller.isLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.signUpUser();
                        PrefsHelper.myRole = controller.selectRole;
                      }
                    },
                  ),
                  24.height,
                  const AlreadyAccountRichText()
                ]),
              ),
            );
          },
        ));
  }
}
