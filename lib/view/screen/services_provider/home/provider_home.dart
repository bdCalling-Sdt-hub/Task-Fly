import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_icons.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/button_with_icon.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/available_task_card.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/filter.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/sort.dart';

class ServiceProviderHome extends StatelessWidget {
  const ServiceProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => print("vdfasf"),
              icon: const Icon(Icons.headset_mic_outlined)),
          IconButton(
              onPressed: () => print("vdfasf"),
              icon: const Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: ButtonWithIcon(
                    titleText: AppString.postTask,
                    iconData: Icons.add_photo_alternate_sharp,
                    buttonColor: AppColors.p_500,
                    titleColor: AppColors.white,
                    iconColor: AppColors.white,
                  ),
                ),
                16.width,
                const Expanded(
                  child: ButtonWithIcon(
                    titleText: AppString.search,
                    iconData: Icons.search,
                    buttonColor: AppColors.transparent,
                    borderColor: AppColors.s_600,
                  ),
                ),
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
                      onTap: () => Get.toNamed(AppRoutes.taskDetails),
                      child: const AvailableTaskCard());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
