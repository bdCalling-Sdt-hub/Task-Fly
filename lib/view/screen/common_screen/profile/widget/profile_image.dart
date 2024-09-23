import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_fly/controllers/common_controller/profile/profile_controller.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../component/image/common_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.takeImage = false});

  final bool takeImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.sp,
      height: 140.sp,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 70.sp,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 2),
                      blurRadius: 6,
                      spreadRadius: 1, // Light spread
                    ),
                  ],
                ),
                child: ProfileController.instance.image != null
                    ? Image.file(
                        File(
                          ProfileController.instance.image!,
                        ),
                        fit: BoxFit.fill,
                        height: 130.sp,
                        width: 130.sp,
                      )
                    : CommonImage(
                        imageSrc: AppImages.profile,
                        imageType: ImageType.png,
                        height: 130,
                        width: 130,
                        defaultImage: AppImages.profile,
                      ),
              ),
            ),
          ),
          if (takeImage)
            Positioned(
              top: 70,
              right: -8,
              child: GestureDetector(
                  onTap: ProfileController.instance.getProfileImage,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.textIcon_400),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.white,
                      ))),
            )
        ],
      ),
    );
  }
}
