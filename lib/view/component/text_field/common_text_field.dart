import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors.dart';
import '../text/common_text.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.isPassword = false,
      this.controller,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.mexLength,
      this.maxLines = 1,
      this.validator,
      this.prefixText,
      this.paddingHorizontal = 16,
      this.paddingVertical = 14,
      this.borderRadius = 12,
      this.inputFormatters,
      this.fillColor = AppColors.transparent,
      this.hintTextColor = AppColors.textColor,
      this.labelTextColor = AppColors.textColor,
      this.textColor = AppColors.black,
      this.borderColor = AppColors.textIcon_50,
      this.onSubmitted,
      this.onTap,
      this.suffixIcon});

  final String? hintText;
  final String? labelText;
  final String? prefixText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color borderColor;

  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final int? mexLength;
  final int maxLines;

  final bool isPassword;
  RxBool obscureText = false.obs;

  final Function(String)? onSubmitted;
  final VoidCallback? onTap;

  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        obscureText: obscureText.value,
        textInputAction: textInputAction,
        maxLength: mexLength,
        cursorColor: AppColors.white,
        inputFormatters: inputFormatters,
        style: TextStyle(fontSize: 14, color: textColor),
        onFieldSubmitted: onSubmitted,
        onTap: onTap,
        maxLines: maxLines,
        decoration: InputDecoration(
          errorMaxLines: 2,
          filled: true,
          prefixIcon: prefixIcon,
          fillColor: fillColor,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: BorderSide(color: borderColor),
          ),
          hintText: hintText,
          labelText: labelText,
          hintStyle: GoogleFonts.roboto(fontSize: 14, color: hintTextColor),
          labelStyle: GoogleFonts.roboto(fontSize: 14, color: labelTextColor),
          prefix: CommonText(
            text: prefixText ?? "",
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: toggle,
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 10.w),
                      child: Obx(
                        () => Icon(
                          obscureText.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20.sp,
                          color: textColor,
                        ),
                      )),
                )
              : suffixIcon,
        ),
      ),
    );
  }

  void toggle() {
    obscureText.value = !obscureText.value;
  }
}
