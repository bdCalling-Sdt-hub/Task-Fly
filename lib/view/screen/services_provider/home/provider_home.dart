import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/provider/provider_home_controller.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_icons.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/button_with_icon.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/available_task_card.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/filter.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/sort.dart';

import '../../../component/bottom_nav_bar/common_bottom_bar.dart';

class ServiceProviderHome extends StatelessWidget {
  const ServiceProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CommonImage(
            imageSrc: AppImages.tLogo,
            imageType: ImageType.png,
            height: 70,
            width: 48,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () => print("vdfasf"),
              child: CommonImage(
                imageSrc: AppIcons.support,
              )),
          IconButton(
              onPressed: () => Get.toNamed(AppRoutes.notifications),
              icon: CommonImage(
                imageSrc: AppIcons.notification,
              )),
          16.width
        ],
      ),
      body: GetBuilder<ProviderHomeController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  15.height,
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWithIcon(
                          onTap: controller.postTaskOnTap,
                          titleText: AppString.postTask,
                          iconData: Icons.add_photo_alternate_sharp,
                          borderColor: AppColors.transparent,
                          buttonColor: AppColors.p_500,
                          titleColor: AppColors.white,
                          iconColor: AppColors.white,
                        ),
                      ),
                      16.width,
                      Expanded(
                          child: SizedBox(
                        height: 34,
                        child: CommonTextField(
                          paddingVertical: 0,
                          paddingHorizontal: 4,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                          hintText: AppString.search,
                        ),
                      )),
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      const Expanded(
                        child: ButtonWithIcon(
                          titleText: AppString.filter,
                          onTap: filterPanel,
                          iconData: Icons.tune,
                          borderColor: AppColors.p_500,
                          buttonColor: AppColors.transparent,
                          titleColor: AppColors.textColor,
                          iconColor: AppColors.textColor,
                        ),
                      ),
                      16.width,
                      const Expanded(
                        child: ButtonWithIcon(
                          onTap: sortPanel,
                          titleText: AppString.sort,
                          svg: AppIcons.sort,
                          buttonColor: AppColors.transparent,
                          borderColor: AppColors.p_500,
                          titleColor: AppColors.textColor,
                          iconColor: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  const CommonText(
                    text: AppString.availableTasks,
                    fontSize: 24,
                    top: 16,
                    color: AppColors.textIcon_500,
                  ).start,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.taskDetails,
                                parameters: {"type": "sendOffer"}),
                            child: const AvailableTaskCard());
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 80,
                right: (MediaQuery.of(context).size.width / 2) - 60.w,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.location),
                  child: CommonImage(
                    imageSrc: AppIcons.location,
                    imageType: ImageType.svg,
                    height: 40,
                    width: 80,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
