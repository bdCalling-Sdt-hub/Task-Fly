import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_routes.dart';
import '../../../utils/app_colors.dart';

class CommonBottomNavBar extends StatefulWidget {
  const CommonBottomNavBar({super.key});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  var bottomNavIndex = 0;
  List<Widget> unselectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.white),
    const Icon(Icons.notifications_outlined, color: AppColors.white),
    const Icon(Icons.chat, color: AppColors.white),
    const Icon(Icons.person_2_outlined, color: AppColors.white),
  ];

  List<Widget> selectedIcons = [
    const Icon(Icons.home, color: AppColors.white),
    const Icon(Icons.notifications, color: AppColors.white),
    const Icon(Icons.chat, color: AppColors.white),
    const Icon(Icons.person, color: AppColors.white),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
            color: AppColors.bottomNavColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(unselectedIcons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.all(12.sp),
                child: Column(
                  children: [
                    index == bottomNavIndex
                        ? selectedIcons[index]
                        : unselectedIcons[index],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    if (index == 0) {
      Get.toNamed(AppRoutes.serviceProviderHome);
    } else if (index == 1) {
      Get.toNamed(AppRoutes.notifications);
    } else if (index == 2) {
      Get.toNamed(AppRoutes.chat);
    } else if (index == 3) {
      Get.toNamed(AppRoutes.profile);
    }
  }
}
