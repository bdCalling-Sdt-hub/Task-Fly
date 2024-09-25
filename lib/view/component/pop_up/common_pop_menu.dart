import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import '../../../helpers/prefs_helper.dart';
import '../../../helpers/reg_exp_helper.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';
import '../text_field/common_text_field.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.onTap,
      this.height = 30,
      this.selectedColor = AppColors.primaryColor,
      this.unselectedColor = Colors.transparent,
      this.style,
      this.isContainer = false,
      this.iconColor = AppColors.black,
      this.iconData = Icons.keyboard_arrow_down_outlined});

  final List items;
  final List selectedItem;
  final Color selectedColor;
  final Color iconColor;
  final Color unselectedColor;
  final double height;
  final Function(int index) onTap;
  final TextStyle? style;
  final bool isContainer;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(color: selectedColor)),
          offset: const Offset(1, 1),
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Column(
                    children: List.generate(
                      items.length,
                      (index) => GestureDetector(
                        onTap: () => onTap(index),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: selectedColor),
                                  color: selectedItem
                                          .contains(items[index].toString())
                                      ? selectedColor
                                      : unselectedColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                items[index].toString(),
                                style: style,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
          icon: Padding(
            padding: EdgeInsets.only(left: isContainer ? 40 : 0),
            child: Icon(
              iconData,
              color: iconColor,
              size: height,
            ),
          )),
    );
  }
}

logOutPopUp() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.all(12.sp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.height,
            const CommonText(
              text: AppString.youSureWantToLogout,
              maxLines: 2,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
              fontSize: 20,
              bottom: 12,
            ).start,
            const CommonText(
              text: AppString.logoutDetails,
              maxLines: 2,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              bottom: 16,
            ).start,
          ],
        ),
        actions: [
          Row(
            children: [
              Expanded(
                  child: CommonButton(
                titleText: AppString.cancel,
                borderWidth: 1.5,
                borderColor: AppColors.primaryColor,
                buttonColor: AppColors.transparent,
                titleColor: AppColors.primaryColor,
                onTap: () => Get.back(),
              )),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                  child: CommonButton(
                titleText: AppString.logOut,
                onTap: () => PrefsHelper.removeAllPrefData(),
              ))
            ],
          ),
        ],
      );
    },
  );
}

deletePopUp(
    {required TextEditingController controller,
    required VoidCallback onTap,
    bool isLoading = false}) {
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12),
        title: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.deleteTitle,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                maxLines: 1,
                bottom: 24.h,
              ),
              CommonText(
                text: AppString.deleteDetails,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                textAlign: TextAlign.start,
                maxLines: 2,
                bottom: 20.h,
              ),
              const CommonText(
                text: AppString.password,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                fontSize: 20,
                bottom: 8,
              ),
              CommonTextField(
                controller: controller,
                labelText: AppString.enterYouPassword,
                validator: OtherHelper.validator,
                isPassword: true,
              )
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  titleText: AppString.cancel,
                  titleColor: AppColors.black,
                  borderColor: AppColors.black,
                  buttonColor: AppColors.transparent,
                  buttonHeight: 48,
                  onTap: () => Get.back(),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: CommonButton(
                  titleText: AppString.delete,
                  titleColor: AppColors.black,
                  buttonHeight: 48,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      onTap();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

loginPopUp() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                    onTap: () => Get.back(), child: const Icon(Icons.clear))
                .end,
            const CommonText(
              text: AppString.loginPopDetails,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              maxLines: 4,
              top: 8,
              bottom: 24,
            ),
            CommonButton(
              titleText: AppString.signIn,
              onTap: () => Get.toNamed(AppRoutes.signIn),
            ),
            16.height,
            CommonButton(
              titleText: AppString.signUp,
              buttonColor: AppColors.transparent,
              onTap: () => Get.toNamed(AppRoutes.signUp),
            ),
          ],
        ),
      );
    },
  );
}
