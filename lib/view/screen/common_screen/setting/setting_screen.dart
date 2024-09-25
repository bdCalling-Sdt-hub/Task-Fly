import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../extension/my_extension.dart';
import 'package:get/get.dart';
import '../../../../controllers/common_controller/setting/setting_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/other_widgets/item.dart';
import '../../../component/pop_up/common_pop_menu.dart';
import '../../../component/text/common_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.settings,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Column(
            children: [
              12.height,
              Item(
                icon: Icons.lock_outline,
                title: AppString.changePassword,
                backgroundColor: AppColors.transparent,
                onTap: () => Get.toNamed(AppRoutes.changePassword),
                horizontal: 6,
                itemColor: AppColors.s_500,
              ),
              12.height,
              Item(
                icon: CupertinoIcons.delete,
                title: AppString.deleteAccount,
                backgroundColor: AppColors.transparent,
                onTap: () => deletePopUp(
                    onTap: () {}, controller: controller.passwordController),
                horizontal: 6,
                itemColor: AppColors.s_500,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
