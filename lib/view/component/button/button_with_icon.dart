import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import '../../../utils/app_colors.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color iconColor;
  final Color? borderColor;
  final double borderWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final IconData? iconData;
  final String? svg;

  final bool isLoading;

  const ButtonWithIcon(
      {this.onTap,
      required this.titleText,
      this.titleColor = AppColors.black,
      this.iconColor = AppColors.black,
      this.buttonColor = AppColors.primaryColor,
      this.titleSize = 20,
      this.buttonRadius = 10,
      this.titleWeight = FontWeight.w500,
      this.buttonHeight = 42,
      this.borderWidth = 1,
      this.iconData,
      this.svg,
      this.isLoading = false,
      this.buttonWidth = double.infinity,
      this.borderColor = AppColors.primaryColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight.h,
      width: buttonWidth.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            backgroundColor: WidgetStateProperty.all(buttonColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius.r),
                side: BorderSide(
                    color: borderColor ?? AppColors.primaryColor,
                    width: borderWidth.w),
              ),
            ),
            elevation: WidgetStateProperty.all(0)),
        child: isLoading
            ? Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconData != null)
                    Icon(
                      iconData,
                      color: iconColor,
                    ),
                  if (svg != null)
                    CommonImage(
                      imageColor: iconColor,
                      imageSrc: svg!,
                      imageType: ImageType.svg,
                      height: 24,
                      width: 24,
                    ),
                  if (iconData != null || svg != null) 8.width,
                  Flexible(
                    child: Text(
                      titleText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexendDeca(
                          color: titleColor,
                          fontSize: titleSize.sp,
                          fontWeight: titleWeight),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
